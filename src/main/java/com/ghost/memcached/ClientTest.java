package com.ghost.memcached;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.danga.MemCached.MemCachedClient;
@Service
public class ClientTest {
//	@Autowired
//	private MemCachedClient mcc;
//	public void setMcc(MemCachedClient mcc){
//		this.mcc = mcc;
//	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
//		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
//		
//		ClientTest ct = (ClientTest) ctx.getBean("clientTest");
//		// TODO Auto-generated method stub
		MemCachedClient mcc = CacheHelper.getMemCachedClient();
		mcc.add("Data1", "12345");
		
		mcc.add("Data1", "12345");
		
		Object obj = mcc.get("Data1");
		
		System.out.println("obj ========"+obj);
	}

}
