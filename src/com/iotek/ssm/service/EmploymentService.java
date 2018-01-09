package com.iotek.ssm.service;

import java.util.List;

import com.iotek.ssm.entity.Employment;

public interface EmploymentService {
	public boolean addEmployment(Employment employment);
	public boolean delEmploymentById(int eId);
	public boolean updateEmployment(Employment employment);
	
	public List<Employment> queryAllEmployments();
	public List<Employment> queryEmploymentsByDept(int dId);
}
