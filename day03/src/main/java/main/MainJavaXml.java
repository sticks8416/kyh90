package main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import config.ConfigPart1;
import config.ConfigPart2;
import config.JavaMainConf;
import spring.AlreadyExistingMemberException;
import spring.ChangePasswordService;
import spring.IdPasswordNotMatchingException;
import spring.MemberInfoPrinter;
import spring.MemberListPrinter;
import spring.MemberNotFoundException;
import spring.MemberRegisterService;
import spring.RegisterRequest;
import spring.VersionPrinter;

public class MainJavaXml {
	public static void main(String[] args) {
		ApplicationContext ctx = new AnnotationConfigApplicationContext(JavaMainConf.class);
		
		
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