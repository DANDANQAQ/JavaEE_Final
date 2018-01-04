package com.iotek.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iotek.ssm.dao.UserDao;
import com.iotek.ssm.entity.User;
import com.iotek.ssm.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	@Override
	public boolean addUser(User user) {
		if(user == null) {
			return false;
		}
		int res = userDao.addUser(user);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean delUserById(int uId) {
		int res = userDao.delUserById(uId);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateUser(User user) {
		if(user == null) {
			return false;
		}
		int res = userDao.updateUser(user);
		if(res == 1) {
			return true;
		}
		return false;
	}

	@Override
	public List<User> queryAllUsers() {
		return userDao.queryAllUsers();
	}

	@Override
	public User queryUserById(int uId) {
		return userDao.queryUserById(uId);
	}

	@Override
	public User queryUserByName(String uName) {
		return userDao.queryUserByName(uName);
	}

}
