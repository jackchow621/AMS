package com.ghost.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ghost.domain.Deptment;
import com.ghost.mapper.DeptmentMapper;
import com.ghost.service.DeptmentService;

@Service
public class DeptmentServiceImpl implements DeptmentService {
	@Autowired
	private DeptmentMapper deptmentMapper;
	
	@Override
	public List<Deptment> findAllDeptments() throws Exception {
		return deptmentMapper.findAllDeptments();
	}

	@Override
	public void addDeptment(Deptment deptment) throws Exception {
		deptmentMapper.addDeptment(deptment);
	}

	@Override
	public void updateDeptment(Deptment deptment) throws Exception {
		deptmentMapper.updateDeptment(deptment);
	}

	@Override
	public void deleteDeptments(int id) throws Exception {
		deptmentMapper.deleteDeptments(id);
	}

	@Override
	public int totalSize() throws Exception {
		return deptmentMapper.totalSize();
	}

}
