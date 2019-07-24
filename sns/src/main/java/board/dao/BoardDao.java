package board.dao;

import java.util.List;

import board.domain.BoardVO;
import member.domain.MemberVO;

public interface BoardDao {
	public abstract List<BoardVO> list();
	public abstract int delete(BoardVO boardVO);
	public abstract int update(BoardVO boardVO);
	public abstract void insert(BoardVO boardVO);
	public abstract BoardVO select(int seq);
	public abstract int updateReadCount(int seq);
	public abstract int updateGCount(int num);
	public abstract List<MemberVO> memberSearch(String Search);
	/* public abstract List<BoardVO> boardSearch(String search); */
}
