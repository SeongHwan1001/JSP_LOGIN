package bit_login;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class MemberDAO{
	private static MemberDAO instance = null;
	// List로 회원 정보를 관리한다.
	private static ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();

    private MemberDAO(){}
    public static MemberDAO getInstance(){
        if(instance == null) {
        	instance = new MemberDAO();
        	setup();
        }
            
        return instance;
    }
    
	public static void setup() {
		memberList.add(new MemberDTO("min", "min123"));
		memberList.add(new MemberDTO("hoon", "hoon123"));
		memberList.add(new MemberDTO("hwan", "hwan123"));
		memberList.add(new MemberDTO("hyun", "hyun123"));
	}
	
	// 로그인 버튼 클릭시 여기로
	// 회원 정보 list에서 회원 정보가 있는지 check 한다.
	public boolean checkMember(String id, String pw) {
		for(MemberDTO data: memberList) {
			if(data.getId().equals(id) && data.getPW().equals(pw)) {
				return true;
			}
		}
		return false;
	}
	
	// ID 중복 검사
	public boolean checkId(String id) {
		for(MemberDTO data: memberList) {
			if(data.getId().equals(id)) {
				return true;
			}
		}
		return false;
	}
	
	public boolean checkLength(String id, String pw) {
		  if(id.length() > 10 || pw.length() > 20) {
			  return false;
		  }
		  
		  return true;
	  }
	  
	  // PW, PWCON 일치 검사
	  public boolean checkPw(String pw, String pwcon) {
		  if (pw.equals(pwcon)) {
			  return true;
		  }
		  
		  return false;
	  }
	
	// 이미 존재하는 id인지 확인
	public boolean joinMember(String id, String pw) {
		if(checkId(id)) {
			return false;
		}
		
		// 이미 존재하지 않으면 add
		memberList.add(new MemberDTO(id, pw));
		return true;
	}
}