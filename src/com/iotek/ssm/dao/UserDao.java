package com.iotek.ssm.dao;

import java.util.List;

import com.iotek.ssm.entity.User;

public interface UserDao {
	public int addUser(User user);
	public int delUserById(int uId);
	public int updateUser(User user);
	
	public List<User> queryAllUsers();
	public User queryUserById(int uId);
	public User queryUserByName(String uName);
}
