package main;

import org.springframework.context.support.GenericXmlApplicationContext;

import chap06.Calculator;

public class MainXmlPojo {
	public static void main(String[] args) {
		GenericXmlApplicationContext ctx =
				new GenericXmlApplicationContext("classpath:aopPojo.xml");
		Calculator implCal = ctx.getBean("implCal", Calculator.class);
		long fiveFact1 = implCal.factorial(5);
		System.out.println("implCal.factorial(5) = " + fiveFact1);
		
		Calculator recCal = ctx.getBean("recCal", Calculator.class);
		long fiveFact2 = recCal.factorial(5);
		System.out.println("recCal.factorial(5) =" + fiveFact2);
		ctx.close();
				
	}

}
