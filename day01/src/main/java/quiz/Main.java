package quiz;

import java.io.IOException;
import java.util.Scanner;

import org.springframework.context.support.GenericXmlApplicationContext;


public class Main {
	public static void main(String[] args) throws IOException {
		GenericXmlApplicationContext ctx =
				new GenericXmlApplicationContext("classpath:quiz.xml");
		Calculator cal = ctx.getBean(Calculator.class);
		Scanner sc = new Scanner(System.in);
		System.out.println("연산자 입력 :");
		char op = (char)System.in.read();
		System.out.println("첫번째 숫자 입력 :");
		int su1 = sc.nextInt();
		System.out.println("두번째 숫자 입력 :");
		int su2 = sc.nextInt();
		int ret = 0;
		switch(op) {
		case '+' : ret = cal.add(su1, su2); break;
		case '-' : ret = cal.sub(su1, su2); break;
		case '*' : ret = cal.mul(su1, su2); break;
		case '/' : ret = cal.div(su1, su2); break;
		}
		System.out.println("" + su1 + op + su2 + "=" + ret);
		
	}

}
