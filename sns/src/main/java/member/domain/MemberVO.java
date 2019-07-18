package member.domain;

import java.sql.Timestamp;
import org.apache.ibatis.type.Alias;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Alias("MemberVO")
public class MemberVO {
	private String title;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	private int num;
	public int getNum() {
		return num;
	}
	private int seq;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public void setNum(int num) {
		this.num = num;
	}

	private String writer;
	private String pass;
	private Timestamp regDate;
	private String email;
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

public MemberVO() {}
	
	public MemberVO(String writer, String pass, String email, Timestamp regdate ) {
		super();
		this.writer = writer;
		this.pass = pass;
		this.email = email;
		this.regDate = regdate;
	}
	
}
