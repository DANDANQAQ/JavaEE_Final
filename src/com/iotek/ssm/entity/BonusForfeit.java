package com.iotek.ssm.entity;

public class BonusForfeit {
	private int bfId;
	private int uId;
	private int year;
	private int month;
	private int day;
	private int type;
	private double money;
	private String msg;
	public BonusForfeit() {
		super();
	}
	public BonusForfeit(int bfId, int uId, int year, int month, int day, int type, double money, String msg) {
		super();
		this.bfId = bfId;
		this.uId = uId;
		this.year = year;
		this.month = month;
		this.day = day;
		this.type = type;
		this.money = money;
		this.msg = msg;
	}
	public int getBfId() {
		return bfId;
	}
	public void setBfId(int bfId) {
		this.bfId = bfId;
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	@Override
	public String toString() {
		return "BonusForfeit [bfId=" + bfId + ", uId=" + uId + ", year=" + year + ", month=" + month + ", day=" + day
				+ ", type=" + type + ", money=" + money + ", msg=" + msg + "]";
	}
	
}
