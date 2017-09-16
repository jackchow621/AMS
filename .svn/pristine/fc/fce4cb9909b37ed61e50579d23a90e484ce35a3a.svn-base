package com.ghost.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializeConfig;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.SimpleDateFormatSerializer;
import com.ghost.domain.Email;
import com.ghost.domain.Employee;
import com.ghost.service.EmailService;
import com.github.pagehelper.PageHelper;

@Controller
@RequestMapping("/Email")
public class EmailController {
	@Autowired
	private EmailService emailService;
	
	
	//根据员工id来查询特定的邮箱申请表数据
	@RequestMapping("/findEmailByEmpId")
	public void findEmailByEmpId(HttpServletRequest request,HttpServletResponse response) throws Exception{
		System.out.println("===========findEmailByEmpId============");
		
		response.setContentType("text/html;charset=utf-8");
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int emp_Id = employee.getEmp_Id();
		List<Email> emailList = emailService.findEmailByEmpId(emp_Id);
		
		if(emailList!=null && emailList.size()>0){
			SerializeConfig sc=new SerializeConfig();
			sc.put(Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd"));
			System.out.println(JSON.toJSONString(emailList, sc, SerializerFeature.WriteNullListAsEmpty));
			String Json = JSON.toJSONString(emailList, sc, SerializerFeature.WriteNullListAsEmpty);
			//String str = JSON.toJSONString(employeesList);
			PrintWriter out = response.getWriter();
			out.write(Json);
			out.flush();
			out.close();
		}
	}
	
	
	
	
	//增加邮箱申请表的数据
	@RequestMapping("/addEmail")
	public String addEmail(Email email,String reason,HttpServletRequest request) throws Exception{
		System.out.println("===========addEmail============");
		
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int emp_Id = employee.getEmp_Id();
		Date applicationDate = new Date();
		email.setApplicationDate(applicationDate);
		email.setReason(reason);
		email.setEmp_id(emp_Id);
		String approvalStatus = "未审批";//表示未审批状态
		email.setApprovalStatus(approvalStatus);
		emailService.addEmail(email);
		return "emailList.jsp";
		
	}
	
	
	//修改邮箱申请表的数据
	@RequestMapping("/updateEmail")
	public String updateEmail(Email email) throws Exception{
		System.out.println("===========updateEmail============");
		System.out.println(email.getEmp_id());
		Date applicationDate = new Date();
		email.setApplicationDate(applicationDate);
		email.setApprovalStatus("未审批");
		
		emailService.updateEmail(email);
		return "emailList.jsp";
	}
	
	
	
	//删除邮箱申请表的数据
	@RequestMapping("/deleteEmail")
	public String deleteEmail(Integer[] email_ids) throws Exception{
		System.out.println("===========deleteEmail============");
		
		for(int i=0;i<email_ids.length;i++){
			emailService.deleteEmail(email_ids[i]);
		}
		
		return "emailList.jsp";
		
	}
	
	
	//email申请表的审批查找
	@RequestMapping("/findEmailToApproval")
	public void findEmailToApproval(HttpServletRequest request,HttpServletResponse response) throws Exception{
		System.out.println("===========findEmailToApproval==========");
		response.setContentType("text/html;charset=utf-8");
		Map<String,Integer> map = new HashMap<String, Integer>();
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int dept_Id = employee.getDept_Id();
		map.put("dept_Id", dept_Id);
		List<Object> objList = emailService.queryEmailForDispose(map);

		if(objList!=null && objList.size()>0){
			SerializeConfig sc=new SerializeConfig();
			sc.put(Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd"));
			String Json = JSON.toJSONString(objList, sc, SerializerFeature.WriteNullListAsEmpty);
			PrintWriter out = response.getWriter();
			out.write(Json);
			out.flush();
			out.close();
		}
		
	}
	
	
	//修改email申请表的审批动作
	@RequestMapping("/approvalEmail")
	public String approvalEmail(int email_id,int assign_emp_id,String approvalStatus,HttpServletRequest request) throws Exception{
		System.out.println("===============approvalEmail===============");
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int emp_Id = employee.getEmp_Id(); 
		Email email = emailService.findEmailById(email_id);
		
		System.out.println(assign_emp_id);
		
		email.setApproval_emp_id(emp_Id);
		email.setApprovalStatus(approvalStatus);
		email.setApprovalDate(new Date());
		email.setAssign_emp_id(assign_emp_id);
		email.setAssignStatus("未分配");
		
		emailService.updateEmail(email);
		return "emailList.jsp";
	}
	
	
	//email申请表的分配查找
	@RequestMapping("/findEmailToAssign")
	public void findEmailToAssign(HttpServletRequest request,HttpServletResponse response) throws Exception{
		System.out.println("==========findEmailToAssign============");
		response.setContentType("text/html;charset=utf-8");
		Map<String,Integer> map = new HashMap<String, Integer>();
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int emp_id = employee.getEmp_Id();
		map.put("assign_emp_id", emp_id);
		List<Object> objList = emailService.queryEmailForDispose(map);
		
		if(objList!=null && objList.size()>0){
			SerializeConfig sc=new SerializeConfig();
			sc.put(Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd"));
			String Json = JSON.toJSONString(objList, sc, SerializerFeature.WriteNullListAsEmpty);
			PrintWriter out = response.getWriter();
			out.write(Json);
			out.flush();
			out.close();
		}
		
	}
	
	//修改email申请表的分配动作
	@RequestMapping("/assignEmail")
	public String assignEmail(int email_id,int process_emp_id,HttpServletRequest request) throws Exception{
		System.out.println("==========assignEmail===============");
		
		Email email = emailService.findEmailById(email_id);
		String assignStatus = "已分配";
		email.setAssignStatus(assignStatus);
		email.setAssignDate(new Date());
		email.setProcess_emp_id(process_emp_id);
		String processStatus = "未处理";
		email.setProcessStatus(processStatus);
		emailService.updateEmail(email);
		
		return "assignEmail.jsp";
		
	}
	
	
	//email申请表的处理查找
	@RequestMapping("/findEmailToProcess")
	public void findEmailToProcess(HttpServletRequest request,HttpServletResponse response) throws Exception{
		System.out.println("========findEmailToProcess===========");
		response.setContentType("text/html;charset=utf-8");
		Map<String,Integer> map = new HashMap<String, Integer>();
		ModelAndView modelAndView = new ModelAndView();
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int emp_id = employee.getEmp_Id();
		map.put("process_emp_id", emp_id);
		List<Object> objList = emailService.queryEmailForDispose(map);
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
	
	
	//email申请表的处理动作
	@RequestMapping("/processEmail")
	public String processEmail(int email_id,String processStatus,HttpServletRequest request) throws Exception{
		System.out.println("===========processEmail==============");
		
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int emp_id = employee.getEmp_Id();
		Email email=emailService.findEmailById(email_id);
		email.setProcessDate(new Date());
		email.setProcessStatus(processStatus);
		email.setProcess_emp_id(emp_id);
		emailService.updateEmail(email);
		return "processEmail.jsp";
		
	}
	
	
}
