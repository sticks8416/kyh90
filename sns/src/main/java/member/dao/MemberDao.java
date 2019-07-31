package member.dao;

import java.util.List;
import java.util.Map;

import member.domain.MemberVO;
import member.request.LoginRequest;

public interface MemberDao {
	public abstract List<MemberVO> memberlist();
	public abstract void insert(MemberVO memberVO);
	public abstract MemberVO memberLogin(Map map);
	
}
