package spring;

import org.springframework.transaction.annotation.Transactional;

public class ChangePasswordService {
	
	private MemberDao memberDao;
	
	
	public ChangePasswordService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	@Transactional
	public void changePassword(String email, String oldPassword, String newPassword) {
		Member member = memberDao.selectByEmail(email);
		if(member == null) {
			throw new MemberNotFoundException();
		}
		member.changePassword(oldPassword, newPassword);
		memberDao.update(member);
	}
}
