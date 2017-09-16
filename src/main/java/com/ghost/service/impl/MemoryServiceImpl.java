package com.ghost.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ghost.domain.Memory;
import com.ghost.mapper.MemoryMapper;
import com.ghost.service.MemoryService;

@Service
public class MemoryServiceImpl implements MemoryService{

	@Autowired
	private MemoryMapper memoryMapper;
	
	@Override
	public List<Memory> findAllMemory() throws Exception {
		return memoryMapper.findAllMemory();
	}

	@Override
	public List<Memory> findMemoryByEmpId(int emp_id) throws Exception {
		return memoryMapper.findMemoryByEmpId(emp_id);
	}

	@Override
	public Memory findMemoryById(int memory_id) throws Exception {
		return memoryMapper.findMemoryById(memory_id);
	}

	@Override
	public void addMemory(Memory memory) throws Exception {
		memoryMapper.addMemory(memory);
	}

	@Override
	public void updateMemory(Memory memory) throws Exception {
		memoryMapper.updateMemory(memory);
	}

	@Override
	public void deleteMemory(int memory_id) throws Exception {
		memoryMapper.deleteMemory(memory_id);
	}

	@Override
	public List<Object> queryMemoryForDispose(Map map) throws Exception {
		return memoryMapper.queryMemoryForDispose(map);
	}

	@Override
	public int totalSize(int emp_id) throws Exception {
		return memoryMapper.totalSize(emp_id);
	}


}
