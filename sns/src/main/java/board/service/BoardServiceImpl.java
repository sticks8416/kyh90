package board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import board.dao.BoardDao;
import board.domain.BoardVO;
import member.domain.MemberVO;

@Service
public class BoardServiceImpl implements BoardService{
		private BoardDao boardDao;
		

		public BoardDao getBoardDao() {
			return boardDao;
		}

		public void setBoardDao(BoardDao boardDao) {
			this.boardDao = boardDao;
		}
		@Override
		public List<BoardVO> list(){
			return boardDao.list();
		}
		@Override
		public int delete(BoardVO boardVO) {
			return boardDao.delete(boardVO);
		}
	
		@Override
		public void write(BoardVO boardVO) {
			boardDao.insert(boardVO);
		}
		@Override
		public BoardVO read(int num) {
			boardDao.updateReadCount(num);
			return boardDao.select(num);
		}
		@Override
		public List<MemberVO> memberSearch(String Search){
			return boardDao.memberSearch(Search);
		}
	/*
	 * @Override public List<BoardVO> boardSearch(String Search){ return
	 * boardDao.boardSearch(Search); }
	 */
}
