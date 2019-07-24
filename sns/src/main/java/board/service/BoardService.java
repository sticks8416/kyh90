package board.service;

import java.util.List;

import board.domain.BoardVO;
import member.domain.MemberVO;

public interface BoardService {
	public abstract List<BoardVO> list();
	public List<MemberVO> memberSearch(String search);
	/* public List<BoardVO> boardSearch(String search); */
	public abstract int delete(BoardVO boardVO);
	public abstract void write(BoardVO boardVO);
	public abstract BoardVO read(int num);
	public abstract int updateProfile(MemberVO memberVO);
}
