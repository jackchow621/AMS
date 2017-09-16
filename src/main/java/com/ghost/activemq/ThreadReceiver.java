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

public class ThreadReceiver {
	public static void main(String[] args) {
			ConnectionFactory connectionFactory = new ActiveMQConnectionFactory("tcp://192.168.1.99:61616");
			
			for (int i = 0; i < 30; i++) {
				Thread t = new MyThread(connectionFactory);
				t.start();
			}
			
	}
}
class MyThread extends Thread{
	private ConnectionFactory connectionFactory = null;
	public MyThread(ConnectionFactory connectionFactory){
		this.connectionFactory =connectionFactory;
	}
	public void run(){
		try {
			Connection connection = connectionFactory.createConnection();
			connection.start();
			final Session session = connection.createSession(Boolean.TRUE, Session.AUTO_ACKNOWLEDGE);
			Destination destination = session.createQueue("jack-queue");
			MessageConsumer consumer = session.createConsumer(destination);
			consumer.setMessageListener(new MessageListener() {
				
				@Override
				public void onMessage(Message message) {
					// TODO Auto-generated method stub
					TextMessage txtMsg = (TextMessage) message;
					try {
						System.out.println("Receiver1111========="+txtMsg.getText());
						session.commit();
					} catch (JMSException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			});
//			for (int i = 0; i < 3; i++) {
//				TextMessage message = 	(TextMessage) consumer.receive();
//				session.commit();
//				System.out.println("receive message :"+message.getText());
//			}
			session.close();
			connection.close();
		} catch (JMSException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
