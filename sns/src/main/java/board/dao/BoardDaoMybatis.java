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
	public BoardVO select(int seq) {
		BoardVO vo = (BoardVO) sqlSessionTemplate.selectOne("select", seq);
		return vo;
	}
	@Override
	public int updateReadCount(int seq) {
		return sqlSessionTemplate.update("updateCount", seq);
	}
	
	public int updateGCount(int counting) {
		return sqlSessionTemplate.update("counting", counting);
	}
	@Override 
	public List<MemberVO> memberSearch(String Search){ 
		return sqlSessionTemplate.selectList("memberSearch", Search); 
		}
	/*
	 * @Override public List<BoardVO> boardSearch(String Search){ return
	 * sqlSessionTemplate.selectList("boardSearch", Search); }
	 */

}
