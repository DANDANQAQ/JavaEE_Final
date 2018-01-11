package com.iotek.ssm.service;

import java.util.List;

import com.iotek.ssm.entity.BonusForfeit;

public interface BonusForfeitService {
	public boolean addBF(BonusForfeit bf);
	public List<BonusForfeit> queryBFsByUser(int uId,int year,int month);
	public List<BonusForfeit> queryBFsByMonth(int year,int month);
}
