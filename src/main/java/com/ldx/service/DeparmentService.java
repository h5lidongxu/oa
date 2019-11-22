package com.ldx.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ldx.bean.Department;
import com.ldx.dao.DepartmentMapper;
@Service
public class DeparmentService {
	@Autowired
	private DepartmentMapper departmentMapper;
	/**
	 * 查询部门信息
	 * @return
	 */
	public List<Department> getDepts() {
		List<Department> list = departmentMapper.selectByExample(null);
		return list;
	}

}
