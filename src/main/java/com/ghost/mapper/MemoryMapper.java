package com.ghost.mapper;

import java.util.List;
import java.util.Map;

import com.ghost.domain.Leaves;
import com.ghost.domain.Memory;

public interface MemoryMapper {
	//查询所有内存空间申请表信息
	public List<Memory> findAllMemory() throws Exception;
	//查询指定内存空间申请表信息
	public List<Memory> findMemoryByEmpId(int emp_id) throws Exception;
	//根据内存空间申请表id来查询特定的数据
	public Memory findMemoryById(int memory_id) throws Exception;
	
	
	//增加内存空间申请表信息
	public void addMemory(Memory memory) throws Exception;
	//修改内存空间申请表信息
	public void updateMemory(Memory memory) throws Exception;
	//删除内存空间申请表信息
	public void deleteMemory(int memory_id) throws Exception;
	//查询待处理的memory申请单
	public List<Object> queryMemoryForDispose(Map map)throws Exception;
	//总记录数
	public int totalSize(int emp_id) throws Exception;
}
