package board.service;

import board.domain.ReplyVO;

public interface ReplyService {
	public abstract void addReply(ReplyVO replyVO);
	public abstract void deleteReply(int replySeq);
}
