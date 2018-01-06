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
import com.iotek.ssm.service.DepartmentService;
import com.iotek.ssm.service.EmploymentService;
import com.iotek.ssm.service.InfoService;
import com.iotek.ssm.service.InterviewService;
import com.iotek.ssm.service.PositionService;
import com.iotek.ssm.service.UserService;

@RequestMapping("/admin")
@Controller
public class AdminController {
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
	private PositionService positionService;
	@RequestMapping("delDept")
	public String delDept(Model model,Integer dId,HttpSession session) {
		model.addAttribute("toDeptPage", "toDeptPage");
		Department department = departmentService.queryDeptById(dId);
		if(department.getPositions().size()>0) {
			return "admin/index";
		}
		departmentService.delDepartmentById(dId);
		List<Department> depts = departmentService.queryAllDepts();
		session.setAttribute("depts", depts);
		return "admin/index";
	}
	@RequestMapping("delPosition")
	public String delPosition(Model model,Integer pId,HttpSession session) {
		model.addAttribute("toDeptPage", "toDeptPage");
		List<Info> infos = infoService.queryAllInfos();
		for (Info info : infos) {
			if(info.getType()==2 && info.getPosition().getpId()==pId) {
				return "admin/index";
			}
		}
		positionService.delPositionById(pId);
		List<Department> depts = departmentService.queryAllDepts();
		session.setAttribute("depts", depts);
		return "admin/index";
	}
	@RequestMapping("addDept")
	public String addDept(Model model,String deptName,HttpSession session) {
		model.addAttribute("toDeptPage", "toDeptPage");
		Department department = departmentService.queryDeptByName(deptName);
		if(department == null) {
			departmentService.addDepartment(new Department(0, deptName, new Date(), null));
			List<Department> depts = departmentService.queryAllDepts();
			session.setAttribute("depts", depts);
		}
		return "admin/index";
	}
	@RequestMapping("addPosition")
	public String addPosition(Model model,String posiName,Integer dId,HttpSession session) {
		model.addAttribute("toDeptPage", "toDeptPage");
		Department department = departmentService.queryDeptById(dId);
		if(department != null) {
			List<Position> positions = department.getPositions();
			if(positions.size()>0) {
				for (Position p : positions) {
					if(p.getpName().equals(posiName)) {
						return "admin/index";
					}
				}
			}
			positionService.addPosition(new Position(0, posiName, dId, new Date(), null));
		}
		List<Department> depts = departmentService.queryAllDepts();
		session.setAttribute("depts", depts);
		return "admin/index";
	}
	@RequestMapping("positionMsg")
	public String positionMsg(Model model,Integer pId) {
		Position positionMsg = positionService.queryPositById(pId);
		model.addAttribute("positionMsg", positionMsg);
		return "admin/index";
	}
	@RequestMapping(value="findInfoInPosition",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String findInfoInPosition(Integer uId) {
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
}
