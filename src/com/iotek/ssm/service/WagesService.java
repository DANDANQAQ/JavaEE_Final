package com.iotek.ssm.service;

import java.util.List;

import com.iotek.ssm.entity.Wages;

public interface WagesService {
	public boolean addWages(Wages wages);
	public boolean updateWages(Wages wages);
	public Wages findWagesByuIdYearMonth(int uId,int year,int month);
	public List<Wages> findWagesByYearMonth(int year,int month);
}
