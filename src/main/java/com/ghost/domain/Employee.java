package com.ghost.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Employee {
	private int emp_Id;
	private int dept_Id;
	private String empName;
	private String password;
	private String sex;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date birthday;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	private long cellphone;
	private String empContent;

	public Employee() {
	}

	public Employee(int emp_Id, int dept_Id, String empName, String password,
			String sex, Date birthday, Date createTime, long cellphone,
			String empContent) {
		super();
		this.emp_Id = emp_Id;
		this.dept_Id = dept_Id;
		this.empName = empName;
		this.password = password;
		this.sex = sex;
		this.birthday = birthday;
		this.createTime = createTime;
		this.cellphone = cellphone;
		this.empContent = empContent;
	}

	public Employee(int dept_Id, String empName, String password, String sex,
			Date birthday, Date createTime, long cellphone, String empContent) {
		super();
		this.dept_Id = dept_Id;
		this.empName = empName;
		this.password = password;
		this.sex = sex;
		this.birthday = birthday;
		this.createTime = createTime;
		this.cellphone = cellphone;
		this.empContent = empContent;
	}

	public int getEmp_Id() {
		return emp_Id;
	}

	public void setEmp_Id(int emp_Id) {
		this.emp_Id = emp_Id;
	}

	public int getDept_Id() {
		return dept_Id;
	}

	public void setDept_Id(int dept_Id) {
		this.dept_Id = dept_Id;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public long getCellphone() {
		return cellphone;
	}

	public void setCellphone(long cellphone) {
		this.cellphone = cellphone;
	}

	public String getEmpContent() {
		return empContent;
	}

	public void setEmpContent(String empContent) {
		this.empContent = empContent;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Employee [emp_Id=");
		builder.append(emp_Id);
		builder.append(", dept_Id=");
		builder.append(dept_Id);
		builder.append(", empName=");
		builder.append(empName);
		builder.append(", password=");
		builder.append(password);
		builder.append(", sex=");
		builder.append(sex);
		builder.append(", birthday=");
		builder.append(birthday);
		builder.append(", createTime=");
		builder.append(createTime);
		builder.append(", cellphone=");
		builder.append(cellphone);
		builder.append(", empContent=");
		builder.append(empContent);
		builder.append("]");
		return builder.toString();
	}

}
