package com.ghost.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Teleconference {
	//这是电话会议申请表
	private int teleconference_id;
	private int emp_id;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date meetDate;
	private String room;
	private String beginDate;
	private String endDate;
	private int conventioner;
	private String isDevice;
	private String requirement;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date applicationDate;
	private int telephone;
	private int approval_emp_id;
	private String approvalStatus;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date approvalDate;
	private int assign_emp_id;
	private String assignStatus;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date assignDate;
	private int process_emp_id;
	private String processStatus;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date processDate;
	private String comment;
	private Employee employee;
	
	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Teleconference() {
		super();
	}

	public int getTeleconference_id() {
		return teleconference_id;
	}

	public void setTeleconference_id(int teleconference_id) {
		this.teleconference_id = teleconference_id;
	}

	public int getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}

	public Date getMeetDate() {
		return meetDate;
	}

	public void setMeetDate(Date meetDate) {
		this.meetDate = meetDate;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getConventioner() {
		return conventioner;
	}

	public void setConventioner(int conventioner) {
		this.conventioner = conventioner;
	}

	public String getIsDevice() {
		return isDevice;
	}

	public void setIsDevice(String isDevice) {
		this.isDevice = isDevice;
	}

	public String getRequirement() {
		return requirement;
	}

	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}

	public Date getApplicationDate() {
		return applicationDate;
	}

	public void setApplicationDate(Date applicationDate) {
		this.applicationDate = applicationDate;
	}

	public int getTelephone() {
		return telephone;
	}

	public void setTelephone(int telephone) {
		this.telephone = telephone;
	}

	public int getApproval_emp_id() {
		return approval_emp_id;
	}

	public void setApproval_emp_id(int approval_emp_id) {
		this.approval_emp_id = approval_emp_id;
	}

	public String getApprovalStatus() {
		return approvalStatus;
	}

	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}

	public Date getApprovalDate() {
		return approvalDate;
	}

	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
	}

	public int getAssign_emp_id() {
		return assign_emp_id;
	}

	public void setAssign_emp_id(int assign_emp_id) {
		this.assign_emp_id = assign_emp_id;
	}

	public String getAssignStatus() {
		return assignStatus;
	}

	public void setAssignStatus(String assignStatus) {
		this.assignStatus = assignStatus;
	}

	public Date getAssignDate() {
		return assignDate;
	}

	public void setAssignDate(Date assignDate) {
		this.assignDate = assignDate;
	}

	public int getProcess_emp_id() {
		return process_emp_id;
	}

	public void setProcess_emp_id(int process_emp_id) {
		this.process_emp_id = process_emp_id;
	}

	public String getProcessStatus() {
		return processStatus;
	}

	public void setProcessStatus(String processStatus) {
		this.processStatus = processStatus;
	}

	public Date getProcessDate() {
		return processDate;
	}

	public void setProcessDate(Date processDate) {
		this.processDate = processDate;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
}
