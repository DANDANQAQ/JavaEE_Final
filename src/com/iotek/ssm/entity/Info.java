package com.iotek.ssm.entity;

import java.util.Date;

public class Info {
	private int iId;
	private int uId;
	private String realName;
	private String sex;
	private Integer age;
	private String edu;
	private String phone;
	private String email;
	private Department dept;
	private Position position;
	private String politics;
	private String lastJob;
	private Integer workYear;
	private String salaryExp;
	private String hobby;
	private int readed;
	private int type;
	private Date entryTime;
	private String msg;
	public Info() {
		super();
	}
	public Info(int iId, int uId, String realName, String sex, Integer age, String edu, String phone, String email,
			Department dept, Position position, String politics, String lastJob, Integer workYear, String salaryExp,
			String hobby, int readed, int type, Date entryTime, String msg) {
		super();
		this.iId = iId;
		this.uId = uId;
		this.realName = realName;
		this.sex = sex;
		this.age = age;
		this.edu = edu;
		this.phone = phone;
		this.email = email;
		this.dept = dept;
		this.position = position;
		this.politics = politics;
		this.lastJob = lastJob;
		this.workYear = workYear;
		this.salaryExp = salaryExp;
		this.hobby = hobby;
		this.readed = readed;
		this.type = type;
		this.entryTime = entryTime;
		this.msg = msg;
	}
	public int getiId() {
		return iId;
	}
	public void setiId(int iId) {
		this.iId = iId;
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getEdu() {
		return edu;
	}
	public void setEdu(String edu) {
		this.edu = edu;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Department getDept() {
		return dept;
	}
	public void setDept(Department dept) {
		this.dept = dept;
	}
	public Position getPosition() {
		return position;
	}
	public void setPosition(Position position) {
		this.position = position;
	}
	public String getPolitics() {
		return politics;
	}
	public void setPolitics(String politics) {
		this.politics = politics;
	}
	public String getLastJob() {
		return lastJob;
	}
	public void setLastJob(String lastJob) {
		this.lastJob = lastJob;
	}
	public Integer getWorkYear() {
		return workYear;
	}
	public void setWorkYear(Integer workYear) {
		this.workYear = workYear;
	}
	public String getSalaryExp() {
		return salaryExp;
	}
	public void setSalaryExp(String salaryExp) {
		this.salaryExp = salaryExp;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public int getReaded() {
		return readed;
	}
	public void setReaded(int readed) {
		this.readed = readed;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public Date getEntryTime() {
		return entryTime;
	}
	public void setEntryTime(Date entryTime) {
		this.entryTime = entryTime;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	@Override
	public String toString() {
		return "Info [iId=" + iId + ", uId=" + uId + ", realName=" + realName + ", sex=" + sex + ", age=" + age
				+ ", edu=" + edu + ", phone=" + phone + ", email=" + email + ", dept=" + dept + ", position=" + position
				+ ", politics=" + politics + ", lastJob=" + lastJob + ", workYear=" + workYear + ", salaryExp="
				+ salaryExp + ", hobby=" + hobby + ", readed=" + readed + ", type=" + type + ", entryTime=" + entryTime
				+ ", msg=" + msg + "]";
	}
	
}
