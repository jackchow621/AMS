package com.ghost.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ghost.domain.Emp_Role;
import com.ghost.domain.Employee;
import com.ghost.domain.Menus;
import com.ghost.mapper.PrivilegeMapper;
import com.ghost.service.PrivilegeService;

@Service
public class PrivilegeServiceImpl implements PrivilegeService{
	@Autowired
	private PrivilegeMapper privilegeMapper;
	@Override
	public List<Menus> findForLogin(Map map) throws Exception {
		return privilegeMapper.findForLogin(map);
	}
	@Override
	public List<Emp_Role> findAllEmpPrivilege(Map map) {
		return privilegeMapper.findAllEmpPrivilege(map);
	}
	@Override
	public void savePrivilege(Map map) {
		 privilegeMapper.savePrivilege(map);
	}
	@Override
	public void deletePrivilege(int emp_id) throws Exception {
		privilegeMapper.deletePrivilege(emp_id);
	}
	@Override
	public void updatePrivilege(Map map) throws Exception {
		 privilegeMapper.updatePrivilege(map);
	}
	@Override
	public int totalSize() throws Exception {
		return privilegeMapper.totalSize();
	}
	@Override
	public Employee findEmployeeByEmpid(int emp_id) {
		return privilegeMapper.findEmployeeByEmpid(emp_id);
	}

}
