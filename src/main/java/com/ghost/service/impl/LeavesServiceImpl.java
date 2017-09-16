package com.ghost.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.ghost.domain.Leaves;
import com.ghost.mapper.LeavesMapper;
import com.ghost.service.LeavesService;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;

@Service
public class LeavesServiceImpl implements LeavesService{

	@Autowired
	private LeavesMapper leavesMapper;
	
	@Autowired
	private MongoTemplate mongoTemplate;
	private final String COL_NAME = "leaves";
	 
	@Override
	public List<Leaves> findAllLeaves() throws Exception {
//		return leavesMapper.findAllLeaves();
		return mongoTemplate.find(new Query(),Leaves.class,COL_NAME);
	}

	@Override
	public List<Leaves> findLeavesByEmpId(int emp_id) throws Exception {
//		return leavesMapper.findLeavesByEmpId(emp_id);
		Criteria c = new Criteria("emp_id").is(emp_id);
		return mongoTemplate.find(new Query(c),Leaves.class,COL_NAME);
	}

	@Override
	public Leaves findLeavesById(int leave_id) throws Exception {
//		return leavesMapper.findLeavesById(leave_id);
		Criteria c = new Criteria("leave_id").is(leave_id);
		List<Leaves> leaList = mongoTemplate.find(new Query(c),Leaves.class,COL_NAME);
		if(leaList.size()>0 && leaList != null){
			return leaList.get(0);
		}
		return null;
	}

	/**
	 * 此方式不会自动生成leave_id,通过控制器定义leave_id++处理
	 */
	@Override
	public void addLeaves(Leaves leaves) throws Exception {
//		leavesMapper.addLeaves(leaves);
		mongoTemplate.insert(leaves,COL_NAME);
	}

	@Override
	public void updateLeaves(Leaves leaves) throws Exception {
//		leavesMapper.updateLeaves(leaves);
		DBCollection lea = mongoTemplate.getCollection(COL_NAME);
		lea.update(new BasicDBObject("leave_id",leaves.getLeave_id()), 
				new BasicDBObject("emp_id",leaves.getEmp_id())
						  .append("beginDate", leaves.getBeginDate())
						  .append("endDate", leaves.getEndDate())
						  .append("days", leaves.getDays())
						  .append("type", leaves.getType())
						  .append("reason", leaves.getReason())
						  .append("applicationDate", leaves.getApplicationDate())
						  .append("approvalStatus", leaves.getApprovalStatus())
						  .append("approvalDate", leaves.getApprovalDate())
						  .append("approval_emp_id", leaves.getApproval_emp_id())
						  .append("comment", leaves.getComment()));
	}

	@Override
	public void deleteLeaves(int leave_id) throws Exception {
//		leavesMapper.deleteLeaves(leave_id);
		Criteria c = new Criteria("leave_id").is(leave_id); 
		mongoTemplate.remove(new Query(c),COL_NAME);
	}

	/**
	 * 由于系统使用mysql存储部门和员工信息，使用mongodb存储请假单信息，
	 * 所以根据部门汇总请假单的功能无法很好实现
	 * 思路：（需要先去mysql查询对应部门员工的empid，再去mongodb查询请假单）
	 */
	@Override
	public List<Leaves> findLeavesByDeptId(int dept_id) throws Exception {
		return leavesMapper.findLeavesByDeptId(dept_id);
	}

}
