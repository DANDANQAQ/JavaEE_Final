package com.iotek.ssm.dao;

import java.util.List;

import com.iotek.ssm.entity.WagesRecord;

public interface WagesRecordDao {
	public int addWagesRecord(WagesRecord wr);
	public int updateWagesRecord(WagesRecord wr);
	
	public List<WagesRecord> queryObjectionWagesRecords();
	public WagesRecord queryWagesRecordBywId(int wId);
	public WagesRecord queryWagesRecordBywrId(int wrId);
}
