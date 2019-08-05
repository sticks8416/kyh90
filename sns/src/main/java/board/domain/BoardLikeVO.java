package board.domain;

import org.apache.ibatis.type.Alias;

@Alias("BoardLikeVO")
public class BoardLikeVO {
	private int seq;
	private String id;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
