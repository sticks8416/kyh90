package friend.service;

import java.util.List;

import friend.dao.FriendDao;
import friend.domain.FriendVO;



public class FriendServiceImpl implements FriendService{

	FriendDao friendDao;
	public void setFriendDao(FriendDao friendDao) {
		this.friendDao = friendDao;
	}

	@Override
	public void add(FriendVO friendVO) {
		friendDao.add(friendVO);
		
	}

	@Override
	public void delete(FriendVO friendVO) {
		friendDao.delete(friendVO);
		
	}


	@Override
	public List<String> pendingList(String email) {

		return friendDao.pendingList(email);
	}

	@Override
	public void update(FriendVO friendVO) {
		friendDao.update(friendVO);
		
	}

	@Override
	public int checkFriend(FriendVO friendVO) {
		return friendDao.checkFriend(friendVO);
	}

	@Override
	public void updateChat(FriendVO friendVO) {
		friendDao.updateChat(friendVO);
		
	}

	@Override
	public String checkChat(FriendVO friendVO) {
		return friendDao.checkChat(friendVO);
	}



}
