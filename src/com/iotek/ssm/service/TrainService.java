package com.iotek.ssm.service;

import java.util.List;

import com.iotek.ssm.entity.Train;

public interface TrainService {
	public boolean addTrain(Train train);
	public boolean delTrainById(int tId);
	public boolean updateTrain(Train train);
	
	public List<Train> queryAllTrains();
	public List<Train> queryTrainsBydId(int dId);
	public Train queryTrainBytId(int tId);
}
