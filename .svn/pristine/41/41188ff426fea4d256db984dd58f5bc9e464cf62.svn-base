package com.ghost.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.alibaba.fastjson.serializer.SerializeConfig;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.SimpleDateFormatSerializer;
import com.ghost.domain.Employee;
import com.ghost.domain.IP;
import com.ghost.domain.Memory;
import com.ghost.domain.Teleconference;
import com.ghost.service.TeleconferenceService;
import com.github.pagehelper.PageHelper;


@Controller
@RequestMapping("/Teleconference")
public class TeleconferenceController {
	@Autowired
	private TeleconferenceService teleconferenceService;

	/*//查询所有电话会议申请列表
	@RequestMapping("/findAllTeleconference")
	public ModelAndView findAllTeleconference() throws Exception{
		System.out.println("===========findAllTeleconference============");
		//电话会议申请列表
		List<Teleconference> teleconferenceList=teleconferenceService.findAllTeleconference();
		//创建modelAndView准备填充数据、设置视图
		ModelAndView modelAndView=new ModelAndView();
		//填充数据
		modelAndView.addObject("teleconferenceList", teleconferenceList);
		//视图
		modelAndView.setViewName("TeleconferenceList.jsp");
		return modelAndView;
	}*/
	
	//根据员工的id来查询特定的数据
	@RequestMapping("/findTeleconferenceByEmpid")
	public @ResponseBody Map<String, Object> findTeleconferenceByEmpId(int page,int rows,HttpServletRequest request)throws Exception{
		System.out.println("===========findTeleconferenceByEmpId============");
		PageHelper.startPage(page, rows);
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Integer> map01 = new HashMap<String, Integer>();
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		System.out.println(employee);
		int emp_id = employee.getEmp_Id();
		
		List<Teleconference> teleconferenceList = teleconferenceService.findTeleconferenceByEmpId(emp_id);
		map01.put("emp_id", emp_id);
		int totalSize = teleconferenceService.totalSize(map01);
		map.put("total",totalSize);
		map.put("rows", teleconferenceList);
		return map;
	}
	
	
	
	/*//根据电话会议申请表的id来查询特定的电话会议申请表的数据
	@RequestMapping("/findTeleconferenceById")
	public ModelAndView findTeleconferenceById(HttpServletRequest request) throws Exception{
		System.out.println("===========findTeleconferenceById============");
		//接收电话会议申请表的id
		int teleconference_id=Integer.parseInt(request.getParameter("teleconference_id"));
		System.out.println(teleconference_id+"================");
		//根据电话会议申请的id来查询的有关数据
		Teleconference teleconference=teleconferenceService.findTeleconferenceById(teleconference_id);
		//创建modelAndView准备填充数据、设置视图
		ModelAndView modelAndView=new ModelAndView();
		//填充数据
		modelAndView.addObject("teleconference", teleconference);
		//视图
		modelAndView.setViewName("editTeleconference.jsp");
		return modelAndView;
		
	}*/
	
	
	//创建电话会议申请单
	@RequestMapping("/addTeleconference")
	public String addTeleconference(Teleconference teleconference,String isDevice,int telephone,HttpServletRequest request) throws Exception{
		System.out.println("===========addTeleconference============");
		System.out.println(isDevice);
		System.out.println(telephone);
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int emp_id = employee.getEmp_Id();
		teleconference.setEmp_id(emp_id);
		teleconference.setIsDevice(isDevice);
		teleconference.setTelephone(telephone);
		//SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date applicationDate = new Date();
		teleconference.setApplicationDate(applicationDate);
		String approvalStatus = "未审批";
		teleconference.setApprovalStatus(approvalStatus);
		teleconferenceService.addTeleconference(teleconference);
		return "teleconferenceList.jsp";
		
	}
	
	//修改电话会议申请表的数据
	@RequestMapping("/updateTeleconference")
	public String updateTeleconference(Teleconference teleconference) throws Exception{
		System.out.println("===========updateTeleconference============");
		Date applicationDate = new Date();
		teleconference.setApplicationDate(applicationDate);
		String approvalStatus = "未审批";
		teleconference.setApprovalStatus(approvalStatus);
		teleconferenceService.updateTeleconference(teleconference);
		return "teleconferenceList.jsp";
		
	}
	
	//删除电话会议申请表的数据
	@RequestMapping("/deleteTeleconference")
	public String deleteTeleconference(Integer[] teleconference_ids) throws Exception{
		System.out.println("===========deleteTeleconference============");
		for (int i = 0; i < teleconference_ids.length; i++) {
			teleconferenceService.deleteTeleconference(teleconference_ids[i]);
		}
		return "teleconferenceList.jsp";
	}
	
	//审批查找
	@RequestMapping("/findTeleconferenceToApproval")
	public void findTeleconferenceToApproval(HttpServletRequest request,HttpServletResponse response)throws Exception{
		System.out.println("===========findTeleconferenceToApproval============");
		response.setContentType("text/html;charset=UTF-8");
		HashMap<String, Object> map = new HashMap<String, Object>();
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int dept_Id = employee.getDept_Id();
		map.put("dept_Id", dept_Id);
		List<Object> teleconferenceList = teleconferenceService.queryTeleconferenceForDispose(map);
		System.out.println(teleconferenceList.size());
		if(teleconferenceList!=null && teleconferenceList.size()>0){
			SerializeConfig sc=new SerializeConfig();
			sc.put(Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd"));
			String Json = JSON.toJSONString(teleconferenceList, sc, SerializerFeature.WriteNullListAsEmpty);
			PrintWriter out = response.getWriter();
			out.write(Json);
			out.flush();
			out.close();
		}
		/*int totalSize = teleconferenceService.totalSize(map);
		map.put("total",totalSize);
		map.put("rows", teleconferenceList);*/
	}
	
	//审批动作
	@RequestMapping("/approvalTeleconference.action")
	public String approvalIP(int teleconference_id,String approvalStatus,int assign_emp_id,HttpServletRequest request) throws Exception {
		System.out.println("=====================approvalTeleconference========================");
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int emp_id = employee.getEmp_Id();
		Teleconference teleconference = teleconferenceService.findTeleconferenceById(teleconference_id);
		teleconference.setApproval_emp_id(emp_id);
		teleconference.setApprovalStatus(approvalStatus);
		teleconference.setAssign_emp_id(assign_emp_id);
		teleconference.setApprovalDate(new Date());
		teleconference.setAssignStatus("未分配");
		
		teleconferenceService.updateTeleconference(teleconference);
		return "approvalTeleconference.jsp";
	}
	
	//分配查找
	@RequestMapping("/findTeleconferenceToAssign")
	public void findTeleconferenceToAssign(HttpServletRequest request,HttpServletResponse response)throws Exception{
		System.out.println("============findTeleconferenceToAssign============");
		response.setContentType("text/html;charset=UTF-8");
		Map<String,Object> map = new HashMap<String, Object>();
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int emp_id = employee.getEmp_Id();
		map.put("assign_emp_id", emp_id);
		List<Object> objList = teleconferenceService.queryTeleconferenceForDispose(map);
		System.out.println(objList.size());
		if(objList!=null && objList.size()>0){
			SerializeConfig sc=new SerializeConfig();
			sc.put(Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd"));
			System.out.println(JSON.toJSONString(objList, sc, SerializerFeature.WriteNullListAsEmpty));
			String Json = JSON.toJSONString(objList, sc, SerializerFeature.WriteNullListAsEmpty);
			PrintWriter out = response.getWriter();
			out.write(Json);
			out.flush();
			out.close();
		}
	}
		
	//分配动作
	@RequestMapping("/assignTeleconference.action")
	public String assignIP(int teleconference_id,int process_emp_id,HttpServletRequest request) throws Exception {
		System.out.println("=====================assignTeleconference========================");
		Teleconference teleconference = teleconferenceService.findTeleconferenceById(teleconference_id);
		
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int emp_id = employee.getEmp_Id();
		teleconference.setAssign_emp_id(emp_id);
		teleconference.setAssignStatus("已分配");
		teleconference.setAssignDate(new Date());
		teleconference.setProcess_emp_id(process_emp_id);
		teleconference.setProcessStatus("未处理");
		
		teleconferenceService.updateTeleconference(teleconference);
		return "assignTeleconference.jsp";
	}
	
	//处理查找
	@RequestMapping("/findTeleconferenceToProcess")
	public void findTeleconferenceTo(HttpServletRequest request,HttpServletResponse response)throws Exception{
		System.out.println("============findTeleconferenceTo============");
		response.setContentType("text/html;charset=UTF-8");
		Map<String,Integer> map = new HashMap<String, Integer>();
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int emp_id = employee.getEmp_Id();
		map.put("process_emp_id", emp_id);
		List<Object> objList = teleconferenceService.queryTeleconferenceForDispose(map);
		
		if(objList!=null && objList.size()>0){
			SerializeConfig sc=new SerializeConfig();
			sc.put(Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd"));
			System.out.println(JSON.toJSONString(objList, sc, SerializerFeature.WriteNullListAsEmpty));
			String Json = JSON.toJSONString(objList, sc, SerializerFeature.WriteNullListAsEmpty);
			PrintWriter out = response.getWriter();
			out.write(Json);
			out.flush();
			out.close();
		}
	}
	
	//处理动作
	@RequestMapping("/processTeleconference.action")
	public String Teleconference(int teleconference_id,String processStatus,HttpServletRequest request) throws Exception {
		System.out.println("=====================Teleconference========================");
		Teleconference teleconference = teleconferenceService.findTeleconferenceById(teleconference_id);
		
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int emp_id = employee.getEmp_Id();
		teleconference.setProcessStatus(processStatus);
		teleconference.setProcessDate(new Date());
		teleconference.setProcess_emp_id(emp_id);
		
		teleconferenceService.updateTeleconference(teleconference);
		return "processTeleconference.jsp";
	}
}
