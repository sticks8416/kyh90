package main;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import spring.MemberDao;
import spring.Member;
public class MainForMemberDao {
	
	private static MemberDao memberDao;
	
	public static void main(String[] args) {
		AbstractApplicationContext ctx =
				new GenericXmlApplicationContext("classpath:appCtx.xml");
		memberDao = ctx.getBean("memberDao", MemberDao.class);
		
		selectAll();
		updateMember();
		insertMember();
		selectAll();
		
		ctx.close();
		
	}
	private static void selectAll() {
		System.out.println("---- selectAll");
		int total = memberDao.count();
		System.out.println("전체데이터: " + total);
		List<Member> members = (List<Member>) memberDao.selectAll();
		for(Member m : members) {
			System.out.println(
				m.getId() + ":" + m.getEmail() + ":" + m.getName()	);
		}
	}
	
	private static void updateMember() {
		System.out.println("----- updateMember");
		Member member = memberDao.selectByEmail("sticks123@naver.com");
		String oldPw = member.getPw();
		String newPw = Double.toHexString(Math.random());
		member.changePw(oldPw, newPw);
		
		memberDao.update(member);
		System.out.println("암호 변경: " + oldPw + " >" + newPw);
	}

	private static void insertMember() {
		System.out.println("----- insertMember");
		SimpleDateFormat dateFormat = new SimpleDateFormat("MMddHHmmss");
		String prefix = dateFormat.format(new Date());
		Member member = 
				new Member(prefix + "@test.com",
				prefix,
				prefix,
				new Date()
				);
		memberDao.insert(member);
		System.out.println(member.getId()+ "데이터 추가");
	}
}
