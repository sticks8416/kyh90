package member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import member.domain.MemberVO;
import member.request.LoginRequest;
@Repository
public class MemberDaoMybatis implements MemberDao{
	private SqlSessionTemplate sqlSessionTemplate;

	public MemberDaoMybatis(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

@Override
public List<MemberVO> memberlist(){
	return sqlSessionTemplate.selectList("memberlist");
}
@Override
public void memberInsert(MemberVO memberVO) {
	sqlSessionTemplate.insert("memberInsert", memberVO);
}
@Override
public MemberVO memberLogin(Map map) {

	return (MemberVO)sqlSessionTemplate.selectOne("memberLogin", map);
}
@Override
public MemberVO matchPW(Map map) {
	return (MemberVO)sqlSessionTemplate.selectOne("matchPW", map);
}
@Override
public int matchID(String email) {
	return (int)sqlSessionTemplate.selectOne("matchID", email);
}
@Override
public int checkOverId(String user_id) {
	// TODO Auto-generated method stub
	return 0;
}


}



