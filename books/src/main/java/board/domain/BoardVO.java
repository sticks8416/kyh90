package board.domain;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Alias("BoardVO")
public class BoardVO {
		private long seq;
		
		public long getPrice() {
			return price;
		}

		public void setPrice(long price) {
			this.price = price;
		}

		public int getNumbering() {
			return numbering;
		}

		public void setNumbering(int numbering) {
			this.numbering = numbering;
		}

		public long getISBN() {
			return ISBN;
		}

		public void setISBN(long iSBN) {
			ISBN = iSBN;
		}

		public String getPublisher() {
			return publisher;
		}

		public void setPublisher(String publisher) {
			this.publisher = publisher;
		}

		public String getIntroduce() {
			return introduce;
		}

		public void setIntroduce(String introduce) {
			this.introduce = introduce;
		}

		public void setSeq(long seq) {
			this.seq = seq;
		}
		@Length(min=2, max=20, message="제목은 2자이상, 5자 미만 입력해야 합니다.")
		private String title;
		
		@NotEmpty(message="내용을 입력하세요.")
		private String content;
		
		@NotEmpty(message="작성자를 입력하세요.")
		private String writer;
		private int password;
		private Timestamp regDate;
		private int cnt;
		private long price;
		private int numbering;
		private long ISBN;
		private String publisher;
		private String introduce;
		private String cover;
		
		public String getCover() {
			return cover;
		}

		public void setCover(String cover) {
			this.cover = cover;
		}

		public BoardVO() {}
		
		public BoardVO(String title, String content, String writer, int password) {
			super();
			this.title = title;
			this.content = content;
			this.writer = writer;
			this.password = password;
			this.cnt = 0;
		}
		
		public  long getSeq() {
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
