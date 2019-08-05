package board.service;

import board.dao.ReplyDao;
import board.domain.ReplyVO;


public class ReplyServiceImpl implements ReplyService{
	ReplyDao replyDao;
	public void setReplyDao(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	@Override
	public void addReply(ReplyVO replyVO) {
		replyDao.addReply(replyVO);
		
	}

	@Override
	public void deleteReply(int replySeq) {
		replyDao.deleteReply(replySeq);
		
	}
	
}
