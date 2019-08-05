package board.service;

import java.util.Map;

import board.dao.BoardLikeDao;
import board.domain.BoardLikeVO;




public class BoardLikeServiceImpl implements BoardLikeService{
	BoardLikeDao boardLikeDao;
	

	public void setBoardLikeDao(BoardLikeDao boardLikeDao) {
		this.boardLikeDao = boardLikeDao;
	}

	@Override
	public void addLike(BoardLikeVO boardLikeVO) {
		boardLikeDao.addLike(boardLikeVO);
		
	}

	@Override
	public void deleteLike(BoardLikeVO boardLikeVO) {
		boardLikeDao.deleteLike(boardLikeVO);
		
	}

	@Override
	public int countLike(int seq) {
		int count = boardLikeDao.countLike(seq);
		return count;
	}

	@Override
	public int searchId(BoardLikeVO boardLikeVO) {
		int count = boardLikeDao.searchId(boardLikeVO);
		return count;
	}

	@Override
	public void updateCount(int seq) {
		boardLikeDao.updateCount(seq);
		
	}

	@Override
	public void checkLike(Map<String, Object> map) {
		boardLikeDao.checkLike(map);
		
	}

}
