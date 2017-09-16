package com.ghost.activemq;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Service;

@Service
public class SpringReceiver {

	@Autowired
	private JmsTemplate jt = null;
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		SpringReceiver ct = (SpringReceiver) ctx.getBean("springReceiver");
		String msg = (String) ct.jt.receiveAndConvert();
		System.out.println("msg===" + msg);
	}

}
