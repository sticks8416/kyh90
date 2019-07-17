package main;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import spring.ChangePasswordService;
import spring.IdPasswordNotMatchingException;
import spring.MemberNotFoundException;

public class MainForCPS {
	
	public static void main(String[] args) {
		AbstractApplicationContext ctx =
				new GenericXmlApplicationContext("classpath:appCtx.xml");
		
		ChangePasswordService cps =
				ctx.getBean("changePwdSvc", ChangePasswordService.class);
		try {
				cps.changePassword("123123@test.com", "123", "1111");
				System.out.println("암호변경완료");
		}catch(MemberNotFoundException e) {
			System.out.println("회원정보 없음");
		}catch(IdPasswordNotMatchingException e) {
			System.out.println("암호확인요망");
		}
		
		
	
	
	}

}
