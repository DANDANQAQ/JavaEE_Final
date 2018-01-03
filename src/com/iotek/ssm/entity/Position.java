package com.iotek.ssm.entity;

import java.util.Date;
import java.util.List;

public class Position {
	private int pId;
	private String pName;
	private int dId;
	private Date createTime;
	private List<Info> employees;
	public Position() {
		super();
	}
	public Position(int pId, String pName, int dId, Date createTime, List<Info> employees) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.dId = dId;
		this.createTime = createTime;
		this.employees = employees;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getdId() {
		return dId;
	}
	public void setdId(int dId) {
		this.dId = dId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public List<Info> getEmployees() {
		return employees;
	}
	public void setEmployees(List<Info> employees) {
		this.employees = employees;
	}
	@Override
	public String toString() {
		return "Position [pId=" + pId + ", pName=" + pName + ", dId=" + dId + ", createTime=" + createTime + "]";
	}
	
}
