package member.dao;

import java.util.List;
import java.util.Map;

import member.domain.MemberVO;
import member.request.LoginRequest;

public interface MemberDao {
	public abstract List<MemberVO> memberlist();
	public abstract void memberInsert(MemberVO memberVO);
	public abstract MemberVO memberLogin(Map map);
	public abstract MemberVO matchPW(Map map);
	public abstract int checkOverId(String user_id);
	
}
