package com.iotek.ssm.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.iotek.ssm.entity.BonusForfeit;
import com.iotek.ssm.entity.ClockRecord;
import com.iotek.ssm.entity.Department;
import com.iotek.ssm.entity.Employment;
import com.iotek.ssm.entity.Info;
import com.iotek.ssm.entity.Interview;
import com.iotek.ssm.entity.Position;
import com.iotek.ssm.entity.Train;
import com.iotek.ssm.entity.User;
import com.iotek.ssm.entity.Wages;
import com.iotek.ssm.service.BonusForfeitService;
import com.iotek.ssm.service.ClockRecordService;
import com.iotek.ssm.service.DepartmentService;
import com.iotek.ssm.service.EmploymentService;
import com.iotek.ssm.service.InfoService;
import com.iotek.ssm.service.InterviewService;
import com.iotek.ssm.service.TrainService;
import com.iotek.ssm.service.UserService;
import com.iotek.ssm.service.WagesService;
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
	@Autowired
	private EmploymentService employementService;
	@Autowired
	private TrainService trainService;
	@Autowired
	private ClockRecordService clockRecordService;
	@Autowired
	private WagesService wagesService;
	@Autowired
	private BonusForfeitService bfService;
	@RequestMapping("saveInterview")
	public String saveInterview(Model model, Info info, Integer dId, Integer pId, HttpSession session) {
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
		if(dId != null && pId != null) {
			department = new Department(dId, null, null, null);
			position = new Position(pId, null, dId, null, null);
			Interview interview = interviewService.queryInterviewByuId(uId);
			interview.setDeliver(1);
			interview.setDeliverTime(new Date());
			interviewService.updateInterview(interview);
		}
		Info infoByuId = infoService.queryInfoByuId(uId);
		int iId = infoByuId.getiId();
		int type = infoByuId.getType();
		int readed = 0;
		Date entryTime = infoByuId.getEntryTime();
		String msg = infoByuId.getMsg();
		boolean updateInfo = infoService.updateInfo(new Info(iId, uId, realName, sex, age, edu, phone, email, department, position, politics, lastJob, workYear, salaryExp, hobby, readed, type, entryTime, msg));
		if(updateInfo) {
			Interview interview = interviewService.queryInterviewByuId(uId);
			interview.setReaded(0);
			interviewService.updateInterview(interview);
			Info queryInfoByuId = infoService.queryInfoByuId(uId);
			session.setAttribute("info", queryInfoByuId);
			return "user/index";
		}
		return null;
	}
	@RequestMapping("ifenroll")
	public String ifenroll(Integer invitedUserId,Integer ifenroll,HttpSession session) {
		Interview interview = interviewService.queryInterviewByuId(invitedUserId);
		Info info = infoService.queryInfoByuId(invitedUserId);
		interview.setInterview(1);
		if(ifenroll == 1) {
			interview.setEnroll(1);
			info.setEntryTime(new Date());
			info.setType(2);
			User enrollUser = userService.queryUserById(invitedUserId);
			enrollUser.setType(2);
			userService.updateUser(enrollUser);
		}
		interview.setInvited(0);
		interview.setInvitedTime(null);
		interviewService.updateInterview(interview);
		infoService.updateInfo(info);
		User user = (User) session.getAttribute("nowUser");
		int uId = user.getuId();
		int dId = infoService.queryInfoByuId(uId).getDept().getdId();
		List<Interview> interviewsByDept = interviewService.queryDeliverInterviewsByDept(dId);
		session.setAttribute("interviewsByDept", interviewsByDept);
		return "dept/index";
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
	@RequestMapping(value="delInfoAjax",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String delInfoAjax(Integer uId) {
		if(uId == null) {
			return null;
		}
		Interview interview = interviewService.queryInterviewByuId(uId);
		interview.setDeliver(0);
		interview.setDeliverTime(null);
		interview.setInterview(0);
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
		if(u.getuName().endsWith("admin")) {
			model.addAttribute("registerMsg", "用户名不合法");
		}else {
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
						Info infoByuId = infoService.queryInfoByuId(uId);
						int iId = infoByuId.getiId();
						Interview interview = new Interview(0, uId, iId, 0, null, 0, 0, null, 0, 0);
						boolean addInterview = interviewService.addInterview(interview);
						if(addInterview) {
							model.addAttribute("registerMsg", "注册成功");
						}
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
				session.setAttribute("nowUser", user);//user
				int uId = user.getuId();
				session.setAttribute("depts", departmentService.queryAllDepts());//depts
				List<Employment> employments = employementService.queryAllEmployments();
				session.setAttribute("employments", employments);//employments
				List<Train> trains = trainService.queryAllTrains();
				session.setAttribute("trains", trains);
				Calendar now = Calendar.getInstance();
				int year = now.get(Calendar.YEAR);
				int month = now.get(Calendar.MONTH);
				month++;
				session.setAttribute("year", year);
				session.setAttribute("month", month);
				session.setAttribute("yearw", year);
				session.setAttribute("monthw", month);
				session.setAttribute("yearb", year);
				session.setAttribute("monthb", month);
				session.setAttribute("yearc", year);
				session.setAttribute("monthc", month);
				if(type == 0) {
					List<Info> infos = infoService.queryInfosByServingStaff();
					session.setAttribute("infos", infos);
					session.setAttribute("emp", 1);
					List<Wages> wages = wagesService.findWagesByYearMonth(year, month-1);
					session.setAttribute("wages", wages);
					List<Interview> interviews = interviewService.queryDeliverInterviews();
					session.setAttribute("interviews", interviews);
					List<BonusForfeit> bFsByMonth = bfService.queryBFsByMonth(year, month);
					session.setAttribute("bFsByMonth", bFsByMonth);
					return "admin/index";
				}else if(type == 1 || type == 4) {
					Interview interview = interviewService.queryInterviewByuId(uId);
					int invited = interview.getInvited();
					if(invited==1) {
						session.setAttribute("interviewFeedback", interview);//interviewFeedback
					}else {
						session.setAttribute("interviewFeedback", null);
					}
					session.setAttribute("info", infoService.queryInfoByuId(uId));//info
					return "user/index";
				}else if(type == 2) {
					List<BonusForfeit> bFsByMonth = bfService.queryBFsByUser(uId, year, month);
					session.setAttribute("bFsByMonth", bFsByMonth);
					Wages wages = wagesService.findWagesByuIdYearMonth(uId, year, month-1);
					session.setAttribute("wages", wages);
					Info info = infoService.queryInfoByuId(uId);
					session.setAttribute("info", info);
					boolean canClockin = clockRecordService.canClockin(uId);
					boolean canClockout = clockRecordService.canClockout(uId);
					session.setAttribute("canClockin", canClockin);
					session.setAttribute("canClockout", canClockout);
					List<ClockRecord> clockRecords = clockRecordService.getClockRecordsForMonth(uId, year, month);
					int absenteeismDays = clockRecordService.getAbsenteeismDays(uId, year, month);
					session.setAttribute("absenteeismDays", absenteeismDays);
					session.setAttribute("clockRecords", clockRecords);
					return "employee/index";
				}else if(type == 3) {
					Department dept = infoService.queryInfoByuId(uId).getDept();
					session.setAttribute("dept", dept);
					int dId = dept.getdId();
					List<Interview> interviewsByDept = interviewService.queryDeliverInterviewsByDept(dId);
					if(interviewsByDept!=null) {
						session.setAttribute("interviewsByDept", interviewsByDept);//interviewsByDept
					}
					List<Train> trainsBydId = trainService.queryTrainsBydId(dId);
					if(trainsBydId!=null) {
						session.setAttribute("trainsBydId", trainsBydId);//trainsBydId
					}
					return "dept/index";
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
	@RequestMapping("/toLogin")
	public String toLogin() {
		return "loginRegister";
	}
}
