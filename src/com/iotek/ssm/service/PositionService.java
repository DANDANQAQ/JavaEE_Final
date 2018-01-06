package com.iotek.ssm.service;

import com.iotek.ssm.entity.Position;

public interface PositionService {
	public boolean addPosition(Position position);
	public boolean delPositionById(int pId);
	public boolean updatePosition(Position position);
	public Position queryPositById(int pId);
}
