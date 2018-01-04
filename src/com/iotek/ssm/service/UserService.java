package com.iotek.ssm.service;

import java.util.List;

import com.iotek.ssm.entity.User;

public interface UserService {
	public boolean addUser(User user);
	public boolean delUserById(int uId);
	public boolean updateUser(User user);
	
	public List<User> queryAllUsers();
	public User queryUserById(int uId);
	public User queryUserByName(String uName);
}
