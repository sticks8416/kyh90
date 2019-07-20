package member.dao;

import java.util.List;

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
public List<MemberVO> list(){
	return sqlSessionTemplate.selectList("list");
}
@Override
public void insert(MemberVO memberVO) {
	sqlSessionTemplate.insert("insert", memberVO);
}
@Override
public MemberVO login(LoginRequest loginRequest) {
	return sqlSessionTemplate.selectOne("memberLogin", loginRequest);
}
@Override
public void serchmember(MemberVO memberVO) {
	sqlSessionTemplate.insert("serchmember", memberVO);
}

}



