package com.iotek.ssm.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iotek.ssm.dao.ClockRecordDao;
import com.iotek.ssm.entity.BonusForfeit;
import com.iotek.ssm.entity.ClockRecord;
import com.iotek.ssm.entity.Wages;
import com.iotek.ssm.service.BonusForfeitService;
import com.iotek.ssm.service.ClockRecordService;
import com.iotek.ssm.service.WagesService;

@Service("clockRecordService")
public class ClockRecordServiceImpl implements ClockRecordService {
	@Autowired
	private ClockRecordDao clockRecordDao;
	@Autowired
	private WagesService wagesService;
	@Autowired
	private BonusForfeitService bfService;
	@Override
	public boolean canClockin(int uId) {
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH);
		int day = now.get(Calendar.DAY_OF_MONTH);
		int hour = now.get(Calendar.HOUR_OF_DAY);
		if(hour < 6) {
			return false;
		}
		ClockRecord record = clockRecordDao.queryClockRecordByuIdYearMonthDay(uId, year, month, day);
		if(record == null) {
			record = new ClockRecord(0, uId, year, month, day, null, null, 0, 0, 0);
			clockRecordDao.addClockRecord(record);
			return true;
		}else {
			Date clockin = record.getClockin();
			if(clockin == null) {
				return true;
			}else {
				return false;
			}
		}
	}

	@Override
	public boolean canClockout(int uId) {
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH);
		int day = now.get(Calendar.DAY_OF_MONTH);
		int hour = now.get(Calendar.HOUR_OF_DAY);
		if(hour < 9) {
			return false;
		}
		ClockRecord record = clockRecordDao.queryClockRecordByuIdYearMonthDay(uId, year, month, day);
		if(record == null) {
			record = new ClockRecord(0, uId, year, month, day, null, null, 0, 0, 0);
			clockRecordDao.addClockRecord(record);
			return false;
		}else {
			if(record.getClockin() == null) {
				return false;
			}else {
				if(record.getClockout() == null) {
					return true;
				}else {
					return false;
				}
			}
		}
	}

	@Override
	public boolean clockin(int uId) {
		boolean canClockin = canClockin(uId);
		if(!canClockin) {
			return false;
		}
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH);
		int day = now.get(Calendar.DAY_OF_MONTH);
		int hour = now.get(Calendar.HOUR_OF_DAY);
		ClockRecord record = clockRecordDao.queryClockRecordByuIdYearMonthDay(uId, year, month, day);
		record.setClockin(new Date());
		int late = hour - 9;
		if(late > 1) {
			record.setLate(late);
		}
		if(late == 0) {
			int minute = now.get(Calendar.MINUTE);
			if(minute > 0) {
				record.setLate(1);
			}
		}
		clockRecordDao.updateClockRecord(record);
		return true;
	}

	@Override
	public boolean clockout(int uId) {
		boolean canClockout = canClockout(uId);
		if(!canClockout) {
			return false;
		}
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH);
		int day = now.get(Calendar.DAY_OF_MONTH);
		int hour = now.get(Calendar.HOUR_OF_DAY);
		ClockRecord record = clockRecordDao.queryClockRecordByuIdYearMonthDay(uId, year, month, day);
		record.setClockout(new Date());
		record.setAbsenteeism(1);
		int late = record.getLate();
		int early = 18 - hour;
		int overtimewages = 0;
		if(early > 0) {
			record.setEarly(early);
		}else {
			overtimewages = -80 * early;
		}
		clockRecordDao.updateClockRecord(record);
		//下班打卡成功，结算工资
		Wages wages = wagesService.findWagesByuIdYearMonth(uId, year, month);
		if(wages == null) {
			wages = new Wages(0, uId, 0, 0, 0, 0, 0, 0, 0, year, month);
			wagesService.addWages(wages);
		}
		wages.setOvertimewages(overtimewages);
		wages.setBasicwages(wages.getBasicwages()+400);
		int lateEarly = late + early;
		double forfiet = 0;
		if(lateEarly > 2) {
			forfiet = -400;
		}else {
			forfiet = lateEarly * (-100);
		}
		if(lateEarly > 0) {	//添加惩罚记录
			String msg = "迟到早退";
			bfService.addBF(new BonusForfeit(0, uId, year, month, day, 0, forfiet, msg));
		}
		wages.setForfiet(wages.getForfiet()+forfiet);
		double total = wages.getBasicwages()+wages.getBonus()+wages.getForfiet()+wages.getOvertimewages()+wages.getPerformance();
		if(total > 0) {
			wages.setSocial(wages.getBasicwages()*(-0.1));
		}
		wages.setRealwages(total+wages.getSocial());
		wagesService.updateWages(wages);
		return true;
	}

	@Override
	public List<ClockRecord> getClockRecordsForMonth(int uId, int year, int month) {
		return clockRecordDao.queryClockRecordsByuIdYearMonth(uId, year, month-1);
	}

	@Override
	public int getAbsenteeismDays(int uId, int year, int month) {
		int days = clockRecordDao.getAbsenteeismDays(uId, year, month-1).size();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		Calendar calendar = Calendar.getInstance();  
		try {
			calendar.setTime(sdf.parse(year+"-"+month+"-1"));
		} catch (ParseException e) {
			e.printStackTrace();
		}  
		int actualMaximum = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		return actualMaximum-days;
	}

}
