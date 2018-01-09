package com.iotek.ssm.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.iotek.ssm.entity.Department;
import com.iotek.ssm.entity.Employment;
import com.iotek.ssm.entity.Info;
import com.iotek.ssm.entity.Interview;
import com.iotek.ssm.entity.Position;
import com.iotek.ssm.entity.Train;
import com.iotek.ssm.entity.User;
import com.iotek.ssm.entity.Wages;
import com.iotek.ssm.service.DepartmentService;
import com.iotek.ssm.service.EmploymentService;
import com.iotek.ssm.service.InfoService;
import com.iotek.ssm.service.InterviewService;
import com.iotek.ssm.service.PositionService;
import com.iotek.ssm.service.TrainService;
import com.iotek.ssm.service.UserService;
import com.iotek.ssm.service.WagesService;
import com.iotek.ssm.util.ChineseToEnglish2;
import com.iotek.ssm.util.MyUtil;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired
	private UserService userService;
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
	private WagesService wagesService;
	@InitBinder
	public void InitBinder(ServletRequestDataBinder binder) {
		binder.registerCustomEditor(Date.class, 
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
	@RequestMapping("changeEmp")
	public String changeEmp(HttpSession session,Model model,Integer emp) {
		model.addAttribute("toEMP", "toEMP");
		if(emp == 1) {
			List<Info> infos = infoService.queryInfosByServingStaff();
			session.setAttribute("infos", infos);
			session.setAttribute("emp", 1);
		}else {
			List<Info> infos = infoService.queryInfosByNotServingStaff();
			session.setAttribute("infos", infos);
			session.setAttribute("emp", 2);
		}
		return "admin/index";
	}
	@RequestMapping("findWages")
	public String findWages(HttpSession session,Model model,Integer year,Integer month) {
		model.addAttribute("toWages", "toWages");
		List<Wages> wages = wagesService.findWagesByYearMonth(year, month);
		session.setAttribute("wages", wages);
		session.setAttribute("year", year);
		session.setAttribute("month", month);
		return "admin/index";
	}
	//培训 增删改
	@RequestMapping("addTrain")
	@ResponseBody
	public String addTrain(Model model,HttpSession session,String tName,Date tTime,Integer traindId) {
		Train train = new Train(0, tName, tTime, new Department(traindId, null, null, null));
		trainService.addTrain(train);
		List<Train> trains = trainService.queryAllTrains();
		session.setAttribute("trains", trains);//trains
		return ""+train.gettId();
	}
	@RequestMapping("editTrainAjax")
	@ResponseBody
	public String editTrainAjax(Model model,HttpSession session,Integer tId,String tName,Date tTime,Integer traindId) {
		Train train = trainService.queryTrainBytId(tId);
		train.settName(tName);
		train.settTime(tTime);
		train.setDepartment(new Department(traindId, null, null, null));
		trainService.updateTrain(train);
		List<Train> trains = trainService.queryAllTrains();
		session.setAttribute("trains", trains);//trains
		return "editTrain";
	}
	@RequestMapping(value="findTrainAjax",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String findTrainAjax(Integer tId) {
		Train train = trainService.queryTrainBytId(tId);
		String jsonString = JSON.toJSONString(train);
		return jsonString;
	}
	@RequestMapping(value="delTrainAjax",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String delTrainAjax(Integer tId,HttpSession session) {
		if(tId == null) {
			return null;
		}
		trainService.delTrainById(tId);
		List<Train> trains = trainService.queryAllTrains();
		session.setAttribute("trains", trains);//trains
		return "success";
	}
	
	//招聘 增删
	@RequestMapping("addEmployment")
	public String addEmployment(Model model,Integer dId,Integer pId,String requirement,HttpSession session) {
		model.addAttribute("toRecruitment", "toRecruitment");
		employementService.addEmployment(new Employment(0, new Department(dId, null, null, null), new Position(pId, null, dId, null, null), requirement, new Date()));
		List<Employment> employments = employementService.queryAllEmployments();
		session.setAttribute("employments", employments);//employments
		return "admin/index";
	}
	@RequestMapping("delRecruitment")
	public String delRecruitment(Model model,Integer eId,HttpSession session) {
		model.addAttribute("toRecruitment", "toRecruitment");
		employementService.delEmploymentById(eId);
		List<Employment> employments = employementService.queryAllEmployments();
		session.setAttribute("employments", employments);//employments
		return "admin/index";
	}
	
	//部门 增删改
	@RequestMapping("editDeptName")
	public String editDeptName(Model model,Integer editDeptdId,String deptName,HttpSession session) {
		model.addAttribute("toDeptPage", "toDeptPage");
		Department departmentNew = departmentService.queryDeptByName(deptName);
		if(departmentNew == null) {
			Department department = departmentService.queryDeptById(editDeptdId);
			//修改账号
			String deptNameOld = department.getdName();
			String fullSpellOld = ChineseToEnglish2.getFullSpell(deptNameOld);
			String deptSpellOld = fullSpellOld+"admin";
			User queryUserByNameOld = userService.queryUserByName(deptSpellOld);
			
			String fullSpellNew = ChineseToEnglish2.getFullSpell(deptName);
			String deptSpellNew = fullSpellNew+"admin";
			
			queryUserByNameOld.setuName(deptSpellNew);
			queryUserByNameOld.setPassword(MyUtil.md5(deptSpellNew));
			userService.updateUser(queryUserByNameOld);
			
			department.setdName(deptName);
			departmentService.updateDepartment(department);
			List<Department> depts = departmentService.queryAllDepts();
			session.setAttribute("depts", depts);//depts
		}
		return "admin/index";
	}
	@RequestMapping("delDept")
	public String delDept(Model model,Integer dId,HttpSession session) {
		model.addAttribute("toDeptPage", "toDeptPage");
		Department department = departmentService.queryDeptById(dId);
		if(department.getPositions().size()>0) {
			return "admin/index";
		}
		//注销账号
		String deptNameOld = department.getdName();
		String fullSpellOld = ChineseToEnglish2.getFullSpell(deptNameOld);
		String deptSpellOld = fullSpellOld+"admin";
		User queryUserByNameOld = userService.queryUserByName(deptSpellOld);
		if(queryUserByNameOld != null) {
			Info info = infoService.queryInfoByuId(queryUserByNameOld.getuId());
			infoService.delInfoById(info.getiId());
			userService.delUserById(queryUserByNameOld.getuId());
		}
		
		departmentService.delDepartmentById(dId);
		List<Department> depts = departmentService.queryAllDepts();
		session.setAttribute("depts", depts);//depts
		
		return "admin/index";
	}
	@RequestMapping("addDept")
	public String addDept(Model model,String deptName,HttpSession session) {
		model.addAttribute("toDeptPage", "toDeptPage");
		Department department = departmentService.queryDeptByName(deptName);
		if(department == null) {
			departmentService.addDepartment(new Department(0, deptName, new Date(), null));
			List<Department> depts = departmentService.queryAllDepts();
			session.setAttribute("depts", depts);//depts
			//为部门注册账号
			Department queryDeptByName = departmentService.queryDeptByName(deptName);
			String fullSpell = ChineseToEnglish2.getFullSpell(deptName);
			String deptSpell = fullSpell+"admin";
			User queryUserByName = userService.queryUserByName(deptSpell);
			if(queryUserByName == null) {
				userService.addUser(new User(0, deptSpell, MyUtil.md5(deptSpell), 3));
				int uId = userService.queryUserByName(deptSpell).getuId();
				Info info = new Info(0, uId, null, null, null, null, null, null, queryDeptByName, null, null, null, null, null, null, 0, 3, null, null);
				infoService.addInfo(info);
			}
		}
		return "admin/index";
	}
	
	//职位 增删改
	@RequestMapping("delPosition")
	public String delPosition(Model model,Integer pId,HttpSession session) {
		model.addAttribute("toDeptPage", "toDeptPage");
		List<Info> infos = infoService.queryInfosByServingStaff();
		for (Info info : infos) {
			if(info.getPosition().getpId()==pId) {
				return "admin/index";
			}
		}
		positionService.delPositionById(pId);
		List<Department> depts = departmentService.queryAllDepts();
		session.setAttribute("depts", depts);//depts
		return "admin/index";
	}
	@RequestMapping("editPositionName")
	public String editPositionName(Model model,Integer editPositionpId,String positionName,HttpSession session) {
		model.addAttribute("toDeptPage", "toDeptPage");
		Position position = positionService.queryPositById(editPositionpId);
		position.setpName(positionName);
		positionService.updatePosition(position);
		List<Department> depts = departmentService.queryAllDepts();
		session.setAttribute("depts", depts);//depts
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
		session.setAttribute("depts", depts);//depts
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
