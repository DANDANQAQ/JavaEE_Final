package com.iotek.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iotek.ssm.entity.ClockRecord;
import com.iotek.ssm.entity.User;
import com.iotek.ssm.service.ClockRecordService;
import com.iotek.ssm.service.DepartmentService;
import com.iotek.ssm.service.EmploymentService;
import com.iotek.ssm.service.InfoService;
import com.iotek.ssm.service.InterviewService;
import com.iotek.ssm.service.PositionService;
import com.iotek.ssm.service.TrainService;

@RequestMapping("/employee")
@Controller
public class EmployeeController {
	@Autowired
	private TrainService trainService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private InfoService infoService;
	@Autowired
	private InterviewService interviewService;
	@Autowired
	private EmploymentService employementService;
	@Autowired
	private PositionService positionService;
	@Autowired
	private ClockRecordService clockRecordService;
	@RequestMapping("clockRecord")
	public String clockRecord(HttpSession session,Model model,Integer year,Integer month) {
		model.addAttribute("toClockRecords", "toClockRecords");
		User user = (User) session.getAttribute("nowUser");
		int uId = user.getuId();
		List<ClockRecord> clockRecords = clockRecordService.getClockRecordsForMonth(uId, year, month);
		int absenteeismDays = clockRecordService.getAbsenteeismDays(uId, year, month);
		session.setAttribute("absenteeismDays", absenteeismDays);
		session.setAttribute("clockRecords", clockRecords);
		session.setAttribute("year", year);
		session.setAttribute("month", month);
		return "employee/index";
	}
	
	@RequestMapping(value="clockin",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String clockin(HttpSession session) {
		User user = (User) session.getAttribute("nowUser");
		int uId = user.getuId();
		boolean clockin = clockRecordService.clockin(uId);
		boolean canClockin = clockRecordService.canClockin(uId);
		boolean canClockout = clockRecordService.canClockout(uId);
		session.setAttribute("canClockin", canClockin);
		session.setAttribute("canClockout", canClockout);
		if(clockin) {
			return "1";
		}else {
			return "0";
		}
	}
	@RequestMapping(value="clockout",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String clockout(HttpSession session) {
		User user = (User) session.getAttribute("nowUser");
		int uId = user.getuId();
		boolean clockout = clockRecordService.clockout(uId);
		boolean canClockin = clockRecordService.canClockin(uId);
		boolean canClockout = clockRecordService.canClockout(uId);
		session.setAttribute("canClockin", canClockin);
		session.setAttribute("canClockout", canClockout);
		if(clockout) {
			return "1";
		}else {
			return "0";
		}
	}
}
