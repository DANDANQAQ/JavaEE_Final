package com.iotek.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iotek.ssm.dao.WagesRecordDao;
import com.iotek.ssm.entity.WagesRecord;
import com.iotek.ssm.service.WagesRecordService;

@Service("wagesRecordService")
public class WagesRecordServiceImpl implements WagesRecordService {
	@Autowired
	private WagesRecordDao wrDao;
	@Override
	public boolean addWagesRecord(WagesRecord wr) {
		if(wr == null) {
			return false;
		}
		int res = wrDao.addWagesRecord(wr);
		if(res == 1){
			return true;
		}
		return false;
	}

	@Override
	public boolean updateWagesRecord(WagesRecord wr) {
		if(wr == null) {
			return false;
		}
		int res = wrDao.updateWagesRecord(wr);
		if(res == 1){
			return true;
		}
		return false;
	}

	@Override
	public List<WagesRecord> queryObjectionWagesRecords() {
		return wrDao.queryObjectionWagesRecords();
	}

	@Override
	public WagesRecord queryWagesRecordBywId(int wId) {
		return wrDao.queryWagesRecordBywId(wId);
	}

	@Override
	public WagesRecord queryWagesRecordBywrId(int wrId) {
		return wrDao.queryWagesRecordBywrId(wrId);
	}

}
