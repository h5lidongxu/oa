package com.ldx.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ldx.bean.Employee;
import com.ldx.bean.Msg;
import com.ldx.service.EmpService;

@RestController
public class EmpContorller {
	@Autowired
	EmpService empService;
	
	/**
	 * 根据id删除用户
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/emp/{id}",method=RequestMethod.DELETE)
	public Msg deleteEmpById(@PathVariable("id")Integer id) {
		empService.deleteEmpById(id);
		return Msg.success();
	}
	
	/**
	 * 员工更新方法
	 * @param employee
	 * @return
	 */
	@RequestMapping(value = "/emp/{empId}",method=RequestMethod.PUT)
	public Msg saveEmp(Employee employee) {
		System.out.println("将要更新的员工数据为"+employee);
		empService.updateEmp(employee);
		return Msg.success();
	}
	
	@RequestMapping("/emps")
	public Msg getEmps(Integer pn) {
		PageHelper.startPage(pn, 6);
		List<Employee> employees =  empService.getEmps();
		PageInfo<Employee> pageInfo = new  PageInfo<Employee>(employees);
		return Msg.success().add("pageInfo", pageInfo);	
	}
	
	/**
	 * 查询单个员工信息
	 * @return
	 */
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	public Msg getEmp(@PathVariable("id")Integer id) {
		Employee employee = empService.getEmp(id);
		return Msg.success().add("emp", employee);
	}
	
	@RequestMapping(value="/empSearch")
	public Msg getEmp(String empName) {
		System.out.println(empName);
		List<Employee> list = empService.getEmp(empName);
		return Msg.success().add("emps", list);
	}
	
}
