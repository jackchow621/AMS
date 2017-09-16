package com.ghost.activemq;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.apache.activemq.ActiveMQConnectionFactory;

public class NoPersistenceReceiver {
	public static void main(String[] args) {
		try {
//			ConnectionFactory connectionFactory = new ActiveMQConnectionFactory("tcp://192.168.1.99:61616");
			ConnectionFactory connectionFactory = new ActiveMQConnectionFactory("tcp://localhost:61616");
			Connection connection = connectionFactory.createConnection();
			connection.start();
			final Session session = connection.createSession(Boolean.TRUE, Session.AUTO_ACKNOWLEDGE);
			Destination destination = session.createTopic("jack-topic");
			MessageConsumer consumer = session.createConsumer(destination);
			Message message = consumer.receive();
			while(message != null){
				TextMessage txtMsg = (TextMessage) message;
				System.out.println("receive message :"+txtMsg.getText());
				message = consumer.receive(1000L);
			}
			session.commit();
			session.close();
			connection.close();
		} catch (JMSException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
