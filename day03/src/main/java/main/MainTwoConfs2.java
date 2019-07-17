package main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;


import config.ConfigPartMain;
import spring.MemberInfoPrinter;
import spring.MemberRegisterService;
import spring.RegisterRequest;

public class MainTwoConfs2 {
	
	public static void main(String[] args) {
		ApplicationContext ctx = new AnnotationConfigApplicationContext(ConfigPartMain.class);
		
		
		MemberRegisterService regSvc = ctx.getBean(
					"memberRegSvc", MemberRegisterService.class);
		MemberInfoPrinter infoPrinter = ctx.getBean(
					"infoPrinter", MemberInfoPrinter.class);
		
		RegisterRequest regReq = new RegisterRequest();
		regReq.setEmail("sticks123@naver.com");
		regReq.setName("KYH");
		regReq.setPw("1234");
		regReq.setConfirmPw("1234");
		regSvc.regist(regReq);
		
		infoPrinter.printMemberInfo("sticks123@naver.com");
		((AnnotationConfigApplicationContext)ctx).close();
	}
}