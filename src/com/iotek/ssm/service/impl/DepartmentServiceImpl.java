package com.iotek.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iotek.ssm.dao.DepartmentDao;
import com.iotek.ssm.entity.Department;
import com.iotek.ssm.service.DepartmentService;

@Service("/departmentService")
public class DepartmentServiceImpl implements DepartmentService {
	@Autowired
	private DepartmentDao departmentDao;
	@Override
	public boolean addDepartment(Department dept) {
		if(dept == null) {
			return false;
		}
		int res = departmentDao.addDepartment(dept);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean delDepartmentById(int dId) {
		int res = departmentDao.delDepartmentById(dId);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateDepartment(Department dept) {
		if(dept == null) {
			return false;
		}
		int res = departmentDao.updateDepartment(dept);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public List<Department> queryAllDepts() {
		return departmentDao.queryAllDepts();
	}

	@Override
	public Department queryDeptById(int dId) {
		return departmentDao.queryDeptById(dId);
	}

	@Override
	public Department queryDeptByName(String dName) {
		return departmentDao.queryDeptByName(dName);
	}

}
