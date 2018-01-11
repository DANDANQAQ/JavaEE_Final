package com.iotek.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iotek.ssm.dao.BonusForfeitDao;
import com.iotek.ssm.entity.BonusForfeit;
import com.iotek.ssm.service.BonusForfeitService;

@Service("bonusForfeitService")
public class BonusForfeitServiceImpl implements BonusForfeitService {
	@Autowired
	private BonusForfeitDao bfDao;
	@Override
	public boolean addBF(BonusForfeit bf) {
		if(bf == null) {
			return false;
		}
		int res = bfDao.addBF(bf);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public List<BonusForfeit> queryBFsByUser(int uId, int year, int month) {
		return bfDao.queryBFsByUser(uId, year, month-1);
	}

	@Override
	public List<BonusForfeit> queryBFsByMonth(int year, int month) {
		return bfDao.queryBFsByMonth(year, month-1);
	}

}
