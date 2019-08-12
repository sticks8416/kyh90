package board.dao;

import java.util.List;

import board.domain.BoardVO;
import board.domain.ReplyVO;
import member.domain.MemberVO;

public interface BoardDao {
	public abstract List<BoardVO> list();
	public abstract int delete(BoardVO boardVO);
	public abstract int update(BoardVO boardVO);
	public abstract int updateProfile(MemberVO memberVO);
	public abstract void insert(BoardVO boardVO);
	public abstract BoardVO select(int num);
	public abstract MemberVO selectProfile(String email);
	public abstract List<MemberVO> memberSearch(String Search);
	public abstract List<String> searchFriend(String email);
	public abstract List<ReplyVO> replyList();
}