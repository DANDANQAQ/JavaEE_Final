package com.iotek.ssm.entity;

import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.annotation.JSONField;

public class Position {
	@JSONField(name="pid")
	private int pId;
	@JSONField(name="pname")
	private String pName;
	@JSONField(name="did")
	private int dId;
	@JSONField(name="time")
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
	@JSONField(name="pid")
	public int getpId() {
		return pId;
	}
	@JSONField(name="pid")
	public void setpId(int pId) {
		this.pId = pId;
	}
	@JSONField(name="pname")
	public String getpName() {
		return pName;
	}
	@JSONField(name="pname")
	public void setpName(String pName) {
		this.pName = pName;
	}
	@JSONField(name="did")
	public int getdId() {
		return dId;
	}
	@JSONField(name="did")
	public void setdId(int dId) {
		this.dId = dId;
	}
	@JSONField(name="time")
	public Date getCreateTime() {
		return createTime;
	}
	@JSONField(name="time")
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
