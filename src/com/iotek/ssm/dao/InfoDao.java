package com.iotek.ssm.dao;

import java.util.List;

import com.iotek.ssm.entity.Info;

public interface InfoDao {
	public int addInfo(Info info);
	public int delInfoById(int iId);
	public int updateInfo(Info info);
	
	public Info queryInfoByuId(int uId);
	public List<Info> queryInfosByServingStaff();
	public List<Info> queryInfosByNotServingStaff();
	public List<Info> queryInfosByServingStaffAndDept(int dId);
}
