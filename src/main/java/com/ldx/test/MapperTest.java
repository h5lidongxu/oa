package com.ldx.test;

import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ldx.bean.Msg;
import com.ldx.controller.EmpContorller;
import com.ldx.dao.DepartmentMapper;
import com.ldx.dao.EmployeeMapper;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	EmployeeMapper employeeMapper;
	
	@Autowired
	EmpContorller empContorller;
	
	@Test
	public void testCRUD() {
		/*List<Department> list = departmentMapper.selectByExample(null);
		for (Department department : list) {
			System.out.println(department);
		}*/
		/*employeeMapper.insert(new Employee(null, "林心如", "女", "dadadsa.com", 1));*/
	}	
}
