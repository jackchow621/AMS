package com.ghost.activemq;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.MessageConsumer;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.apache.activemq.ActiveMQConnectionFactory;

public class QueueReceiver {
	public static void main(String[] args) {
		try {
			ConnectionFactory connectionFactory = new ActiveMQConnectionFactory("tcp://192.168.1.99:61616");
			Connection connection = connectionFactory.createConnection();
			connection.start();
			final Session session = connection.createSession(Boolean.TRUE, Session.AUTO_ACKNOWLEDGE);
			Destination destination = session.createQueue("jack-queue");
			MessageConsumer consumer = session.createConsumer(destination);
			for (int i = 0; i < 3; i++) {
				TextMessage message = 	(TextMessage) consumer.receive();
				session.commit();
				System.out.println("receive message :"+message.getText());
			}
			session.close();
			connection.close();
		} catch (JMSException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
