package com.iotek.ssm.service;

import java.util.List;

import com.iotek.ssm.entity.WagesRecord;

public interface WagesRecordService {
	public boolean addWagesRecord(WagesRecord wr);
	public boolean updateWagesRecord(WagesRecord wr);
	
	public List<WagesRecord> queryObjectionWagesRecords();
	public WagesRecord queryWagesRecordBywId(int wId);
	public WagesRecord queryWagesRecordBywrId(int wrId);
}
