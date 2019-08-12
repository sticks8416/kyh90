package board.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import board.domain.BoardLikeVO;



public class BoardLikeDaoMybatis implements BoardLikeDao{
	SqlSessionTemplate sqlSessionTemplate;
	
	BoardLikeDaoMybatis(SqlSessionTemplate sqlSessionTemplate){
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public void addLike(BoardLikeVO boardLikeVO) {
		sqlSessionTemplate.insert("addLike", boardLikeVO);
		
	}

	@Override
	public void deleteLike(BoardLikeVO boardLikeVO) {
		sqlSessionTemplate.delete("deleteLike",boardLikeVO);
		
	}

	@Override
	public int countLike(int seq) {
		int count = sqlSessionTemplate.selectOne("countLike",seq);
		return count;
	}

	@Override
	public int searchId(BoardLikeVO boardLikeVO) {
		int count = sqlSessionTemplate.selectOne("searchId", boardLikeVO);
		return count;
	}

	@Override
	public void updateCount(int seq) {
		sqlSessionTemplate.update("updateCount",seq);
		
	}
}
