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
	public List<MemberVO> memberlist(){
		return memberDao.memberlist();
	}
	@Override
	public List<MemberVO> memberSerch(){
		return memberDao.memberSerch();
	}
	
	@Override
	public void write(MemberVO memberVO) {
		memberDao.insert(memberVO);
	}

	@Override
	public MemberVO memberLogin(LoginRequest loginRequest) {
		return memberDao.memberLogin(loginRequest);
	}
}
