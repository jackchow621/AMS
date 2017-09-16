package com.ghost.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ghost.domain.IP;
import com.ghost.mapper.IPMapper;
import com.ghost.service.IPService;

@Service
public class IPServiceImpl implements IPService {
	@Autowired
	private IPMapper ipMapper;
	@Override
	public void addIP(IP ip) throws Exception {
		ipMapper.addIP(ip);
	}
	@Override
	public void delIP(int IP_id) throws Exception {
		ipMapper.delIP(IP_id);
	}
	@Override
	public void editIP(IP ip) throws Exception {
		ipMapper.editIP(ip);
	}
	@Override
	public List<IP> findByEmpid(int emp_id) throws Exception {
		return ipMapper.findByEmpid(emp_id);
	}
	@Override
	public IP findByIPid(int IP_id) throws Exception {
		return ipMapper.findByIPid(IP_id);
	}
	@Override
	public List<Object> queryIPForDispose(Map map) throws Exception {
		return ipMapper.queryIPForDispose(map);
	}

}
