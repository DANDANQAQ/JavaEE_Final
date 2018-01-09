package com.iotek.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iotek.ssm.dao.WagesDao;
import com.iotek.ssm.entity.Wages;
import com.iotek.ssm.service.WagesService;

@Service("wagesService")
public class WagesServiceImpl implements WagesService {
	@Autowired
	private WagesDao wagesDao;
	@Override
	public boolean addWages(Wages wages) {
		if(wages == null) {
			return false;
		}
		int res = wagesDao.addWages(wages);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateWages(Wages wages) {
		if(wages == null) {
			return false;
		}
		int res = wagesDao.updateWages(wages);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public Wages findWagesByuIdYearMonth(int uId, int year, int month) {
		return wagesDao.queryWagesByuIdYearMonth(uId, year, month-1);
	}

	@Override
	public List<Wages> findWagesByYearMonth(int year, int month) {
		return wagesDao.queryWagesByYearMonth(year, month-1);
	}

}
