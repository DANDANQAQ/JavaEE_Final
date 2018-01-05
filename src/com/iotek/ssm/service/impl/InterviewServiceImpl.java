package com.iotek.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iotek.ssm.dao.InterviewDao;
import com.iotek.ssm.entity.Interview;
import com.iotek.ssm.service.InterviewService;

@Service("interviewService")
public class InterviewServiceImpl implements InterviewService {
	@Autowired
	private InterviewDao interviewDao;
	@Override
	public boolean addInterview(Interview interview) {
		if(interview == null) {
			return false;
		}
		int res = interviewDao.addInterview(interview);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean delInterviewById(int itId) {
		int res = interviewDao.delInterviewById(itId);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateInterview(Interview interview) {
		if(interview == null) {
			return false;
		}
		int res = interviewDao.updateInterview(interview);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public List<Interview> queryAllInterviews() {
		return interviewDao.queryAllInterviews();
	}

	@Override
	public List<Interview> queryDeliverInterviews() {
		return interviewDao.queryDeliverInterviews();
	}

	@Override
	public Interview queryInterviewById(int itId) {
		return interviewDao.queryInterviewById(itId);
	}

	@Override
	public Interview queryInterviewByuId(int uId) {
		return interviewDao.queryInterviewByuId(uId);
	}

}
