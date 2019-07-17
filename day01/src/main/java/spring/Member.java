package spring;

import java.util.Date;

public class Member {
	private Long id;
	private String email;
	private String pw;
	private String name;
	private Date registerDate;
	
	public Member(String email, String pw, String name, Date registerDate){
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.registerDate = registerDate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	
	public void changePw(String oldPw, String newPw) {
		if(!pw.equals(oldPw)) {
			throw new IdPasswordNotMatchingException();
		}
		this.pw = newPw;
	}

}
