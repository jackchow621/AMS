package com.ghost.mongodb;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;



@Service
public class MyMongoDBSpring {
	@Autowired
	private MongoTemplate mt = null;
	
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		MyMongoDBSpring t = (MyMongoDBSpring) ctx.getBean("myMongoDBSpring");
		final String COL_NAME = "users";
		
		//query
		List<UserModel> list = t.mt.find(new Query(), UserModel.class,COL_NAME);
		System.out.println(list);
		
		//add
//		UserModel um = new UserModel();
//		um.setName("jack");
//		um.setAge(24);
//		um.setUserId("j1");
//		t.mt.save(um,COL_NAME);
		
		//update
//		Criteria c = new Criteria("userId").is("u3");
//		t.mt.upsert(new Query(c), Update.update("", ""), UserModel.class,COL_NAME);
		
		//remove
		Criteria c = new Criteria("userId").is("u3");
		t.mt.remove(new Query(c),COL_NAME);
		
//		System.out.println(t.mt);
	}
}
