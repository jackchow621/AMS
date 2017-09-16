package com.ghost.service;

import java.util.List;

import com.ghost.domain.Leaves;

public interface LeavesService {
	//查询所有请假申请表信息
	public List<Leaves> findAllLeaves() throws Exception;
	//查询指定请假申请表信息
	public List<Leaves> findLeavesByEmpId(int emp_id) throws Exception;
	//根据请假申请表id来查询特定的数据
	public Leaves findLeavesById(int leave_id) throws Exception;
	
	
	//增加请假申请表信息
	public void addLeaves(Leaves leaves) throws Exception;
	//修改请假申请表信息
	public void updateLeaves(Leaves leaves) throws Exception;
	//删除请假申请表信息
	public void deleteLeaves(int leave_id) throws Exception;
	//根据部门id查找所有请假申请
	public List<Leaves> findLeavesByDeptId(int dept_id) throws Exception;
}
