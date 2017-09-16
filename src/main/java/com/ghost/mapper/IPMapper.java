package com.ghost.mapper;

import java.util.List;
import java.util.Map;

import com.ghost.domain.IP;

public interface IPMapper {
	//按员工编号查找
	public List<IP> findByEmpid(int emp_id) throws Exception;
	//按IP地址申请单编号查找
	public IP findByIPid(int IP_id)throws Exception;
	//增加
	public void addIP(IP ip) throws Exception;
	//删除
	public void delIP(int IP_id) throws Exception;
	//修改
	public void editIP(IP ip) throws Exception;
	//查询待处理的IP申请单
	public List<Object> queryIPForDispose(Map map)throws Exception;
}
