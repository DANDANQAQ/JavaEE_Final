package com.iotek.ssm.controller;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iotek.ssm.entity.User;
import com.iotek.ssm.service.DepartmentService;
import com.iotek.ssm.service.UserService;
import com.iotek.ssm.util.MyUtil;

@RequestMapping("/user")
@Controller
public class loginController {
	@Autowired
	private UserService userService;
	@Autowired
	private DepartmentService departmentService;
	
	@RequestMapping("loginRegister")
	public String toLoginRegister() {
		return "loginRegister";
	}
	@RequestMapping("/register")
	public String register(Model model,User u) {
		User user = userService.queryUserByName(u.getuName());
		if(user != null) {
			model.addAttribute("registerMsg", "用户名已存在");
		}else {
			boolean addUser = userService.addUser(new User(0, u.getuName(), MyUtil.md5(u.getPassword()), 1));
			if(addUser) {
				model.addAttribute("registerMsg", "注册成功");
			}
		}
		return "loginRegister";
	}
	
	@RequestMapping("/login")
	public String login(Model model,User u,HttpSession session) {
		User user = userService.queryUserByName(u.getuName());
		if(user == null) {
			model.addAttribute("loginMsg", "用户名不存在");
			return "loginRegister";
		}else {
			if(user.getPassword().equals(MyUtil.md5(u.getPassword()))) {
				int type = user.getType();
				session.setAttribute("nowUser", user);
				session.setAttribute("depts", departmentService.queryAllDepts());
				if(type == 0) {
					return "jump/adminJump";
				}else if(type == 1) {
					return "jump/userJump";
				}else if(type == 2) {
					return "jump/employeeJump";
				}else {
					model.addAttribute("loginMsg", "登录异常");
					return "loginRegister";
				}
			}else {
				model.addAttribute("loginMsg", "密码错误");
				return "loginRegister";
			}
		}
	}
	@RequestMapping("/toAdmin")
	public String toAdmin() {
		return "admin/index";
	}
	@RequestMapping("/toEmployee")
	public String toEmployee() {
		return "employee/index";
	}
	@RequestMapping("/toUser")
	public String toUser() {
		return "user/index";
	}
}
