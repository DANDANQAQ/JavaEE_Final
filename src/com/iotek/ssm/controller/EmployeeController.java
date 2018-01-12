package com.iotek.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iotek.ssm.entity.BonusForfeit;
import com.iotek.ssm.entity.ClockRecord;
import com.iotek.ssm.entity.Info;
import com.iotek.ssm.entity.User;
import com.iotek.ssm.entity.Wages;
import com.iotek.ssm.entity.WagesRecord;
import com.iotek.ssm.service.BonusForfeitService;
import com.iotek.ssm.service.ClockRecordService;
import com.iotek.ssm.service.DepartmentService;
import com.iotek.ssm.service.EmploymentService;
import com.iotek.ssm.service.InfoService;
import com.iotek.ssm.service.InterviewService;
import com.iotek.ssm.service.PositionService;
import com.iotek.ssm.service.TrainService;
import com.iotek.ssm.service.WagesRecordService;
import com.iotek.ssm.service.WagesService;

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
	@Autowired
	private WagesService wagesService;
	@Autowired
	private BonusForfeitService bfService;
	@Autowired
	private WagesRecordService wrService;
	@RequestMapping("findBonus")
	public String findBonus(HttpSession session,Model model,Integer yearb,Integer monthb) {
		model.addAttribute("toBonus", "toBonus");
		User user = (User) session.getAttribute("nowUser");
		List<BonusForfeit> bFsByMonth = bfService.queryBFsByUser(user.getuId(), yearb, monthb);
		session.setAttribute("bFsByMonth", bFsByMonth);
		session.setAttribute("yearb", yearb);
		session.setAttribute("monthb", monthb);
		return "employee/index";
	}
	@RequestMapping("findWages")
	public String findWages(HttpSession session,Model model,Integer year,Integer month) {
		model.addAttribute("toWages", "toWages");
		User user = (User) session.getAttribute("nowUser");
		Wages wages = wagesService.findWagesByuIdYearMonth(user.getuId(), year, month-1);
		session.setAttribute("wages", wages);
		session.setAttribute("yearw", year);
		session.setAttribute("monthw", month);
		return "employee/index";
	}
	@RequestMapping("personalInformation")
	public String personalInformation(HttpSession session,String realName,Integer age,String phone,String email,String hobby) {
		User user = (User) session.getAttribute("nowUser");
		int uId = user.getuId();
		Info info = infoService.queryInfoByuId(uId);
		info.setRealName(realName);
		info.setAge(age);
		info.setPhone(phone);
		info.setAge(age);
		info.setHobby(hobby);
		infoService.updateInfo(info);
		info = infoService.queryInfoByuId(uId);
		session.setAttribute("info", info);
		return "employee/index";
	}
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
	
	@RequestMapping(value="objectionAjax",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String objectionAjax(HttpSession session,Integer wId,String msg) {
		User user = (User) session.getAttribute("nowUser");
		int uId = user.getuId();
		WagesRecord wr = wrService.queryWagesRecordBywId(wId);
		if(wr == null) {
			wr = new WagesRecord(0, uId, wId, 0, 0, null, 0);
			wrService.addWagesRecord(wr);
		}
		if(wr.getDismissObjection() == 1) {
			return "�ύʧ�ܣ����µ������ѱ����ع�";
		}
		if(wr.getObjection() == 1) {
			return "�ύʧ�ܣ��������ύ������";
		}
		wr.setObjection(1);
		wr.setMsg(msg);
		wrService.updateWagesRecord(wr);
		return "�ύ�ɹ�";
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
