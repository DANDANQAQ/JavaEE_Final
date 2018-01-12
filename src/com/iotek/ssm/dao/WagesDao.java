package com.iotek.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.iotek.ssm.entity.Wages;

public interface WagesDao {
	public int addWages(Wages wages);
	public int updateWages(Wages wages);
	
	public Wages queryWagesByuIdYearMonth
		(@Param("uId")int uId,@Param("year")int year,@Param("month")int month);
	public List<Wages> queryWagesByYearMonth
		(@Param("year")int year,@Param("month")int month);
	public Wages findWagesBywId(int wId);
}
