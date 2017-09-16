package com.ghost.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
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
import com.ghost.domain.Menus;
import com.ghost.service.EmployeeService;
import com.ghost.service.PrivilegeService;
import com.github.pagehelper.PageHelper;

@Controller
@RequestMapping("/Employee")
public class EmployeeController {
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private PrivilegeService privilegeService;

	@RequestMapping("/queryEmployee.action")
	public @ResponseBody Map<String, Object> findAllEmplyees(int page,int rows) throws Exception {
		System.out.println("=====================findAllEmplyees========================");

		PageHelper.startPage(page, rows);
		List<Employee> employeesList = employeeService.findAllEmployee();

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("total", employeeService.totalSize());
		map.put("rows", employeesList);
		//方式二
		/*if(employeesList!=null && employeesList.size()>0){
			SerializeConfig sc=new SerializeConfig();
			sc.put(Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd HH:mm:ss"));
			System.out.println(JSON.toJSONString(employeesList, sc, SerializerFeature.WriteNullListAsEmpty));
			String Json = JSON.toJSONString(employeesList, sc, SerializerFeature.WriteNullListAsEmpty);
			//String str = JSON.toJSONString(employeesList);
			PrintWriter out = response.getWriter();
			out.write(Json);
			out.flush();
			out.close();
		}*/
		
		return map;
	}

	// 增加员工
	@RequestMapping("/addEmployee.action")
	public void addEmployee(Employee employee) throws Exception {
		System.out.println("=====================addDeptment========================");
		employeeService.addEmployee(employee);
	}

	// 修改员工
	@RequestMapping("/updateEmployee.action")
	public void updateEmployee(Employee employee) throws Exception {
		System.out.println("=====================updateEmployee========================");
		employeeService.updateEmployee(employee);
	}
	
	// 修改员工个人信息
	@RequestMapping("/updateEmployeeInfo.action")
	public void updateEmployeeInfo(Employee employee,HttpServletRequest request,HttpServletResponse response) throws Exception {
		System.out.println("=====================updateEmployeeInfo========================");
		PrintWriter out = response.getWriter();
		employeeService.updateEmployeeInfo(employee);
		request.getSession().setAttribute("employee", employee);
		out.print("<script>top.location='index.jsp'</script>");
	}
	
	// 删除员工
	@RequestMapping("/deleteEmployees.action")
	public void deleteEmployees(int id) throws Exception {
		System.out.println("=====================deleteDeptments========================");
		employeeService.deleteEmployees(id);
	}

	@RequestMapping("/login")
	public String login(Employee employee,HttpSession session)
			throws Exception {
		System.out.println("=====================login========================");
		try {
			employee= employeeService.login(employee);
			if (employee != null) {
				Map<String,Integer> map = new HashMap<String, Integer>();
				map.put("emp_id", employee.getEmp_Id());
				List<Menus> menuList = privilegeService.findForLogin(map);
				for(Menus menu:menuList){
					if(menu.getMenu_id()==101){
						System.out.println("-------------0-----------");
						int menu_id00 = menu.getMenu_id();
						session.setAttribute("menu_id00", menu_id00);
					}else if(menu.getMenu_id()==107){
						System.out.println("--------------1----------");
						int menu_id01 = menu.getMenu_id();
						session.setAttribute("menu_id01", menu_id01);
					}else if(menu.getMenu_id()==113){
						System.out.println("-------------2-----------");
						int menu_id02 = menu.getMenu_id();
						session.setAttribute("menu_id02", menu_id02);
					}else if(menu.getMenu_id()==119){
						System.out.println("--------------3----------");
						int menu_id03 = menu.getMenu_id();
						session.setAttribute("menu_id03", menu_id03);
					}else if(menu.getMenu_id()==124){
						System.out.println("--------------4----------");
						int menu_id04 = menu.getMenu_id();
						session.setAttribute("menu_id04", menu_id04);
					}else if(menu.getMenu_id()==129){
						System.out.println("--------------5----------");
						int menu_id05 = menu.getMenu_id();
						session.setAttribute("menu_id05", menu_id05);
					}else if(menu.getMenu_id()==132){
						System.out.println("--------------6----------");
						int menu_id06 = menu.getMenu_id();
						session.setAttribute("menu_id06", menu_id06);
					}
				}
				session.setAttribute("employee", employee);
				return "redirect:index.jsp";
			}else{
				return "redirect:login.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session)
			throws Exception {
		System.out.println("=====================logout========================");
		try {
			//session.removeAttribute("employee");
			session.invalidate();
			return "login.jsp";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping("/exportExcel")  
    public String exportExcel(HttpServletResponse response) throws Exception 
    {  
        response.setContentType("application/binary;charset=ISO8859_1");  
        try  
        {  
            ServletOutputStream outputStream = response.getOutputStream();  
            
            String fileName = new String(("导出员工excel").getBytes(), "ISO8859_1");  
            response.setHeader("Content-disposition", "attachment; filename=" + fileName + ".xlsx");// 组装附件名称和格式  
            String[] titles = { "员工编号", "部门编号", "员工姓名","密码","性别", "生日", "入职时间","手机","备注"};  
            employeeService.exportExcel(titles, outputStream);
        }  
        catch (Exception e)  
        {  
            e.printStackTrace();  
        }  
        return null;  
    }
	
}
