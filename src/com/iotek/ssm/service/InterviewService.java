package com.iotek.ssm.service;

import java.util.List;

import com.iotek.ssm.entity.Interview;

public interface InterviewService {
	public boolean addInterview(Interview interview);
	public boolean delInterviewById(int itId);
	public boolean updateInterview(Interview interview);
	
	public List<Interview> queryAllInterviews();
	public List<Interview> queryDeliverInterviews();
	public Interview queryInterviewById(int itId);
	public Interview queryInterviewByuId(int uId);
}
