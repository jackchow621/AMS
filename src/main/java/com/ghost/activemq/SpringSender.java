package com.ghost.activemq;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Service;


@Service
public class SpringSender {
	@Autowired
	private JmsTemplate jt = null;
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		SpringSender ct = (SpringSender) ctx.getBean("springSender");
		ct.jt.send(new MessageCreator() {
			
			@Override
			public Message createMessage(Session s) throws JMSException {
				// TODO Auto-generated method stub
				TextMessage msg = s.createTextMessage("Spring msg===");
				return msg;
			}
		});
	}
}
