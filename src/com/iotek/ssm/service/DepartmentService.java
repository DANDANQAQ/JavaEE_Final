package com.iotek.ssm.service;

import java.util.List;

import com.iotek.ssm.entity.Department;

public interface DepartmentService {
	public boolean addDepartment(Department dept);
	public boolean delDepartmentById(int dId);
	public boolean updateDepartment(Department dept);
	
	public List<Department> queryAllDepts();
	public Department queryDeptById(int dId);
	public Department queryDeptByName(String dName);
}
