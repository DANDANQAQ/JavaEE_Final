package com.iotek.ssm.service;

import java.util.List;

import com.iotek.ssm.entity.Info;

public interface InfoService {
	public boolean addInfo(Info info);
	public boolean delInfoById(int iId);
	public boolean updateInfo(Info info);
	
	public List<Info> queryAllInfos();
	public Info queryInfoByuId(int uId);
	public Info queryUserInfoByuId(int uId);
}
