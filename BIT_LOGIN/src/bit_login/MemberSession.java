package bit_login;

import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class MemberSession implements HttpSessionBindingListener{
	private static MemberSession instance = null;
	private static Hashtable loginUsers = new Hashtable();
	
	private MemberSession(){}
    public static MemberSession getInstance(){
        if(instance == null) {
        	instance = new MemberSession();
        }
            
        return instance;
    }
	
    // 이미 세션이 등록되어 있는지 확인
	public boolean isLogin(String sessionID) {
		boolean isLogin = false;
		// 해시테이블 loginUsers에 있는 모든 값들을 가져온다.
		Enumeration e = loginUsers.keys();
		String key = "";
		
		while(e.hasMoreElements()) {
			key = (String)e.nextElement();
			if(sessionID.equals(key)) {
				isLogin = true;
			}
		}
		return isLogin;
	}
	
	// 이미 로그인 되어 있는지 확인
	public boolean isUsing(String id) {
		boolean isUsing = false;
		
		Enumeration e = loginUsers.keys();
		String key = "";
		while(e.hasMoreElements()) {
			key = (String)e.nextElement();
			if(id.equals(loginUsers.get(key))) {
				isUsing = true;
			}
		}
		return isUsing;
	}
	
	// 세션을 해쉬테이블에 등록
	public void setSession(HttpSession session, String id) {
		// 할당된 고유의 세션 값을 key로, id를 값으로 하여 해쉬테이블에 등록
		loginUsers.put(session.getId(), id);
		session.setAttribute("login", this.getInstance());
	}
	
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		
	}
	
	// 해쉬테이블의 세션을 삭제
	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		loginUsers.remove(event.getSession().getId());
	}
	
	public String getUserID(String sessionID) {
		return (String)loginUsers.get(sessionID);
	}
	
	// 해쉬테이블에 등록된 세션 즉, 접속자의 수를 구하기 위함.
	public int getUserCount() {
		return loginUsers.size();
	}
}
