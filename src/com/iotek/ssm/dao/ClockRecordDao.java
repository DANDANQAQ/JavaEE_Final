package com.iotek.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.iotek.ssm.entity.ClockRecord;

public interface ClockRecordDao {
	public int addClockRecord(ClockRecord clock);
	public int updateClockRecord(ClockRecord clock);
	
	public List<ClockRecord> 
		queryClockRecordsByuIdYearMonth
			(@Param("uId")int uId,@Param("year")int year,
					@Param("month")int month);
	public ClockRecord 
		queryClockRecordByuIdYearMonthDay
			(@Param("uId")int uId,@Param("year")int year,
					@Param("month")int month,@Param("day")int day);
	public List<ClockRecord> 
		getAbsenteeismDays
			(@Param("uId")int uId,@Param("year")int year,
					@Param("month")int month);
}
