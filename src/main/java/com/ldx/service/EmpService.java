package com.ldx.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ldx.bean.Employee;
import com.ldx.bean.EmployeeExample;
import com.ldx.bean.EmployeeExample.Criteria;
import com.ldx.dao.EmployeeMapper;
@Service
public class EmpService {
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	public List<Employee> getEmps() {
		List<Employee> list = employeeMapper.selectByExample(null);
		return list;
	}

	/**
	 * 	按照id查询员工
	 * @param id
	 * @return
	 */
	public Employee getEmp(Integer id) {
		Employee employee = employeeMapper.selectByPrimaryKey(id);
		return employee;
	}

	/**
	 * 员工更新
	 * @param employee
	 */
	public void updateEmp(Employee employee) {
		employeeMapper.updateByPrimaryKeySelective(employee);
	}

	/**
	 * 删除员工
	 * @param id
	 */
	public void deleteEmpById(Integer id) {
		employeeMapper.deleteByPrimaryKey(id);
	}

	/**
	 *   根据empName查询员工
	 * @param empName
	 * @return
	 */
	public List<Employee> getEmp(String empName) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameLike(empName);
		List<Employee> list = employeeMapper.selectByExample(null);
		return list;
	}
}
