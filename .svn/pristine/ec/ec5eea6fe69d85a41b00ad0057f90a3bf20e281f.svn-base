package com.ghost.mapper;

import java.util.List;
import java.util.Map;

import com.ghost.domain.Teleconference;

public interface TeleconferenceMapper {
	//查询所有电话会议申请表信息
	public List<Teleconference> findAllTeleconference() throws Exception;
	//查询指定电话会议申请表信息
	public List<Teleconference> findTeleconferenceByEmpId(int emp_id) throws Exception;
	//根据电话会议申请表id来查询特定的数据
	public Teleconference findTeleconferenceById(int teleconference_id) throws Exception;
	//总条数
	public int totalSize(Map map) throws Exception;
	//查询待处理的电话会议申请表信息
	public List<Object> queryTeleconferenceForDispose(Map map) throws Exception;
	
	//增加电话会议申请表信息
	public void addTeleconference(Teleconference teleconference) throws Exception;
	//修改电话会议申请表信息
	public void updateTeleconference(Teleconference teleconference) throws Exception;
	//删除电话会议申请表信息
	public void deleteTeleconference(int teleconference_id) throws Exception;
}
