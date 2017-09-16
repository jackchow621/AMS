package com.ghost.memcached;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.ghost.mapper.DeptmentMapper;
@Service
public class DeptmentTest {
//	@Autowired
//	private DeptmentMapperImpl dmi;
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		DeptmentMapper cm = (DeptmentMapper) ctx.getBean("deptmentMapper");
		try {
			Object obj = cm.findDeptmentById(1);
			System.out.println(obj+"------------------");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		ct.dmi.findDeptmentById(id);
//		
//		System.out.println("obj ========"+obj);
	}

}
