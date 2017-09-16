package com.ghost.activemq;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.jms.Topic;
import javax.jms.TopicSubscriber;

import org.apache.activemq.ActiveMQConnectionFactory;

public class PersistenceReceiver {
	public static void main(String[] args) {
		try {
			ConnectionFactory connectionFactory = new ActiveMQConnectionFactory("tcp://192.168.1.99:61616");
			Connection connection = connectionFactory.createConnection();
			connection.setClientID("cc1");
			final Session session = connection.createSession(Boolean.TRUE, Session.AUTO_ACKNOWLEDGE);
			Topic topic = session.createTopic("jack-topic2");
			
			TopicSubscriber consumer = session.createDurableSubscriber(topic, "t1");
			
			connection.start();
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
