package com.iotek.ssm.entity;

import java.util.Date;

public class Interview {
	private int itId;
	private int uId;
	private int iId;
	private int deliver;
	private Date deliverTime;
	private int readed;
	private int invited;
	private String invitedTime;
	private int interview;
	private int enroll;
	public Interview() {
		super();
	}
	public Interview(int itId, int uId, int iId, int deliver, Date deliverTime, int readed, int invited,
			String invitedTime, int interview, int enroll) {
		super();
		this.itId = itId;
		this.uId = uId;
		this.iId = iId;
		this.deliver = deliver;
		this.deliverTime = deliverTime;
		this.readed = readed;
		this.invited = invited;
		this.invitedTime = invitedTime;
		this.interview = interview;
		this.enroll = enroll;
	}
	public int getItId() {
		return itId;
	}
	public void setItId(int itId) {
		this.itId = itId;
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public int getiId() {
		return iId;
	}
	public void setiId(int iId) {
		this.iId = iId;
	}
	public int getDeliver() {
		return deliver;
	}
	public void setDeliver(int deliver) {
		this.deliver = deliver;
	}
	public Date getDeliverTime() {
		return deliverTime;
	}
	public void setDeliverTime(Date deliverTime) {
		this.deliverTime = deliverTime;
	}
	public int getReaded() {
		return readed;
	}
	public void setReaded(int readed) {
		this.readed = readed;
	}
	public int getInvited() {
		return invited;
	}
	public void setInvited(int invited) {
		this.invited = invited;
	}
	public String getInvitedTime() {
		return invitedTime;
	}
	public void setInvitedTime(String invitedTime) {
		this.invitedTime = invitedTime;
	}
	public int getInterview() {
		return interview;
	}
	public void setInterview(int interview) {
		this.interview = interview;
	}
	public int getEnroll() {
		return enroll;
	}
	public void setEnroll(int enroll) {
		this.enroll = enroll;
	}
	@Override
	public String toString() {
		return "Interview [itId=" + itId + ", uId=" + uId + ", iId=" + iId + ", deliver=" + deliver + ", deliverTime="
				+ deliverTime + ", readed=" + readed + ", invited=" + invited + ", invitedTime=" + invitedTime
				+ ", interview=" + interview + ", enroll=" + enroll + "]";
	}
	
}
