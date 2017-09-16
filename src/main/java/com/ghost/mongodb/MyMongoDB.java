package com.ghost.mongodb;

import java.net.UnknownHostException;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientOptions;

public class MyMongoDB {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MongoClientOptions mcs = MongoClientOptions.builder().connectionsPerHost(6).connectTimeout(1000).build();
		MongoClient mongo;
		try {
			mongo = new MongoClient("192.168.1.99:20000",mcs);
			
			System.out.println(mongo.getMongoClientOptions().getConnectionsPerHost());
			
			DB db = mongo.getDB("mydb");
			
			DBCollection users = db.getCollection("users");
			/**第一种方式*/
//			BasicDBObject d1 = new BasicDBObject();
////			d1.put("userId","myU1");
//			d1.append("userId","myU2").append("name", "name222");
//			
////			users.insert(d1);
			/**第二种方式*/
//			BasicDBObjectBuilder builder = new BasicDBObjectBuilder().start().add("userId", "u3").add("age", 123);
//			users.insert(builder.get());
			/**第三种方式*/
//			Map<String ,Object> m = new HashMap<String, Object>();
//			m.put("userId", "jack");
//			users.insert(new BasicDBObject(m));
			/**第四种方式*/
//			String json = "{'userId':'j234','age':'234'}";
//			DBObject d1 =(DBObject) JSON.parse(json);
//			users.insert(d1);
			/** 删除指定*/
//			users.remove(new BasicDBObject("userId","u3"));
			/**修改指定*/
//			users.update(new BasicDBObject("userId","myU2"), d1);
			/**使用修改器修改*/
//			users.update(new BasicDBObject("userId","j234"), new BasicDBObject("$set",new BasicDBObject("name","newName")));
			
//			DBObject d = users.findOne();
//			System.out.println("d========"+d);
			
//			DBCursor c = users.find();
//			while(c.hasNext()){
//				DBObject d = c.next();
//				System.out.println("d========"+d);
//			}
			
//			DBObject con = new BasicDBObject("userId","j234");
			
			
			DBObject con = new BasicDBObject("userId","j234").append("age", new BasicDBObject("$gt","120").append("$lt", "290"));
			
			DBObject show = new BasicDBObject("userId",1).append("age", 1).append("_id", 0);
			DBCursor c = users.find(con,show).limit(2);
			while(c.hasNext()){
				DBObject d = c.next();
				System.out.println("d========"+d);
			}
			mongo.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}

}
