package com.ghost.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ghost.domain.Teleconference;
import com.ghost.mapper.TeleconferenceMapper;
import com.ghost.service.TeleconferenceService;


@Service
public class TeleconferenceServiceImpl implements TeleconferenceService{

	@Autowired
	private TeleconferenceMapper teleconferenceMapper;
	
	
	@Override
	public List<Teleconference> findAllTeleconference() throws Exception {
		return teleconferenceMapper.findAllTeleconference();
	}

	@Override
	public List<Teleconference> findTeleconferenceByEmpId(int emp_id)
			throws Exception {
		return teleconferenceMapper.findTeleconferenceByEmpId(emp_id);
	}

	@Override
	public Teleconference findTeleconferenceById(int teleconference_id)
			throws Exception {
		return teleconferenceMapper.findTeleconferenceById(teleconference_id);
	}

	@Override
	public void addTeleconference(Teleconference teleconference)
			throws Exception {
		teleconferenceMapper.addTeleconference(teleconference);
	}

	@Override
	public void updateTeleconference(Teleconference teleconference)
			throws Exception {
		teleconferenceMapper.updateTeleconference(teleconference);
	}

	@Override
	public void deleteTeleconference(int teleconference_id) throws Exception {
		teleconferenceMapper.deleteTeleconference(teleconference_id);
	}

	@Override
	public int totalSize(Map map) throws Exception {
		return teleconferenceMapper.totalSize(map);
	}

	@Override
	public List<Object> queryTeleconferenceForDispose(Map map) throws Exception {
		return teleconferenceMapper.queryTeleconferenceForDispose(map);
	}

}
