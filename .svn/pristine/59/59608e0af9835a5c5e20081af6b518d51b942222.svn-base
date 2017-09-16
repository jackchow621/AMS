package com.ghost.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ghost.domain.Employee;
import com.ghost.mapper.EmployeeMapper;
import com.ghost.service.EmployeeService;
import com.ghost.util.ExportUtil;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	private EmployeeMapper employeeMapper;
	
	@Override
	public List<Employee> findAllEmployee() throws Exception {
		return employeeMapper.findAllEmployee();
	}

	@Override
	public void addEmployee(Employee employee) throws Exception {
		employeeMapper.addEmployee(employee);
	}

	@Override
	public void updateEmployee(Employee employee) throws Exception {
		employeeMapper.updateEmployee(employee);
	}
	
	@Override
	public void updateEmployeeInfo(Employee employee) throws Exception {
		employeeMapper.updateEmployeeInfo(employee);
	}

	@Override
	public void deleteEmployees(int id) throws Exception {
		employeeMapper.deleteEmployees(id);
	}

	@Override
	public Employee login(Employee employee) throws Exception {
		return employeeMapper.login(employee);
	}

	@Override
	public int totalSize() throws Exception{
		return employeeMapper.totalSize();
	}

	@Override
	public void exportExcel(String[] titles, ServletOutputStream outputStream) {
		// 创建一个workbook 对应一个excel应用文件
		XSSFWorkbook workBook = new XSSFWorkbook();
		
		// 在workbook中添加一个sheet,对应Excel文件中的sheet
		XSSFSheet sheet = workBook.createSheet("导出员工excel");
		
		ExportUtil exportUtil = new ExportUtil(workBook, sheet);
		
		//加入单元格样式
		XSSFCellStyle headStyle = exportUtil.getHeadStyle();
		XSSFCellStyle bodyStyle = exportUtil.getBodyStyle();
		
		//创建标题行	
		XSSFRow headRow = sheet.createRow(0);
		XSSFCell cell = null;
		//通过标题数据动态创建单元格个数
		for (int i = 0; i < titles.length; i++) {
			cell = headRow.createCell(i);
			cell.setCellStyle(headStyle);
			cell.setCellValue(titles[i]);
		}
		
		try {
			// 创建数据行
			List<Employee> employeesList = employeeMapper.findAllEmployee();
			
			XSSFCell employeeCell = null;
			
			for (int i = 0; i < employeesList.size(); i++) {
				Employee employee = employeesList.get(i);
				//创建行
				XSSFRow employeeRow = sheet.createRow(i+1);
				//创建列
				employeeCell = employeeRow.createCell(0);
				employeeCell.setCellStyle(bodyStyle);
				employeeCell.setCellValue(employee.getEmp_Id());
				
				employeeCell = employeeRow.createCell(1);
				employeeCell.setCellStyle(bodyStyle);
				employeeCell.setCellValue(employee.getDept_Id());
				
				employeeCell = employeeRow.createCell(2);
				employeeCell.setCellStyle(bodyStyle);
				employeeCell.setCellValue(employee.getEmpName());
				
				employeeCell = employeeRow.createCell(3);
				employeeCell.setCellStyle(bodyStyle);
				employeeCell.setCellValue(employee.getPassword());
				
				employeeCell = employeeRow.createCell(4);
				employeeCell.setCellStyle(bodyStyle);
				employeeCell.setCellValue(employee.getSex());
				
				employeeCell = employeeRow.createCell(5);
				employeeCell.setCellStyle(bodyStyle);
				employeeCell.setCellValue(employee.getBirthday());
				
				employeeCell = employeeRow.createCell(6);
				employeeCell.setCellStyle(bodyStyle);
				employeeCell.setCellValue(employee.getCreateTime());
				
				employeeCell = employeeRow.createCell(7);
				employeeCell.setCellStyle(bodyStyle);
				employeeCell.setCellValue(employee.getCellphone());
				
				employeeCell = employeeRow.createCell(8);
				employeeCell.setCellStyle(bodyStyle);
				employeeCell.setCellValue(employee.getEmpContent());
				
			}
			
			//输出
			workBook.write(outputStream);
			outputStream.flush();
			outputStream.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
