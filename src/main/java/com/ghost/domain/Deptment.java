package com.ghost.domain;

import java.io.Serializable;


public class Deptment implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -48155146554822776L;
	private int dept_Id;
	private String deptName;
	

	public Deptment(int dept_Id, String deptName) {
		super();
		this.dept_Id = dept_Id;
		this.deptName = deptName;
	}


	public Deptment() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getDept_Id() {
		return dept_Id;
	}


	public void setDept_Id(int dept_Id) {
		this.dept_Id = dept_Id;
	}


	public String getDeptName() {
		return deptName;
	}


	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}


	@Override
	public String toString() {
		return "Deptment [dept_Id=" + dept_Id + ", deptName=" + deptName + "]";
	}

}
