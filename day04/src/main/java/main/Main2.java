package main;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

import conf.JavaConfig;
import spring.Client;

public class Main2 {
	public static void main(String[] args) {
		AbstractApplicationContext ctx =
				new AnnotationConfigApplicationContext(JavaConfig.class);
		Client client= ctx.getBean("client", Client.class);
		client.send();
		ctx.close();
	}

}
