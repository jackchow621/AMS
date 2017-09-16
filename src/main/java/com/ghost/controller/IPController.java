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
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializeConfig;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.SimpleDateFormatSerializer;
import com.ghost.domain.Employee;
import com.ghost.domain.IP;
import com.ghost.service.IPService;

@Controller
@RequestMapping("/IP")
public class IPController {
	@Autowired
	private IPService ipService;
	//查找员工本人的所有IP地址申请单记录
	@RequestMapping("/queryIP")
	public void findByEmpId(HttpServletRequest request,HttpServletResponse response)throws Exception{
		System.out.println("===========findIPById============");
		response.setContentType("text/html;charset=utf-8");
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int emp_id = employee.getEmp_Id();
		List<IP> ipList = ipService.findByEmpid(emp_id);
		
		
		
		if(ipList!=null && ipList.size()>0){
			SerializeConfig sc=new SerializeConfig();
			sc.put(Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd"));
			System.out.println(JSON.toJSONString(ipList, sc, SerializerFeature.WriteNullListAsEmpty));
			String Json = JSON.toJSONString(ipList, sc, SerializerFeature.WriteNullListAsEmpty);
			//String str = JSON.toJSONString(employeesList);
			PrintWriter out = response.getWriter();
			out.write(Json);
			out.flush();
			out.close();
		}
	}
	
	//按IP表编号查找要修改的IP地址申请单记录
	@RequestMapping("/queryIP_id")
	public ModelAndView findByIP_Id(HttpServletRequest request)throws Exception{
		System.out.println("===========findByIP_Id============");
		int IP_id = Integer.parseInt(request.getParameter("IP_id"));
		IP ip = ipService.findByIPid(IP_id);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("ip",ip);
		modelAndView.setViewName("editIP.jsp");
		return modelAndView;
	}
	
	//创建IP地址申请单
	@RequestMapping("/addIP")
	public String addIP(IP ip,String reason,HttpServletRequest request) throws Exception {
		System.out.println("=====================addIP========================");
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int emp_id = employee.getEmp_Id();
		Date applicationDate = new Date();
		ip.setApplicationDate(applicationDate);
		ip.setReason(reason);
		ip.setEmp_id(emp_id);
		String approvalStatus = "未审批";//表示未审批状态
		ip.setApprovalStatus(approvalStatus);
		ipService.addIP(ip);
		return "ipList.jsp";
	}
	
	//删除IP地址申请单
	@RequestMapping("/delIP")
	public String delIP(Integer[] IP_ids) throws Exception {
		System.out.println("=====================delIP========================");
		for (int i = 0; i < IP_ids.length; i++) {
			ipService.delIP(IP_ids[i]);
		}
		return "ipList.jsp";
	}
	
	//修改IP地址申请单
	@RequestMapping("/editIP.action")
	public String editIP(IP ip) throws Exception {
		System.out.println("=====================editIP========================");
		Date applicationDate = new Date();
		ip.setApplicationDate(applicationDate);
		ip.setApprovalStatus("未审批");
		
		ipService.editIP(ip);
		return "ipList.jsp";
	}
	
	//审批查找
	@RequestMapping("/queryToApproval")
	public void queryToApproval(HttpServletRequest request,HttpServletResponse response)throws Exception{
		System.out.println("============queryToApproval============");
		response.setContentType("text/html;charset=utf-8");
		Map<String,Integer> map = new HashMap<String, Integer>();
		
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int dept_id = employee.getDept_Id();
		map.put("dept_id", dept_id);
		List<Object> objList = ipService.queryIPForDispose(map);

		if(objList!=null && objList.size()>0){
			SerializeConfig sc=new SerializeConfig();
			sc.put(Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd"));
			System.out.println(JSON.toJSONString(objList, sc, SerializerFeature.WriteNullListAsEmpty));
			String Json = JSON.toJSONString(objList, sc, SerializerFeature.WriteNullListAsEmpty);
			//String str = JSON.toJSONString(employeesList);
			PrintWriter out = response.getWriter();
			out.write(Json);
			out.flush();
			out.close();
		}
	}
	
	//审批动作
	@RequestMapping("/approvalIP.action")
	public String approvalIP(int iP_id,String approvalStatus,int assign_emp_id,HttpServletRequest request,HttpServletResponse response) throws Exception {
		System.out.println("=====================approvalIP========================");
		response.setContentType("text/html;charset=utf-8");
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int emp_id = employee.getEmp_Id(); 
		IP ip = ipService.findByIPid(iP_id);
		
		System.out.println(assign_emp_id);
		
		ip.setApproval_emp_id(emp_id);
		ip.setApprovalStatus(approvalStatus);
		ip.setApprovalDate(new Date());
		ip.setAssign_emp_id(assign_emp_id);
		ip.setAssignStatus("未分配");
		
		ipService.editIP(ip);
		return "approvalIP.jsp";
	}
	
	//分配查找
	@RequestMapping("/queryToAssign")
	public void queryToAssign(HttpServletRequest request,HttpServletResponse response)throws Exception{
		System.out.println("============queryToAssign============");
		response.setContentType("text/html;charset=utf-8");
		
		Map<String,Integer> map = new HashMap<String, Integer>();
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int emp_id = employee.getEmp_Id();
		map.put("assign_emp_id", emp_id);
		
		List<Object> objList = ipService.queryIPForDispose(map);
		System.out.println(objList.get(0));
		
		if(objList!=null && objList.size()>0){
			SerializeConfig sc=new SerializeConfig();
			sc.put(Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd"));
			System.out.println(JSON.toJSONString(objList, sc, SerializerFeature.WriteNullListAsEmpty));
			String Json = JSON.toJSONString(objList, sc, SerializerFeature.WriteNullListAsEmpty);
			//String str = JSON.toJSONString(employeesList);
			PrintWriter out = response.getWriter();
			out.write(Json);
			out.flush();
			out.close();
		}
		
	}
	
	//分配动作
	@RequestMapping("/assignIP.action")
	public String assignIP(int iP_id,int process_emp_id,HttpServletRequest request) throws Exception {
		System.out.println("=====================assignIP========================");
		IP ip = ipService.findByIPid(iP_id);
		String assignStatus = "已分配";
		ip.setAssignStatus(assignStatus);
		ip.setAssignDate(new Date());
		ip.setProcess_emp_id(process_emp_id);
		String processStatus = "未处理";
		ip.setProcessStatus(processStatus);
		ipService.editIP(ip);
		return "assignIP.jsp";
	}
	
	//处理查找
	@RequestMapping("/queryToProcess")
	public void queryToProcess(HttpServletRequest request,HttpServletResponse response)throws Exception{
		System.out.println("============queryToProcess============");
		response.setContentType("text/html;charset=utf-8");
		
		Map<String,Integer> map = new HashMap<String, Integer>();		
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		
		int emp_id = employee.getEmp_Id();
		map.put("process_emp_id", emp_id);
		List<Object> objList = ipService.queryIPForDispose(map);
		
		
		if(objList!=null && objList.size()>0){
			SerializeConfig sc=new SerializeConfig();
			sc.put(Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd"));
			System.out.println(JSON.toJSONString(objList, sc, SerializerFeature.WriteNullListAsEmpty));
			String Json = JSON.toJSONString(objList, sc, SerializerFeature.WriteNullListAsEmpty);
			//String str = JSON.toJSONString(employeesList);
			PrintWriter out = response.getWriter();
			out.write(Json);
			out.flush();
			out.close();
		}
	}
	
	//处理动作
	@RequestMapping("/processIP.action")
	public String processIP(int iP_id,String processStatus,HttpServletRequest request) throws Exception {
		System.out.println("=====================processIP========================");
		IP ip = ipService.findByIPid(iP_id);
		ip.setProcessDate(new Date());
		ip.setProcessStatus(processStatus);
		ipService.editIP(ip);
		return "processIP.jsp";
	}
}
