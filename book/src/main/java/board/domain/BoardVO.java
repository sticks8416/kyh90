package board.domain;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;


@Alias("BoardVO")
public class BoardVO {
	private int seq;
	
	@Length(min=2, max=5, message="제목은 2자 이상, 5자 미만 입력해야 합니다.")
	private String title;
	
	@NotEmpty(message="내용을 입력하세요.")
	private String content;

	@NotEmpty(message="작성자를 입력하세요.")
	private String writer;
	private String money;
	private String company;
	private String bookisbn;
	private int password;
	private Timestamp regDate;
	private String image;
	private int cnt;
	
	public BoardVO() {}
	
	public BoardVO(String title, String content, 
			String money, String company, String bookisbn, String image,
			String writer, int password) {
		super();
		this.title = title;
		this.content = content;
		this.money = money;
		this.writer = writer;
		this.company = company;
		this.bookisbn = bookisbn;
		this.image = image;
		this.password = password;
		this.cnt = 0;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getBookisbn() {
		return bookisbn;
	}

	public void setBookisbn(String bookisbn) {
		this.bookisbn = bookisbn;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getWriter() {
		return writer;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getPassword() {
		return password;
	}

	public void setPassword(int password) {
		this.password = password;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	


}
