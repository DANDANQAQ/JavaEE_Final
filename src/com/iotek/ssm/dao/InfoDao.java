package com.iotek.ssm.dao;

import java.util.List;

import com.iotek.ssm.entity.Info;

public interface InfoDao {
	public int addInfo(Info info);
	public int delInfoById(int iId);
	public int updateInfo(Info info);
	
	public List<Info> queryAllInfos();
	public Info queryInfoByuId(int uId);
}
