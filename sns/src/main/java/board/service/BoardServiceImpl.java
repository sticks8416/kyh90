package board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import board.dao.BoardDao;
import board.domain.BoardVO;
import board.domain.ReplyVO;
import member.dao.MemberDao;
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
			return boardDao.select(num);
		}
		@Override
		public MemberVO readProfile(String email) {
			return boardDao.selectProfile(email);
		}
		@Override
		public List<MemberVO> memberSearch(String Search){
			return boardDao.memberSearch(Search);
		}
		@Override
		public int updateProfile(MemberVO memberVO) {
			return boardDao.updateProfile(memberVO);
		}
		@Override
		public int edit(BoardVO boardVO) {
			return boardDao.update(boardVO);
		}
	/*
	 * @Override public List<BoardVO> boardSearch(String Search){ return
	 * boardDao.boardSearch(Search); }
	 */

		@Override
		public List<String> searchFriend(String email) {
			return boardDao.searchFriend(email);
		}

		@Override
		public List<ReplyVO> replyList() {
			return boardDao.replyList();
		}
}
