package com.iotek.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.iotek.ssm.entity.BonusForfeit;

public interface BonusForfeitDao {
	public int addBF(BonusForfeit bf);
	public List<BonusForfeit> queryBFsByUser
		(@Param("uId")int uId,@Param("year")int year,
			@Param("month")int month);
	public List<BonusForfeit> queryBFsByMonth
		(@Param("year")int year,@Param("month")int month);
}
