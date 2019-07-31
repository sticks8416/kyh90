package friend.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import friend.domain.FriendVO;


public class FriendDaoMybatis implements FriendDao{
	SqlSessionTemplate sqlSessionTemplate;
	
	FriendDaoMybatis(SqlSessionTemplate sqlSessionTemplate){
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}


	@Override
	public void add(FriendVO friendVO) {
		sqlSessionTemplate.insert("addFriend", friendVO);
		
	}

	@Override
	public void delete(FriendVO friendVO) {
		sqlSessionTemplate.delete("deleteFriend", friendVO);
		
	}

	@Override
	public List<String> pendingList(String email) {
		return sqlSessionTemplate.selectList("pendingList", email);
	}
	@Override
	public void update(FriendVO friendVO) {
		sqlSessionTemplate.update("updateFriend", friendVO);
		
	}
	@Override
	public int checkFriend(FriendVO friendVO) {
		return sqlSessionTemplate.selectOne("checkFriend", friendVO);
	}
	@Override
	public void updateChat(FriendVO friendVO) {
		sqlSessionTemplate.update("updateChat", friendVO);
		
	}
	@Override
	public String checkChat(FriendVO friendVO) {
		return sqlSessionTemplate.selectOne("checkChat", friendVO);
	}
	
}
