package friend.domain;

import org.apache.ibatis.type.Alias;

@Alias("FriendVO")
public class FriendVO {
	private String email1;
	private String email2;
	private String relationship;
	private String chat;
	
	public String getChat() {
		return chat;
	}
	public void setChat(String chat) {
		this.chat = chat;
	}

	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getRelationship() {
		return relationship;
	}
	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}
	
}
