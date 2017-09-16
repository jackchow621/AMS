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
import com.ghost.domain.Employee;
import com.ghost.domain.IP;
import com.ghost.domain.Leaves;
import com.ghost.domain.Memory;
import com.ghost.service.MemoryService;
import com.github.pagehelper.PageHelper;

@Controller
@RequestMapping("/Memory")
public class MemoryController {
	@Autowired
	private MemoryService memoryService;

	
	//根据员工的id来查询特定的数据
	@RequestMapping("/queryMemory")
	public void findMemoryByEmpId(HttpServletRequest request,HttpServletResponse response)throws Exception{
		System.out.println("===========findMemoryByEmpId============");
		response.setContentType("text/html;charset=utf-8");
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int emp_id = employee.getEmp_Id();
		List<Memory> memoryList = memoryService.findMemoryByEmpId(emp_id);
		if(memoryList!=null && memoryList.size()>0){
			SerializeConfig sc=new SerializeConfig();
			sc.put(Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd"));
			System.out.println(JSON.toJSONString(memoryList, sc, SerializerFeature.WriteNullListAsEmpty));
			String Json = JSON.toJSONString(memoryList, sc, SerializerFeature.WriteNullListAsEmpty);
			//String str = JSON.toJSONString(employeesList);
			PrintWriter out = response.getWriter();
			out.write(Json);
			out.flush();
			out.close();
		}
	}
	
	
	//根据内存空间申请表的id来查询特定的内存空间申请表的数据
	/*@RequestMapping("/findMemoryById")
	public ModelAndView findMemoryById(HttpServletRequest request) throws Exception{
		System.out.println("===========findMemoryById============");
		//接收内存空间申请表的id
		int memory_id=Integer.parseInt(request.getParameter("memory_id"));
		
		System.out.println(memory_id+"================");
		//根据内存空间申请的id来查询的有关数据
		Memory memory=memoryService.findMemoryById(memory_id);
		
		
		//创建modelAndView准备填充数据、设置视图
		ModelAndView modelAndView=new ModelAndView();
		
		//填充数据
		modelAndView.addObject("memory", memory);
		//视图
		modelAndView.setViewName("editMemory.jsp");
		
		return modelAndView;
		
	}*/
	
	
	//增加内存空间申请表的数据
	/*@RequestMapping("/addMemory")
	public String addMemory(Memory memory,String reason,HttpServletRequest request) throws Exception {
		System.out.println("=====================addMemory========================");
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int emp_id = employee.getEmp_Id();
		Date applicationDate = new Date();
		memory.setApplicationDate(applicationDate);
		memory.setReason(reason);
		memory.setEmp_id(emp_id);
		String approvalStatus = "未审批";//表示未审批状态
		memory.setApprovalStatus(approvalStatus);
		memoryService.addMemory(memory);
		return "ipList.jsp";
	}*/
	@RequestMapping("/addMemory")
	public String addMemory(Memory memory,HttpServletRequest request) throws Exception{
		System.out.println("===========addMemory============");
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		int emp_id = employee.getEmp_Id();
		Date applicationDate = new Date();
		String approvalStatus = "未审批";//表示未审批状态
		memory.setEmp_id(emp_id);
		memory.setApplicationDate(applicationDate);
		memory.setApprovalStatus(approvalStatus);
		System.out.println(memory);
		memoryService.addMemory(memory);
		
		return "redirect:memoryList.jsp";
		
	}
	
	
	//修改内存空间申请表的数据
	@RequestMapping("/updateMemory")
	public void updateMemory(Memory memory) throws Exception{
		System.out.println("===========updateMemory============");
		
		memoryService.updateMemory(memory);
		
	}
	
	
	//删除内存空间申请表的数据
	@RequestMapping("/deleteMemory")
	public String deleteMemory(Integer[] Memory_ids) throws Exception{
		System.out.println("===========deleteMemory============");
		System.out.println("=====================delIP========================");
		for (int i = 0; i < Memory_ids.length; i++) {
			memoryService.deleteMemory(Memory_ids[i]);
		}
		return "memoryList.jsp";
		
	}
	
	//审批查找
		@RequestMapping("/queryToApproval")
		public void queryToApproval(HttpServletRequest request,HttpServletResponse response)throws Exception{
			System.out.println("============queryToApproval============");
			response.setContentType("text/html;charset=utf-8");
			Map<String,Integer> map = new HashMap<String, Integer>();
			ModelAndView modelAndView = new ModelAndView();
			Employee employee = (Employee) request.getSession().getAttribute("employee");
			int dept_id = employee.getDept_Id();
			map.put("dept_id", dept_id);
			List<Object> objList = memoryService.queryMemoryForDispose(map);

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
		@RequestMapping("/approvalMemory.action")
		public String approvalMemory(int memory_id,String approvalStatus,int assign_emp_id,HttpServletRequest request) throws Exception {
			System.out.println("=====================approvalMemory========================");
			Employee employee = (Employee) request.getSession().getAttribute("employee");
			int emp_id = employee.getEmp_Id(); 
			Memory memory = memoryService.findMemoryById(memory_id);
			memory.setApproval_emp_id(emp_id);
			memory.setApprovalStatus(approvalStatus);
			memory.setApprovalDate(new Date());
			/*int assign_emp_id = 100010;//随机分配 系统查询员工表取到负责分配工作的员工编号
*/			memory.setAssign_emp_id(assign_emp_id);
			memory.setAssignStatus("未分配");
			memoryService.updateMemory(memory);
			return "approvalMemory.jsp";
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
			
			List<Object> objList = memoryService.queryMemoryForDispose(map);
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
		@RequestMapping("/assignMemory.action")
		public String assignMemory(int memory_id,int process_emp_id,HttpServletRequest request) throws Exception {
			System.out.println("=====================assignMemory========================");
			Memory memory = memoryService.findMemoryById(memory_id);
			String assignStatus = "已分配";
			memory.setAssignStatus(assignStatus);
			memory.setAssignDate(new Date());
			memory.setProcess_emp_id(process_emp_id);
			String processStatus = "未处理";
			memory.setProcessStatus(processStatus);
			memoryService.updateMemory(memory);
			return "assignMemory.jsp";
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
			List<Object> objList = memoryService.queryMemoryForDispose(map);
			
			
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
		@RequestMapping("/processMemory.action")
		public String processMemory(int memory_id,String processStatus,HttpServletRequest request) throws Exception {
			System.out.println("=====================processIP========================");
			Memory memory = memoryService.findMemoryById(memory_id);
			memory.setProcessDate(new Date());
			memory.setProcessStatus(processStatus);
			memoryService.updateMemory(memory);
			return "processMemory.jsp";
		}
	
}
