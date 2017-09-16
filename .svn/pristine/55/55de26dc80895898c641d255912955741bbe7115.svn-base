package com.ghost.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ghost.domain.Leaves;
import com.ghost.mapper.LeavesMapper;
import com.ghost.service.LeavesService;

@Service
public class LeavesServiceImpl implements LeavesService{

	@Autowired
	private LeavesMapper leavesMapper;
	 
	@Override
	public List<Leaves> findAllLeaves() throws Exception {
		return leavesMapper.findAllLeaves();
	}

	@Override
	public List<Leaves> findLeavesByEmpId(int emp_id) throws Exception {
		return leavesMapper.findLeavesByEmpId(emp_id);
	}

	@Override
	public Leaves findLeavesById(int leave_id) throws Exception {
		return leavesMapper.findLeavesById(leave_id);
	}

	@Override
	public void addLeaves(Leaves leaves) throws Exception {
		leavesMapper.addLeaves(leaves);
	}

	@Override
	public void updateLeaves(Leaves leaves) throws Exception {
		leavesMapper.updateLeaves(leaves);
	}

	@Override
	public void deleteLeaves(int leave_id) throws Exception {
		leavesMapper.deleteLeaves(leave_id);
	}

	@Override
	public List<Leaves> findLeavesByDeptId(int dept_id) throws Exception {
		return leavesMapper.findLeavesByDeptId(dept_id);
	}

}
