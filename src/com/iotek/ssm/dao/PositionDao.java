package com.iotek.ssm.dao;

import com.iotek.ssm.entity.Position;

public interface PositionDao {
	public int addPosition(Position position);
	public int delPositionById(int pId);
	public int updatePosition(Position position);
	public Position queryPositById(int pId);
}
