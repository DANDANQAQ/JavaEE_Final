package com.iotek.ssm.controller;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iotek.ssm.entity.Wages;
import com.iotek.ssm.service.WagesService;

@RequestMapping("/dept")
@Controller
public class DeptController {
	@Autowired
	private WagesService wagesService;
	
	@RequestMapping("addPerformance")
	@ResponseBody
	public String addPerformance(Integer uId,Integer performance) {
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH);
		Wages wages = wagesService.findWagesByuIdYearMonth(uId, year, month);
		if(wages == null) {
			wages = new Wages(0, uId, 0, 0, 0, 0, 0, 0, 0, year, month);
			wagesService.addWages(wages);
		}
		wages.setPerformance(wages.getPerformance()+performance);
		wagesService.updateWages(wages);
		return "1";
	}
}
