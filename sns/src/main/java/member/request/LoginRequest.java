package member.request;

public class LoginRequest {
	private String writer;
	private String pass;
	
	
	public LoginRequest() {
		super();
	}
	public LoginRequest(String writer, String pass) {
		super();
		this.writer = writer;
		this.pass = pass;
	}
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
	@Override
	public String toString() {
		return "LoginRequest [writer=" + writer + ", pass=" + pass + "]";
	}
	
	
}
