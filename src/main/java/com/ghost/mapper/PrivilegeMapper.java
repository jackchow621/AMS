package com.ghost.mapper;

import java.util.List;
import java.util.Map;

import com.ghost.domain.Emp_Role;
import com.ghost.domain.Employee;
import com.ghost.domain.Menus;

public interface PrivilegeMapper {
	//用户登录时判断其所拥有的权限
	public List<Menus> findForLogin(Map map) throws Exception;
	//总记录数
	public int totalSize() throws Exception;
	//查询所有人的角色
	public List<Emp_Role> findAllEmpPrivilege(Map map);
	//查找要添加的员工编号是否存在
	public Employee findEmployeeByEmpid(int emp_id);
	//增加员工的角色
	public void savePrivilege(Map map);
	//删除员工的角色
	public void deletePrivilege(int emp_id)throws Exception;
	//修改员工的角色
	public void updatePrivilege(Map map)throws Exception;
}
