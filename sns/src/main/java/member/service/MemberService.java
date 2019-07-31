package member.service;

import java.util.List;
import java.util.Map;

import member.domain.MemberVO;
import member.request.LoginRequest;

public interface MemberService {
	public List<MemberVO> memberlist();
	public void write(MemberVO memberVO);
	public MemberVO memberLogin(Map map);
	
}
