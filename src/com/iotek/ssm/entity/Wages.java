package com.iotek.ssm.entity;

public class Wages {
	private int wId;
	private int uId;
	private double realwages;
	private double basicwages;
	private double performance;
	private double overtimewages;
	private double bonus;
	private double forfiet;
	private double social;
	private int year;
	private int month;
	public Wages() {
		super();
	}
	public Wages(int wId, int uId, double realwages, double basicwages, double performance, double overtimewages,
			double bonus, double forfiet, double social, int year, int month) {
		super();
		this.wId = wId;
		this.uId = uId;
		this.realwages = realwages;
		this.basicwages = basicwages;
		this.performance = performance;
		this.overtimewages = overtimewages;
		this.bonus = bonus;
		this.forfiet = forfiet;
		this.social = social;
		this.year = year;
		this.month = month;
	}
	public int getwId() {
		return wId;
	}
	public void setwId(int wId) {
		this.wId = wId;
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public double getRealwages() {
		return realwages;
	}
	public void setRealwages(double realwages) {
		this.realwages = realwages;
	}
	public double getBasicwages() {
		return basicwages;
	}
	public void setBasicwages(double basicwages) {
		this.basicwages = basicwages;
	}
	public double getPerformance() {
		return performance;
	}
	public void setPerformance(double performance) {
		this.performance = performance;
	}
	public double getOvertimewages() {
		return overtimewages;
	}
	public void setOvertimewages(double overtimewages) {
		this.overtimewages = overtimewages;
	}
	public double getBonus() {
		return bonus;
	}
	public void setBonus(double bonus) {
		this.bonus = bonus;
	}
	public double getForfiet() {
		return forfiet;
	}
	public void setForfiet(double forfiet) {
		this.forfiet = forfiet;
	}
	public double getSocial() {
		return social;
	}
	public void setSocial(double social) {
		this.social = social;
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
	@Override
	public String toString() {
		return "Wages [wId=" + wId + ", uId=" + uId + ", realwages=" + realwages + ", basicwages=" + basicwages
				+ ", performance=" + performance + ", overtimewages=" + overtimewages + ", bonus=" + bonus
				+ ", forfiet=" + forfiet + ", social=" + social + ", year=" + year + ", month=" + month + "]";
	}
}
