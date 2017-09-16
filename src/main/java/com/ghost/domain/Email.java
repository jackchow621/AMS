package com.ghost.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Email {
	//这是邮箱申请表
	private int email_id;
	private int emp_id;
	private String type;
	private Date beginDate;
	private Date endDate;
	private String reason;
	private Date applicationDate;
	private int approval_emp_id;
	private String approvalStatus;
	private Date approvalDate;
	private int assign_emp_id;
	private String assignStatus;
	private Date  assignDate;
	private int process_emp_id;
	private String processStatus;
	private Date  processDate;
	private String comment;
	
	private Employee employee;
	
	
	
	public Email() {
		super();
	}
	

	
	public Email(int emp_id, String type, Date beginDate, Date endDate,
			String reason, Date applicationDate, int approval_emp_id,
			String approvalStatus, Date approvalDate, int assign_emp_id,
			String assignStatus, Date assignDate, int process_emp_id,
			String processStatus, Date processDate, String comment,
			Employee employee) {
		super();
		this.emp_id = emp_id;
		this.type = type;
		this.beginDate = beginDate;
		this.endDate = endDate;
		this.reason = reason;
		this.applicationDate = applicationDate;
		this.approval_emp_id = approval_emp_id;
		this.approvalStatus = approvalStatus;
		this.approvalDate = approvalDate;
		this.assign_emp_id = assign_emp_id;
		this.assignStatus = assignStatus;
		this.assignDate = assignDate;
		this.process_emp_id = process_emp_id;
		this.processStatus = processStatus;
		this.processDate = processDate;
		this.comment = comment;
		this.employee = employee;
	}



	public Email(int email_id, int emp_id, String type, Date beginDate,
			Date endDate, String reason, Date applicationDate,
			int approval_emp_id, String approvalStatus, Date approvalDate,
			int assign_emp_id, String assignStatus, Date assignDate,
			int process_emp_id, String processStatus, Date processDate,
			String comment, Employee employee) {
		super();
		this.email_id = email_id;
		this.emp_id = emp_id;
		this.type = type;
		this.beginDate = beginDate;
		this.endDate = endDate;
		this.reason = reason;
		this.applicationDate = applicationDate;
		this.approval_emp_id = approval_emp_id;
		this.approvalStatus = approvalStatus;
		this.approvalDate = approvalDate;
		this.assign_emp_id = assign_emp_id;
		this.assignStatus = assignStatus;
		this.assignDate = assignDate;
		this.process_emp_id = process_emp_id;
		this.processStatus = processStatus;
		this.processDate = processDate;
		this.comment = comment;
		this.employee = employee;
	}






	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}



	public int getEmail_id() {
		return email_id;
	}



	public void setEmail_id(int email_id) {
		this.email_id = email_id;
	}



	public int getEmp_id() {
		return emp_id;
	}



	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public Date getBeginDate() {
		return beginDate;
	}



	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}



	public Date getEndDate() {
		return endDate;
	}



	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}



	public String getReason() {
		return reason;
	}



	public void setReason(String reason) {
		this.reason = reason;
	}



	public Date getApplicationDate() {
		return applicationDate;
	}



	public void setApplicationDate(Date applicationDate) {
		this.applicationDate = applicationDate;
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
