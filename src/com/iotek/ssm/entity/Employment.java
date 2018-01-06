package com.iotek.ssm.entity;

import java.util.Date;

public class Employment {
	private int eId;
	private Department department;
	private Position position;
	private String requirement;
	private Date deliverTime;
	public Employment() {
		super();
	}
	public Employment(int eId, Department department, Position position, String requirement, Date deliverTime) {
		super();
		this.eId = eId;
		this.department = department;
		this.position = position;
		this.requirement = requirement;
		this.deliverTime = deliverTime;
	}
	public int geteId() {
		return eId;
	}
	public void seteId(int eId) {
		this.eId = eId;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public Position getPosition() {
		return position;
	}
	public void setPosition(Position position) {
		this.position = position;
	}
	public String getRequirement() {
		return requirement;
	}
	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}
	public Date getDeliverTime() {
		return deliverTime;
	}
	public void setDeliverTime(Date deliverTime) {
		this.deliverTime = deliverTime;
	}
	@Override
	public String toString() {
		return "Employment [eId=" + eId + ", department=" + department + ", position=" + position + ", requirement="
				+ requirement + ", deliverTime=" + deliverTime + "]";
	}
	
}
