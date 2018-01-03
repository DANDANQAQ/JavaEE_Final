package com.iotek.ssm.dao;

import java.util.List;

import com.iotek.ssm.entity.Department;

public interface DepartmentDao {
	public int addDepartment(Department dept);
	public int delDepartmentById(int dId);
	public int updateDepartment(Department dept);
	
	public List<Department> queryAllDepts();
	public Department queryDeptById(int dId);
	public Department queryDeptByName(String dName);
}
