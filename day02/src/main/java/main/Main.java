package main;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import spring.AlreadyExistingMemberException;
import spring.ChangePasswordService;
import spring.IdPasswordNotMatchingException;
import spring.MemberInfoPrinter;
import spring.MemberListPrinter;
import spring.MemberNotFoundException;
import spring.MemberRegisterService;
import spring.RegisterRequest;
import spring.VersionPrinter;

public class Main {
	public static void main(String[] args) {
		ApplicationContext ctx = new GenericXmlApplicationContext(
										"classpath:appCtx.xml");
		MemberRegisterService regSvc = ctx.getBean(
					"memberRegSvc", MemberRegisterService.class);
		MemberInfoPrinter infoPrinter = ctx.getBean(
					"infoPrinter", MemberInfoPrinter.class);
		
		RegisterRequest regReq = new RegisterRequest();
		regReq.setEmail("sticks123@naver.com");
		regReq.setName("KYH");
		regReq.setPw("1234");
		regSvc.regist(regReq);
		infoPrinter.printMemberInfo("sticks123@naver.com");
	}
}
