package friend.dao;

import java.util.List;
import java.util.Map;

import friend.domain.FriendVO;



public interface FriendDao {
	abstract void add(FriendVO friendVO);
	abstract void delete(FriendVO friendVO);
	abstract List<String> pendingList(String email);
	abstract void update(FriendVO friendVO);
	abstract int checkFriend(FriendVO friendVO);
	abstract void updateChat(FriendVO friendVO);
	abstract String checkChat(FriendVO friendVO);
}
