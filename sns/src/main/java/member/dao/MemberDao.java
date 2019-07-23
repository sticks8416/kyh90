package member.dao;

import java.util.List;

import member.domain.MemberVO;
import member.request.LoginRequest;

public interface MemberDao {
	public abstract List<MemberVO> memberlist();
	public abstract void insert(MemberVO memberVO);
	public abstract MemberVO memberLogin(LoginRequest loginRequest);
	public abstract List<MemberVO> memberSerch();
}
