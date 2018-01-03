package com.iotek.ssm.entity;

public class User {
	private int uId;
	private String uName;
	private String password;
	private int type;
	public User() {
		super();
	}
	public User(int uId, String uName, String password, int type) {
		super();
		this.uId = uId;
		this.uName = uName;
		this.password = password;
		this.type = type;
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}

}
