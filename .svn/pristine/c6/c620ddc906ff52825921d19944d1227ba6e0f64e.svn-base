package com.ghost.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.ghost.domain.Deptment;
import com.ghost.domain.Employee;
import com.ghost.service.DeptmentService;
import com.github.pagehelper.PageHelper;


@Controller
@RequestMapping("/Deptment")
public class DeptmentController {
	@Autowired
	private DeptmentService deptmentService;
	
	//查询所有部门
	@RequestMapping("/queryDeptment.action")
	public @ResponseBody Map<String, Object> findAllDeptments(int page,int rows) throws Exception {
		System.out.println("=====================findAllDeptments========================");

		PageHelper.startPage(page, rows);
		List<Deptment> deptmentsList = deptmentService.findAllDeptments();

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("total", deptmentService.totalSize());
		map.put("rows", deptmentsList);
		return map;
	}
	
	//增加部门 
	@RequestMapping("/addDeptment.action")
	public void addDeptment(Deptment deptment) throws Exception {
		System.out.println("=====================addDeptment========================");
		deptmentService.addDeptment(deptment);
	}
	
	//修改部门
	@RequestMapping("/updateDeptment.action")
	public void updateDeptment(Deptment deptment) throws Exception {
		System.out.println("=====================updateDeptment========================");
		deptmentService.updateDeptment(deptment);
	}
	
	//删除部门
	@RequestMapping("/deleteDeptments.action")
	public void deleteDeptments(int id) throws Exception {
		System.out.println("=====================deleteDeptments========================");
			deptmentService.deleteDeptments(id);
	}
}
