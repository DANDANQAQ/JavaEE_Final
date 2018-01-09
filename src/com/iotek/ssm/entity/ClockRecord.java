package com.iotek.ssm.entity;

import java.util.Date;

public class ClockRecord {
	private int cId;
	private int uId;
	private int year;
	private int month;
	private int day;
	private Date clockin;
	private Date clockout;
	private int late;
	private int early;
	private int absenteeism;
	public ClockRecord() {
		super();
	}
	public ClockRecord(int cId, int uId, int year, int month, int day, Date clockin, Date clockout, int late, int early,
			int absenteeism) {
		super();
		this.cId = cId;
		this.uId = uId;
		this.year = year;
		this.month = month;
		this.day = day;
		this.clockin = clockin;
		this.clockout = clockout;
		this.late = late;
		this.early = early;
		this.absenteeism = absenteeism;
	}
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
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
	public Date getClockin() {
		return clockin;
	}
	public void setClockin(Date clockin) {
		this.clockin = clockin;
	}
	public Date getClockout() {
		return clockout;
	}
	public void setClockout(Date clockout) {
		this.clockout = clockout;
	}
	public int getLate() {
		return late;
	}
	public void setLate(int late) {
		this.late = late;
	}
	public int getEarly() {
		return early;
	}
	public void setEarly(int early) {
		this.early = early;
	}
	public int getAbsenteeism() {
		return absenteeism;
	}
	public void setAbsenteeism(int absenteeism) {
		this.absenteeism = absenteeism;
	}
	@Override
	public String toString() {
		return "ClockRecord [cId=" + cId + ", uId=" + uId + ", year=" + year + ", month=" + month + ", day=" + day
				+ ", clockin=" + clockin + ", clockout=" + clockout + ", late=" + late + ", early=" + early
				+ ", absenteeism=" + absenteeism + "]";
	}
	
}
