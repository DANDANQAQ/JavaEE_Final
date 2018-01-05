package com.iotek.ssm.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.iotek.ssm.entity.Department;
import com.iotek.ssm.entity.Info;
import com.iotek.ssm.entity.Interview;
import com.iotek.ssm.entity.Position;
import com.iotek.ssm.entity.User;
import com.iotek.ssm.service.DepartmentService;
import com.iotek.ssm.service.InfoService;
import com.iotek.ssm.service.InterviewService;
import com.iotek.ssm.service.UserService;
import com.iotek.ssm.util.MyUtil;

@RequestMapping("/user")
@Controller
public class loginController {
	@Autowired
	private UserService userService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private InfoService infoService;
	@Autowired
	private InterviewService interviewService;
	@RequestMapping("saveInterview")
	public String saveInterview(Model model, Info info, int dId, int pId, HttpSession session) {
		String realName = info.getRealName();
		String sex = info.getSex();
		Integer age = info.getAge();
		String edu = info.getEdu();
		String phone = info.getPhone();
		String email = info.getEmail();
		Department department = null;
		Position position = null;
		String politics = info.getPolitics();
		String lastJob = info.getLastJob();
		Integer workYear = info.getWorkYear();
		String salaryExp = info.getSalaryExp();
		String hobby = info.getHobby();
		User user = (User) session.getAttribute("nowUser");
		int uId = user.getuId();
		if(dId != 0 && pId != 0) {
			department = new Department(dId, null, null, null);
			position = new Position(pId, null, dId, null, null);
			Interview interview = interviewService.queryInterviewByuId(uId);
			interview.setDeliver(1);
			interview.setDeliverTime(new Date());
			interviewService.updateInterview(interview);
		}
		Info infoByuId = infoService.queryUserInfoByuId(uId);
		int iId = infoByuId.getiId();
		int type = infoByuId.getType();
		int readed = infoByuId.getReaded();
		Date entryTime = infoByuId.getEntryTime();
		String msg = infoByuId.getMsg();
		boolean updateInfo = infoService.updateInfo(new Info(iId, uId, realName, sex, age, edu, phone, email, department, position, politics, lastJob, workYear, salaryExp, hobby, readed, type, entryTime, msg));
		if(updateInfo) {
			int deliver = interviewService.queryInterviewByuId(uId).getDeliver();
			if(deliver == 1) {
				Info queryInfoByuId = infoService.queryInfoByuId(uId);
				session.setAttribute("info", queryInfoByuId);
			}else {
				session.setAttribute("info", infoService.queryUserInfoByuId(uId));
			}
			return "user/index";
		}
		return null;
	}
	@RequestMapping(value="invitedAjax",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String invitedAjax(Integer uId,String invitedTime) {
		if(uId == null || invitedTime == null) {
			return null;
		}
		Interview interview = interviewService.queryInterviewByuId(uId);
		interview.setInvited(1);
		interview.setInvitedTime(invitedTime);
		interviewService.updateInterview(interview);
		return "success";
	}
	@RequestMapping(value="findInfoAjax",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String findInfoAjax(Integer uId) {
		if(uId == null) {
			return null;
		}
		Interview interview = interviewService.queryInterviewByuId(uId);
		interview.setReaded(1);
		interviewService.updateInterview(interview);
		
		Info info = infoService.queryInfoByuId(uId);
		info.setReaded(1);
		infoService.updateInfo(info);
		String jsonString = JSON.toJSONString(info);
		return jsonString;
	}
	@RequestMapping(value="choiceDept",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String choiceDept(Integer deptId) {
		if(deptId == null) {
			deptId=1;
		}
		Department department = departmentService.queryDeptById(deptId);
		List<Position> positions = department.getPositions();
		String jsonString = JSON.toJSONString(positions);
		return jsonString;
	}
	@RequestMapping(value="changePSW",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String changePSW(String oldpsw,String newpsw,HttpSession session) {
		User user = (User) session.getAttribute("nowUser");
		if(user.getPassword().equals(MyUtil.md5(oldpsw))) {
			user.setPassword(MyUtil.md5(newpsw));
			boolean res = userService.updateUser(user);
			if(res) {
				return "修改成功";
			}else {
				return "修改失败";
			}
		}else {
			return "密码错误";
		}
	}
	@RequestMapping("/register")
	public String register(Model model,User u) {
		User user = userService.queryUserByName(u.getuName());
		if(user != null) {
			model.addAttribute("registerMsg", "用户名已存在");
		}else {
			boolean addUser = userService.addUser(new User(0, u.getuName(), MyUtil.md5(u.getPassword()), 1));
			if(addUser) {
				int uId = userService.queryUserByName(u.getuName()).getuId();
				Info info = new Info(0, uId, null, null, null, null, null, null, null, null, null, null, null, null, null, 0, 1, null, null);
				boolean addInfo = infoService.addInfo(info);
				if(addInfo) {
					Info infoByuId = infoService.queryUserInfoByuId(uId);
					int iId = infoByuId.getiId();
					Interview interview = new Interview(0, uId, iId, 0, null, 0, 0, null, 0, 0);
					boolean addInterview = interviewService.addInterview(interview);
					if(addInterview) {
						model.addAttribute("registerMsg", "注册成功");
					}
				}
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
				int uId = user.getuId();
				session.setAttribute("depts", departmentService.queryAllDepts());
				if(type == 0) {
					List<Interview> interviews = interviewService.queryDeliverInterviews();
					session.setAttribute("interviews", interviews);
					return "jump/adminJump";
				}else if(type == 1) {
					int deliver = interviewService.queryInterviewByuId(uId).getDeliver();
					if(deliver == 1) {
						session.setAttribute("info", infoService.queryInfoByuId(uId));
					}else {
						session.setAttribute("info", infoService.queryUserInfoByuId(uId));
					}
					return "jump/userJump";
				}else if(type == 2) {
					return "jump/employeeJump";
				}else if(type == 3) {
					int dId = infoService.queryInfoByuId(uId).getDept().getdId();
					List<Interview> interviewsByDept = interviewService.queryDeliverInterviewsByDept(dId);
					if(interviewsByDept!=null) {
						session.setAttribute("interviewsByDept", interviewsByDept);
					}
					return "jump/deptJump";
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
	@RequestMapping("/todept")
	public String todept() {
		return "dept/index";
	}
	@RequestMapping("/toEmployee")
	public String toEmployee() {
		return "employee/index";
	}
	@RequestMapping("/toUser")
	public String toUser() {
		return "user/index";
	}
	@RequestMapping("/toLogin")
	public String toLogin() {
		return "loginRegister";
	}
}
