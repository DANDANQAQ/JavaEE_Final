package com.iotek.ssm.entity;

public class WagesRecord {
	private int wrId;
	private int uId;
	private int wId;
	private int pay;
	private int objection;
	private String msg;
	private int dismissObjection;
	public WagesRecord() {
		super();
	}
	public WagesRecord(int wrId, int uId, int wId, int pay, int objection, String msg, int dismissObjection) {
		super();
		this.wrId = wrId;
		this.uId = uId;
		this.wId = wId;
		this.pay = pay;
		this.objection = objection;
		this.msg = msg;
		this.dismissObjection = dismissObjection;
	}
	public int getWrId() {
		return wrId;
	}
	public void setWrId(int wrId) {
		this.wrId = wrId;
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public int getwId() {
		return wId;
	}
	public void setwId(int wId) {
		this.wId = wId;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getObjection() {
		return objection;
	}
	public void setObjection(int objection) {
		this.objection = objection;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getDismissObjection() {
		return dismissObjection;
	}
	public void setDismissObjection(int dismissObjection) {
		this.dismissObjection = dismissObjection;
	}
	@Override
	public String toString() {
		return "WagesRecord [wrId=" + wrId + ", uId=" + uId + ", wId=" + wId + ", pay=" + pay + ", objection="
				+ objection + ", msg=" + msg + ", dismissObjection=" + dismissObjection + "]";
	}
	
}
