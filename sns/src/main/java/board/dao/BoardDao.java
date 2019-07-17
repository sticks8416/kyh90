package board.dao;

import java.util.List;

import board.domain.BoardVO;

public interface BoardDao {
	public abstract List<BoardVO> list();
	public abstract int delete(BoardVO boardVO);
	public abstract int deleteAll();
	public abstract int update(BoardVO boardVO);
	public abstract void insert(BoardVO boardBO);
	public abstract BoardVO select(int seq);
	public abstract int updateReadCount(int seq);
	public abstract int updateGCount(int num);
}
