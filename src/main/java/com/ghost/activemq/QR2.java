package com.ghost.activemq;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.MessageListener;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.apache.activemq.ActiveMQConnectionFactory;

public class QR2 {
	public static void main(String[] args) {
		try {
			ConnectionFactory connectionFactory = new ActiveMQConnectionFactory("tcp://192.168.1.99:61716");
			Connection connection = connectionFactory.createConnection();
			connection.start();
			
			
			
			final Session session = connection.createSession(Boolean.TRUE, Session.AUTO_ACKNOWLEDGE);
			Destination destination = session.createQueue("jack-queue");
			
			for (int i = 0; i < 1; i++) {
				MessageConsumer consumer = session.createConsumer(destination);
				consumer.setMessageListener(new MessageListener() {
					
					@Override
					public void onMessage(Message message) {
						// TODO Auto-generated method stub
						TextMessage txtMsg = (TextMessage) message;
						try {
							System.out.println("QR2222222=========="+txtMsg.getText());
							session.commit();
						} catch (JMSException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				});
			}
			
//			session.close();
//			connection.close();
		} catch (JMSException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
