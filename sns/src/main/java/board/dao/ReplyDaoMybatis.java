package board.dao;

import org.mybatis.spring.SqlSessionTemplate;

import board.domain.ReplyVO;



public class ReplyDaoMybatis implements ReplyDao{
	SqlSessionTemplate sqlSessionTemplate;
	
	public ReplyDaoMybatis(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public void addReply(ReplyVO replyVO) {
		sqlSessionTemplate.insert("addReply", replyVO);
	}

	@Override
	public void deleteReply(int replySeq) {
		
		sqlSessionTemplate.delete("deleteReply", replySeq);
	}
	
}
