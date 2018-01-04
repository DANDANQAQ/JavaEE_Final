package com.iotek.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iotek.ssm.entity.User;
import com.iotek.ssm.service.UserService;
import com.iotek.ssm.util.MyUtil;

@RequestMapping("/user")
@Controller
public class loginController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	public String login(Model model,User u) {
		User user = userService.queryUserByName(u.getuName());
		if(user == null) {
			model.addAttribute("loginMsg", "用户名不存在");
			return "redirect:/index.html";
		}else {
			if(user.getPassword().equals(MyUtil.md5(u.getPassword()))) {
				int type = user.getType();
				if(type == 0) {
					return "admin/index";
				}else if(type == 1) {
					return "user/index";
				}else if(type == 2) {
					return "employee/index";
				}else {
					model.addAttribute("loginMsg", "登录异常");
					return "redirect:/index.html";
				}
			}else {
				model.addAttribute("loginMsg", "密码错误");
				return "redirect:/index.html";
			}
		}
	}
}
