package mem.dao;

import java.sql.Timestamp;

public class MemberDao {
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

}
