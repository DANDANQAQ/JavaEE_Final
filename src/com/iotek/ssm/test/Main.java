package com.iotek.ssm.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.iotek.ssm.dao.DepartmentDao;
import com.iotek.ssm.dao.PositionDao;
import com.iotek.ssm.dao.UserDao;
import com.iotek.ssm.entity.Department;
import com.iotek.ssm.entity.Position;
import com.iotek.ssm.entity.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class Main {
	@Autowired
	private UserDao userDao;
	@Autowired
	private DepartmentDao departmentDao;
	@Autowired
	private PositionDao positionDao;
	@Test
	public void test() {
	//	userDao.addUser(new User(0, "dandan", "change941221"));
	//	System.out.println(userDao.updateUser(new User(2, "dan", "123123")));
		List<User> users = userDao.queryAllUsers();
		System.out.println(users);
		System.out.println(userDao.queryUserById(1));
		System.out.println(userDao.queryUserByName("dandan"));
		
	}
	
	@Test
	public void test2() {
		List<Department> depts = departmentDao.queryAllDepts();
		System.out.println(depts);
	}
	@Test
	public void Test3() {
		Position position = positionDao.queryPositById(2);
		System.out.println(position.getEmployees());
	}
}
