package bit_login;

public class MemberDTO {
	private String id;
	private String pw;
	
	public MemberDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}
	
	public String getId() {
		return id;
	}
	
	public String getPW() {
		return pw;
	}
}