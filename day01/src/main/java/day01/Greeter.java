package day01;

public class Greeter {
	private String format;
	
	public Greeter() {
			System.out.println("Greeter 생성됨요");
	}
	public String greet(String guest) {
		return String.format(format, guest);
	}
	public void setFormat(String format) {
		this.format = format;
	}

}
