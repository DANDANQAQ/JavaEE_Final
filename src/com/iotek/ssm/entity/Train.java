package com.iotek.ssm.entity;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class Train {
	@JSONField(name="tid")
	private int tId;
	@JSONField(name="tname")
	private String tName;
	@JSONField(name="ttime")
	private Date tTime;
	private Department department;
	public Train() {
		super();
	}
	public Train(int tId, String tName, Date tTime, Department department) {
		super();
		this.tId = tId;
		this.tName = tName;
		this.tTime = tTime;
		this.department = department;
	}
	@JSONField(name="tid")
	public int gettId() {
		return tId;
	}
	@JSONField(name="tid")
	public void settId(int tId) {
		this.tId = tId;
	}
	@JSONField(name="tname")
	public String gettName() {
		return tName;
	}
	@JSONField(name="tname")
	public void settName(String tName) {
		this.tName = tName;
	}
	@JSONField(name="ttime")
	public Date gettTime() {
		return tTime;
	}
	@JSONField(name="ttime")
	public void settTime(Date tTime) {
		this.tTime = tTime;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	@Override
	public String toString() {
		return "Train [tId=" + tId + ", tName=" + tName + ", tTime=" + tTime + ", department=" + department + "]";
	}
	
}
