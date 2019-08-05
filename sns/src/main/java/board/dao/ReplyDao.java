package board.dao;

import board.domain.ReplyVO;

public interface ReplyDao {
	public abstract void addReply(ReplyVO replyVO);
	public abstract void deleteReply(int replySeq);
}
