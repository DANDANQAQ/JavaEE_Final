package com.iotek.ssm.dao;

import java.util.List;

import com.iotek.ssm.entity.Interview;

public interface InterviewDao {
	public int addInterview(Interview interview);
	public int delInterviewById(int itId);
	public int updateInterview(Interview interview);
	
	public List<Interview> queryAllInterviews();
	public List<Interview> queryDeliverInterviews();
	public Interview queryInterviewById(int itId);
	public Interview queryInterviewByuId(int uId);
}
