package com.iotek.ssm.test;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.iotek.ssm.dao.DepartmentDao;
import com.iotek.ssm.dao.InfoDao;
import com.iotek.ssm.dao.InterviewDao;
import com.iotek.ssm.dao.PositionDao;
import com.iotek.ssm.dao.UserDao;
import com.iotek.ssm.entity.Department;
import com.iotek.ssm.entity.Employment;
import com.iotek.ssm.entity.Info;
import com.iotek.ssm.entity.Position;
import com.iotek.ssm.entity.Train;
import com.iotek.ssm.entity.User;
import com.iotek.ssm.service.EmploymentService;
import com.iotek.ssm.service.PositionService;
import com.iotek.ssm.service.TrainService;
import com.iotek.ssm.util.MyUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class Main {
	@Autowired
	private UserDao userDao;
	@Autowired
	private DepartmentDao departmentDao;
	@Autowired
	private PositionDao positionDao;
	@Autowired
	private InfoDao infoDao;
	@Autowired
	private InterviewDao interviewDao;
	@Autowired
	private EmploymentService employmentService;
	@Autowired
	private PositionService positionService;
	@Autowired
	private TrainService trainService;
	@Test
	public void test() {
	//	userDao.addUser(new User(0, "dandan", "change941221"));
	//	System.out.println(userDao.updateUser(new User(2, "dan", "123123")));
	//	List<User> users = userDao.queryAllUsers();
	//	System.out.println(users);
	//	System.out.println(userDao.queryUserById(1));
	//	System.out.println(userDao.queryUserByName("dandan"));
	//	System.out.println(userDao.queryUserByName(null));
		userDao.updateUser(new User(1,"admin",MyUtil.md5("admin"),0));
		System.out.println(userDao.queryUserById(1));
	}
	
	@Test
	public void test2() {
		List<Department> depts = departmentDao.queryAllDepts();
		System.out.println(depts);
	}
	@Test
	public void Test3() {
		Position position = positionDao.queryPositById(2);
		System.out.println(position.getEmployees());
	}
	
	@Test
	public void test4() {
		Info info = infoDao.queryInfoByuId(2);
		System.out.println(info);
	}
	@Test
	public void test5() {
	//	int interview = interviewDao.addInterview(new Interview(0, 2, 1, 0, null, 0, 0, null, 0, 0));
	//	System.out.println(interview);
		System.out.println(interviewDao.queryAllInterviews().get(0).getInvitedTime());
	}
	
	@Test
	public void test6() {
	//	boolean addEmployment = employmentService.addEmployment(new Employment(0, new Department(2, null, null, null), 
	//			new Position(3, null, 1, null, null), "要求：有项目经验,会摸鱼。薪资：7K-9K", new Date()));
	//	System.out.println(addEmployment);
		System.out.println(employmentService.queryAllEmployments());
	}
	@Test
	public void test7() {
		Position queryPositById = positionService.queryPositById(2);
		List<Info> employees = queryPositById.getEmployees();
		if(employees == null) {
			System.out.println("空");
		}else {
			for (Info info : employees) {
				System.out.println(info);
			}
		}
	}
	@Test
	public void test8() {
		trainService.addTrain(new Train(0, "人事部培训", new Date(), new Department(1, null, null, null)));
		System.out.println(trainService.queryAllTrains());
		System.out.println(trainService.queryTrainsBydId(1));
	}
}
