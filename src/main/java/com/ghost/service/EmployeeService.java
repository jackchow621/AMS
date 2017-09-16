package com.ghost.service;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;

import com.ghost.domain.Employee;

public interface EmployeeService {
	//查询所有员工
	public List<Employee> findAllEmployee() throws Exception;
	//增加员工
	public void addEmployee(Employee employee) throws Exception;
	//修改员工
	public void updateEmployee(Employee employee) throws Exception;
	//修改员工个人信息
	public void updateEmployeeInfo(Employee employee) throws Exception;
	//删除员工
	public void deleteEmployees(int id) throws Exception;
	//登录
	public Employee login(Employee employee) throws Exception;
	//总记录数
	public int totalSize() throws Exception;
	//数据导出
	public void exportExcel(String[] titles,ServletOutputStream outputStream) throws Exception;
}
