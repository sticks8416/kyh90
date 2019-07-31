package board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import board.domain.BoardVO;
import member.domain.MemberVO;

@Repository
public class BoardDaoMybatis implements BoardDao{
	
	private SqlSessionTemplate sqlSessionTemplate;

	public BoardDaoMybatis(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	@Override
	public List<BoardVO> list(){
		return sqlSessionTemplate.selectList("list");
	}
	@Override
	public int delete(BoardVO boardVO) {
		return sqlSessionTemplate.delete("delete", boardVO);
	}
	@Override
	public int update(BoardVO boardVO) {
		return sqlSessionTemplate.update("update", boardVO);
	}
	@Override
	public void insert(BoardVO boardVO) {
		sqlSessionTemplate.insert("insert", boardVO);
	}
	@Override
	public int updateProfile(MemberVO memberVO) {
		return sqlSessionTemplate.update("updateProfile", memberVO);
	}
	@Override
	public BoardVO select(int num) {
		BoardVO vo = (BoardVO) sqlSessionTemplate.selectOne("select", num);
		return vo;
	}
	@Override
	public MemberVO selectProfile(String writer) {
		MemberVO vo = (MemberVO) sqlSessionTemplate.selectOne("selectProfile", writer);
		return vo;
	}
	/*
	 * @Override public int updateReadCount(int num) { return
	 * sqlSessionTemplate.update("updateCount", num); }
	 * 
	 * public int updateGCount(int counting) { return
	 * sqlSessionTemplate.update("counting", counting); }
	 */@Override 
	public List<MemberVO> memberSearch(String Search){ 
		return sqlSessionTemplate.selectList("memberSearch", Search); 
		}
	/*
	 * @Override public List<BoardVO> boardSearch(String Search){ return
	 * sqlSessionTemplate.selectList("boardSearch", Search); }
	 */
	@Override
	public List<String> searchFriend(String email) {
		return sqlSessionTemplate.selectList("friendId", email);
	}

}
