package com.iotek.ssm.entity;

import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.annotation.JSONField;

public class Department {
	@JSONField(name="did")
	private int dId;
	@JSONField(name="dname")
	private String dName;
	@JSONField(name="createtime")
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
	@JSONField(name="did")
	public int getdId() {
		return dId;
	}
	@JSONField(name="did")
	public void setdId(int dId) {
		this.dId = dId;
	}
	@JSONField(name="dname")
	public String getdName() {
		return dName;
	}
	@JSONField(name="dname")
	public void setdName(String dName) {
		this.dName = dName;
	}
	@JSONField(name="createtime")
	public Date getCreateTime() {
		return createTime;
	}
	@JSONField(name="createtime")
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
