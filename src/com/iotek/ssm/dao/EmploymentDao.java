package com.iotek.ssm.dao;

import java.util.List;

import com.iotek.ssm.entity.Employment;

public interface EmploymentDao {
	public int addEmployment(Employment employment);
	public int delEmploymentById(int eId);
	public int updateEmployment(Employment employment);
	
	public List<Employment> queryAllEmployments();
	public List<Employment> queryEmploymentsByDept(int dId);
}
