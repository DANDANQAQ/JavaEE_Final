package com.iotek.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iotek.ssm.dao.TrainDao;
import com.iotek.ssm.entity.Train;
import com.iotek.ssm.service.TrainService;

@Service("trainService")
public class TrainServiceImpl implements TrainService {
	@Autowired
	private TrainDao trainDao;
	@Override
	public boolean addTrain(Train train) {
		if(train == null) {
			return false;
		}
		int res = trainDao.addTrain(train);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean delTrainById(int tId) {
		int res = trainDao.delTrainById(tId);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateTrain(Train train) {
		if(train == null) {
			return false;
		}
		int res = trainDao.updateTrain(train);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public List<Train> queryAllTrains() {
		return trainDao.queryAllTrains();
	}

	@Override
	public List<Train> queryTrainsBydId(int dId) {
		return trainDao.queryTrainsBydId(dId);
	}

	@Override
	public Train queryTrainBytId(int tId) {
		return trainDao.queryTrainBytId(tId);
	}

}
