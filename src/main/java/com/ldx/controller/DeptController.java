package com.ldx.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ldx.bean.Department;
import com.ldx.bean.Msg;
import com.ldx.service.DeparmentService;

@RestController
public class DeptController {
	
	@Autowired
	private DeparmentService deparmentService;
	
	@RequestMapping("/depts")
	public Msg getDepts() {
		List<Department> departments = deparmentService.getDepts();
		return Msg.success().add("depts", departments);
	}
	
}
