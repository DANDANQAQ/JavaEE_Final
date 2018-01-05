package com.iotek.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iotek.ssm.dao.InfoDao;
import com.iotek.ssm.entity.Info;
import com.iotek.ssm.service.InfoService;

@Service("infoService")
public class InfoServiceImpl implements InfoService {
	@Autowired
	private InfoDao infoDao;
	@Override
	public boolean addInfo(Info info) {
		if(info == null) {
			return false;
		}
		int res = infoDao.addInfo(info);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean delInfoById(int iId) {
		int res = infoDao.delInfoById(iId);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateInfo(Info info) {
		if(info == null) {
			return false;
		}
		int res = infoDao.updateInfo(info);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public List<Info> queryAllInfos() {
		return infoDao.queryAllInfos();
	}

	@Override
	public Info queryInfoByuId(int uId) {
		return infoDao.queryInfoByuId(uId);
	}

	@Override
	public Info queryUserInfoByuId(int uId) {
		return infoDao.queryUserInfoByuId(uId);
	}

}
