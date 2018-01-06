package com.iotek.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iotek.ssm.dao.PositionDao;
import com.iotek.ssm.entity.Position;
import com.iotek.ssm.service.PositionService;

@Service("positionService")
public class PositionServiceImpl implements PositionService{
	@Autowired
	private PositionDao positionDao;
	@Override
	public boolean addPosition(Position position) {
		if(position == null) {
			return false;
		}
		int res = positionDao.addPosition(position);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean delPositionById(int pId) {
		int res = positionDao.delPositionById(pId);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updatePosition(Position position) {
		if(position == null) {
			return false;
		}
		int res = positionDao.updatePosition(position);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public Position queryPositById(int pId) {
		return positionDao.queryPositById(pId);
	}

}
