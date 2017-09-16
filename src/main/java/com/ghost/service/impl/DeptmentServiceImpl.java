package com.ghost.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ghost.domain.Deptment;
import com.ghost.mapper.DeptmentMapper;
import com.ghost.memcached.CacheHelper;
import com.ghost.service.DeptmentService;

@Service
public class DeptmentServiceImpl implements DeptmentService {
	private static final String MEME_PRE = "Deptment";
	/*@Autowired
	private MemCachedClient memCachedClient;*/
	@Autowired
	private DeptmentMapper deptmentMapper;
	
	@Override
	public List<Deptment> findAllDeptments() throws Exception {
		List<Integer> Ids = deptmentMapper.findAllDeptIds();
		List<Deptment> deptmentList = new ArrayList<Deptment>();
		String noIds = "";
		for (Integer id : Ids) {
			Object obj = CacheHelper.getMemCachedClient().get(MEME_PRE+id);
			if(obj != null){
				Deptment deptment = (Deptment) obj;
				deptmentList.add(deptment);
			}else {
				noIds += id+",";
			}
		}
		List<Deptment> deptmentList2 = new ArrayList<Deptment>();
		if(noIds.trim().length()>0){
			String[] ids = noIds.split(",");
			for (String id : ids) {
				Deptment deptment = findDeptmentById(Integer.parseInt(id));
				deptmentList2.add(deptment);
			}
			deptmentList.addAll(deptmentList2);
		}
		return deptmentList;
	}
	public Deptment findDeptmentById(int id) throws Exception {
		// TODO Auto-generated method stub
		Deptment deptment = null;
		Object obj = CacheHelper.getMemCachedClient().get(MEME_PRE+id);
		if(obj != null){
			System.out.println(obj+"=======================");
			deptment = (Deptment) obj;
			return deptment;
		}
		// TODO Auto-generated method stub
		deptment = deptmentMapper.findDeptmentById(id);
		CacheHelper.getMemCachedClient().set(MEME_PRE+id,deptment);
		return deptment;
	}

	@Override
	public void addDeptment(Deptment deptment) throws Exception {
		deptmentMapper.addDeptment(deptment);
	}

	@Override
	public void updateDeptment(Deptment deptment) throws Exception {
		deptmentMapper.updateDeptment(deptment);
		Object obj = CacheHelper.getMemCachedClient().get(MEME_PRE+String.valueOf(deptment.getDept_Id()));
		if(obj!=null){
			CacheHelper.getMemCachedClient().set(MEME_PRE+String.valueOf(deptment.getDept_Id()), deptment);
		}
	}

	@Override
	public void deleteDeptments(int id) throws Exception {
		deptmentMapper.deleteDeptments(id);
		Object obj = CacheHelper.getMemCachedClient().get(MEME_PRE+id);
		if(obj!=null){
			CacheHelper.getMemCachedClient().delete(MEME_PRE+id);
		}
	}

	@Override
	public int totalSize() throws Exception {
		return deptmentMapper.totalSize();
	}
	public List<Integer> findAllDeptIds() throws Exception {
		// TODO Auto-generated method stub
		return deptmentMapper.findAllDeptIds();
	}
}
