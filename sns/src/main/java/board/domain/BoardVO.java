package board.domain;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Alias("BoardVO")
public class BoardVO {
	private int num;
	private int counting;
	public int getCounting() {
		return counting;
	}
	public void setCounting(int counting) {
		this.counting = counting;
	}
	private String writer;
	private String title;
	private String password;
	private String email;
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	private String images;
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	private int seq;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	private int ref;
	private int step;
	private int depth;
	private Timestamp regDate;
	private String content;
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public BoardVO() {}
	
	public BoardVO(String title, String email, String images, String content, String writer, String password, Timestamp regdate) {
		super();
		this.title = title;
		this.images = images;
		this.content = content;
		this.writer = writer;
		this.password = password;
		this.regDate = regdate;
		this.email = email;
	}
}
