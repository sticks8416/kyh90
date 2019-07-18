package member.service;

import java.util.List;


import org.springframework.stereotype.Service;

import board.domain.BoardVO;
import member.dao.MemberDao;
import member.domain.MemberVO;
import member.request.LoginRequest;


@Service
public class MemberServiceImpl implements MemberService{
	private MemberDao memberDao;

	public MemberDao getMemberDao() {
		return memberDao;
	}

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	@Override
	public List<MemberVO> list(){
		return memberDao.list();
	}
	@Override
	public void write(MemberVO memberVO) {
		memberDao.insert(memberVO);
	}

	@Override
	public List<MemberVO> login(LoginRequest loginRequest) {
		return memberDao.login(loginRequest);
	}
	
	
}
