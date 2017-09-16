package com.ghost.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializeConfig;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.SimpleDateFormatSerializer;
import com.ghost.domain.Email;
import com.ghost.domain.Employee;
import com.ghost.domain.IP;
import com.ghost.domain.Leaves;
import com.ghost.service.LeavesService;


@Controller
@RequestMapping("/Leave")
public class LeavesController {
	@Autowired
	private LeavesService leavesService;

	//查询所有请假申请列表
	@RequestMapping("/findAllLeaves")
	public void findAllLeaves(HttpServletRequest request,HttpServletResponse response) throws Exception{
		System.out.println("===========findAllLeaves============");
		response.setContentType("text/html;charset=utf-8");
		
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int emp_id = employee.getEmp_Id();	
		List<Leaves> leaveList = leavesService.findLeavesByEmpId(emp_id);
		
		if(leaveList!=null && leaveList.size()>0){
			SerializeConfig sc=new SerializeConfig();
			sc.put(Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd"));
			
			System.out.println(JSON.toJSONString(leaveList, sc, SerializerFeature.WriteNullListAsEmpty));
			String Json = JSON.toJSONString(leaveList, sc, SerializerFeature.WriteNullListAsEmpty);
			
			//String str = JSON.toJSONString(employeesList);
			PrintWriter out = response.getWriter();
			out.write(Json);
			out.flush();
			out.close();
		}
		
	}
	
	//根据部门id查找所有请假申请 
	@RequestMapping("/findLeavesByDeptId")
	public void queryToApproval(HttpServletRequest request,HttpServletResponse response)throws Exception{
		System.out.println("============findByDeptId============");
		response.setContentType("text/html;charset=utf-8");
		Map<String,Integer> map = new HashMap<String, Integer>();
		
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int dept_id = employee.getDept_Id();
		List<Leaves> leavesList = leavesService.findLeavesByDeptId(dept_id);

		if(leavesList!=null && leavesList.size()>0){
			SerializeConfig sc=new SerializeConfig();
			sc.put(Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd"));
			System.out.println(JSON.toJSONString(leavesList, sc, SerializerFeature.WriteNullListAsEmpty));
			String Json = JSON.toJSONString(leavesList, sc, SerializerFeature.WriteNullListAsEmpty);
			//String str = JSON.toJSONString(employeesList);
			PrintWriter out = response.getWriter();
			out.write(Json);
			out.flush();
			out.close();
		}
	}
	
	
	//根据员工id来查询特定的请假申请数据
	@RequestMapping("/findLeavesByEmpId")
	public ModelAndView findLeavesByEmpId(HttpServletRequest request)throws Exception{
		System.out.println("===========findLeavesByEmpId============");
		Employee employee = (Employee) request.getAttribute("employee");
		int emp_id = employee.getEmp_Id();
		List<Leaves> leavesList = leavesService.findLeavesByEmpId(emp_id);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("leavesList",leavesList);
		modelAndView.setViewName("leavesList.jsp");
		return modelAndView;
	}
	
	
	
	//根据请假申请表的id来查询特定的请假申请表的数据
	@RequestMapping("/findLeavesById")
	public ModelAndView findLeavesById(HttpServletRequest request) throws Exception{
		System.out.println("===========findLeavesById============");
		//接收请假申请表的id
		int leave_id=Integer.parseInt(request.getParameter("leave_id"));
		
		System.out.println(leave_id+"================");
		//根据请假申请的id来查询的有关数据
		Leaves leaves=leavesService.findLeavesById(leave_id);
		
		
		//创建modelAndView准备填充数据、设置视图
		ModelAndView modelAndView=new ModelAndView();
		
		//填充数据
		modelAndView.addObject("leaves", leaves);
		//视图
		modelAndView.setViewName("editLeaves.jsp");
		
		return modelAndView;
		
	}
	
	//审批动作
	@RequestMapping("/approvalLeave.action")
	public String approvalIP(int leave_id,String approvalStatus,HttpServletRequest request,HttpServletResponse response) throws Exception {
		System.out.println("=====================approvalLeave========================");
		response.setContentType("text/html;charset=utf-8");
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int emp_id = employee.getEmp_Id(); 
		Leaves leave = leavesService.findLeavesById(leave_id);
		
		leave.setApproval_emp_id(emp_id);
		leave.setApprovalStatus(approvalStatus);
		leave.setApprovalDate(new Date());
		
		leavesService.updateLeaves(leave);
		return "approvalLeave.jsp";
		}
	
	//增加请假申请表的数据
	@RequestMapping("/addLeaves")
	public String addLeaves(Leaves leaves,HttpServletRequest request) throws Exception{
		System.out.println("===========addLeaves============");
		
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int emp_id = employee.getEmp_Id();
		Date applicationDate = new Date();
		leaves.setApplicationDate(applicationDate);
		leaves.setEmp_id(emp_id);
		String approvalStatus = "未审批";//表示未审批状态
		leaves.setApprovalStatus(approvalStatus);
		leavesService.addLeaves(leaves);
		return "leaveList.jsp";
		
	}
	
	
	//修改请假申请表的数据
	@RequestMapping("/updateLeaves")
	public String updateLeaves(Leaves leaves) throws Exception{
		System.out.println("===========updateLeaves============");
		Date applicationDate = new Date();
		leaves.setApplicationDate(applicationDate);
		leaves.setApprovalStatus("未审批");
		leavesService.updateLeaves(leaves);
		
		return "leaveList.jsp";
		
	}
	
	
	//删除请假申请表的数据
	@RequestMapping("/deleteLeaves")
	public String deleteLeaves(Integer[] leave_ids) throws Exception{
		System.out.println("===========deleteLeaves============");
		for (int i = 0; i < leave_ids.length; i++) {
			leavesService.deleteLeaves(leave_ids[i]);
		}
		return "leaveList.jsp";
		
	}
	
}
