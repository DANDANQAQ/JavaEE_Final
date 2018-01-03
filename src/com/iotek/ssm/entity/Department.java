package com.iotek.ssm.entity;

import java.util.Date;
import java.util.List;

public class Department {
	private int dId;
	private String dName;
	private Date createTime;
	private List<Position> positions;
	public Department() {
		super();
	}
	public Department(int dId, String dName, Date createTime, List<Position> positions) {
		super();
		this.dId = dId;
		this.dName = dName;
		this.createTime = createTime;
		this.positions = positions;
	}
	public int getdId() {
		return dId;
	}
	public void setdId(int dId) {
		this.dId = dId;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public List<Position> getPositions() {
		return positions;
	}
	public void setPositions(List<Position> positions) {
		this.positions = positions;
	}
	@Override
	public String toString() {
		return "Department [dId=" + dId + ", dName=" + dName + ", createTime=" + createTime + ", positions=" + positions
				+ "]";
	}
	
}
