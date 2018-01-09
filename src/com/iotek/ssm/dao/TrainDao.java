package com.iotek.ssm.dao;

import java.util.List;

import com.iotek.ssm.entity.Train;

public interface TrainDao {
	public int addTrain(Train train);
	public int delTrainById(int tId);
	public int updateTrain(Train train);
	
	public List<Train> queryAllTrains();
	public List<Train> queryTrainsBydId(int dId);
	public Train queryTrainBytId(int tId);
}
