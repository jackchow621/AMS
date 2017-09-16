package com.ghost.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
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

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializeConfig;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ghost.domain.Emp_Role;
import com.ghost.domain.Employee;
import com.ghost.service.EmployeeService;
import com.ghost.service.PrivilegeService;
import com.github.pagehelper.PageHelper;

@Controller
@RequestMapping("/Privilege")
public class PrivilegeController {
	@Autowired
	private PrivilegeService privilegeService;
	//查找员工所拥有的角色
	@RequestMapping("/findAllEmpPrivilege")
	public @ResponseBody Map<String, Object> findAllEmpPrivilege(Integer page,Integer rows,HttpServletRequest request)throws Exception{
		System.out.println("===========findAllEmpPrivilege============");
		HashMap<String, Object> map = new HashMap<String, Object>();
		String str = request.getParameter("searchName");
		if(str==null){
			PageHelper.startPage(page, rows);
			List<Emp_Role> erList = privilegeService.findAllEmpPrivilege(map);
			map.put("total",privilegeService.totalSize());
			map.put("rows", erList);
			return map;
		}else{
			//HashMap<String, Object> map1 = new HashMap<String, Object>();
			map.put("str", str);
			List<Emp_Role> erList = privilegeService.findAllEmpPrivilege(map);
			map.put("total",privilegeService.totalSize());
			map.put("rows", erList);
			return map;
		}
		/*SerializeConfig sc=new SerializeConfig();
		String Json = JSON.toJSONString(erList, sc, SerializerFeature.WriteNullListAsEmpty);
		PrintWriter out = response.getWriter();
		out.write(Json);
		out.flush();
		out.close();*/
		
	}
	
	//增加用户的角色
	@RequestMapping("/savePrivilege")
	public String savePrivilege(HttpServletRequest request,HttpServletResponse response) throws Exception {
		System.out.println("=====================savePrivilege========================");
		request.setCharacterEncoding("utf-8");
		
		try {
			HttpSession session = request.getSession();
			Map<String,Integer> map = new HashMap<String, Integer>();
			int emp_id = Integer.parseInt(request.getParameter("emp_id"));
			Employee employee = privilegeService.findEmployeeByEmpid(emp_id);
			if(employee!=null){
				int role_id = Integer.parseInt(request.getParameter("role_id"));
				map.put("emp_id", emp_id);
				map.put("role_id", role_id);
				privilegeService.savePrivilege(map);
				return "showPrivilege.jsp";
			}else{
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				String str = "对不起，您所输入的员工编号不存在，请确认后重新输入！";
				out.print(str);
				out.flush();
				out.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "";
	}
	
	//删除用户的角色
	@RequestMapping("/deletePrivilege")
	public String deletePrivilege(HttpServletRequest request) throws Exception {
		System.out.println("=====================deletePrivilege========================");
		String[] emp_ids = request.getParameter("emp_ids").split(",");
		for (int i = 0; i < emp_ids.length; i++) {
			int emp_id = Integer.parseInt(emp_ids[i]);
			privilegeService.deletePrivilege(emp_id);
		}
		return "showPrivilege.jsp";
	}
	
	//修改用户的角色
	@RequestMapping("/updatePrivilege")
	public String updatePrivilege(HttpServletRequest request) throws Exception {
		System.out.println("=====================updatePrivilege========================");
		int emp_id = Integer.parseInt(request.getParameter("emp_id"));
		int role_id = Integer.parseInt(request.getParameter("role_id"));
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("emp_id", emp_id);
		map.put("role_id", role_id);
		privilegeService.updatePrivilege(map);
		return "showPrivilege.jsp";
	}
	
	/*//按员工姓名进行模糊查询
	@RequestMapping("/findPrivilegeByStr")
	public @ResponseBody Map<String, String> findEmployeeByStr(HttpServletRequest request)throws Exception{
		System.out.println("=====================findPrivilegeByStr========================");
		String str = request.getParameter("searchName");
		Map<String,String> map = new HashMap<String, String>();
		map.put("str", str);
		List<Emp_Role> erList = privilegeService.findAllEmpPrivilege(map);
		return map;
	}*/
}
