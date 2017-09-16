package com.ghost.activemq;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.apache.activemq.ActiveMQConnectionFactory;

public class NoPersistenceSender {
	public static void main(String[] args) {
		try {
//			ConnectionFactory connectionFactory = new ActiveMQConnectionFactory("tcp://192.168.1.99:61616");
			ConnectionFactory connectionFactory = new ActiveMQConnectionFactory("tcp://localhost:61616");
			Connection connection = connectionFactory.createConnection();
			connection.start();
			
			Session session = connection.createSession(Boolean.TRUE, Session.AUTO_ACKNOWLEDGE);
			Destination destination = session.createTopic("jack-topic");
			MessageProducer producer = session.createProducer(destination);
			for (int i = 0; i < 3; i++) {
				TextMessage message = session.createTextMessage("jack-test:"+i);
				
				//通过消息生产者发出消息
				producer.send(message);
			}
			session.commit();
			session.close();
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
