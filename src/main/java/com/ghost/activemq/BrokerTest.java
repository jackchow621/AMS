package com.ghost.activemq;

import java.net.URI;
import java.net.URISyntaxException;

import org.apache.activemq.broker.BrokerFactory;
import org.apache.activemq.broker.BrokerService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class BrokerTest {
	public static void main(String[] args) {
//		BrokerService broker = new BrokerService();
//		broker.setUseJmx(true);
//		try {
//			broker.addConnector("tcp://localhost:61616");
//			broker.start();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		String Uri = "properties:broker.properties";
//		try {
//			BrokerService broker1 = BrokerFactory.createBroker(new URI(Uri));
//			broker1.addConnector("tcp://localhost:61616");
//			broker1.start();
//		} catch (URISyntaxException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
	}
}
