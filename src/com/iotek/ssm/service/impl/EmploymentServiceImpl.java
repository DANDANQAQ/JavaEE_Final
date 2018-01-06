package com.iotek.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iotek.ssm.dao.EmploymentDao;
import com.iotek.ssm.entity.Employment;
import com.iotek.ssm.service.EmploymentService;

@Service("employmentService")
public class EmploymentServiceImpl implements EmploymentService {
	@Autowired
	private EmploymentDao employmentDao;
	@Override
	public boolean addEmployment(Employment employment) {
		if(employment == null) {
			return false;
		}
		int res = employmentDao.addEmployment(employment);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean delEmploymentById(int eId) {
		int res = employmentDao.delEmploymentById(eId);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateEmployment(Employment employment) {
		if(employment == null) {
			return false;
		}
		int res = employmentDao.updateEmployment(employment);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public List<Employment> queryAllEmployments() {
		return employmentDao.queryAllEmployments();
	}

}
