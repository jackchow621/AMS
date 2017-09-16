package com.ghost.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ghost.domain.Email;
import com.ghost.mapper.EmailMapper;
import com.ghost.service.EmailService;

@Service
public class EmailServiceImpl implements EmailService{

	@Autowired
	private EmailMapper emailMapper;
	
	@Override
	public List<Email> findAllEmail() throws Exception {
		return emailMapper.findAllEmail();
	}

	@Override
	public List<Email> findEmailByEmpId(int emp_id) throws Exception {
		return emailMapper.findEmailByEmpId(emp_id);
	}
	
	@Override
	public Email findEmailById(int email_id) throws Exception {
		return emailMapper.findEmailById(email_id);
	}

	@Override
	public void addEmail(Email email) throws Exception {
		emailMapper.addEmail(email);
	}

	@Override
	public void updateEmail(Email email) throws Exception {
		emailMapper.updateEmail(email);
	}

	@Override
	public void deleteEmail(int email_id) throws Exception {
		emailMapper.deleteEmail(email_id);
	}
	
	
	@Override
	public int emailTotalSize(int emp_id) throws Exception {
		return emailMapper.emailTotalSize(emp_id);
	}


	@Override
	public List<Object> queryEmailForDispose(Map map) throws Exception {
		return emailMapper.queryEmailForDispose(map);
	}

	
}
