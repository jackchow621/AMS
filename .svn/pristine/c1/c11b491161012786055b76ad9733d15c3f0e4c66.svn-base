package com.ghost.service;

import java.util.List;
import java.util.Map;

import com.ghost.domain.Email;

public interface EmailService {
	//查询所有邮箱申请表信息
	public List<Email> findAllEmail() throws Exception;
	//查询指定邮箱申请表信息
	public List<Email> findEmailByEmpId(int emp_id) throws Exception;
	//根据邮箱申请表id来查询特定的数据
	public Email findEmailById(int email_id) throws Exception;
	
	
	
	//增加邮箱申请表信息
	public void addEmail(Email email) throws Exception;
	//修改邮箱申请表信息
	public void updateEmail(Email email) throws Exception;
	//删除邮箱申请表信息
	public void deleteEmail(int email_id) throws Exception;
	
	
	//总记录数
	public int emailTotalSize(int emp_id) throws Exception;
	
	
	//查询待处理的email申请单
	public List<Object> queryEmailForDispose(Map map) throws Exception;
}
