package member.domain;

import java.sql.Timestamp;
import org.apache.ibatis.type.Alias;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Alias("MemberVO")
public class MemberVO {
	public String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	private String profile;
	private String password;
	private Timestamp regDate;
	private String email;
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
	
	public MemberVO(String name, String password, String email, Timestamp regdate, String profile) {
		super();
		this.name = name;
		this.password = password;
		this.email = email;
		this.regDate = regdate;
		this.profile = profile;
	}
	
}
