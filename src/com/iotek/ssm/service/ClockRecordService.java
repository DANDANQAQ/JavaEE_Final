package com.iotek.ssm.service;

import java.util.List;

import com.iotek.ssm.entity.ClockRecord;

public interface ClockRecordService {	
	public boolean canClockin(int uId);
	public boolean canClockout(int uId);
	
	public boolean clockin(int uId);
	public boolean clockout(int uId);
	
	public List<ClockRecord> getClockRecordsForMonth(int uId,int year,int month);
	public int getAbsenteeismDays(int uId,int year,int month);
}
