<%@page import="bit_login.MemberSession"%>
<%@page import="bit_login.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	String redirectUrl = "Login.jsp?error=ID or PW is different.";
	
	MemberDAO m = MemberDAO.getInstance();
	MemberSession ms = MemberSession.getInstance();
	
	// 회원정보가 존재하는지 check
	if(m.checkMember(id, pw)) {
		// 이미 다른 곳에서 로그인 되어 있는지 check
		if(!ms.isUsing(id)) {
			/* 회원 정보가 존재하고 로그인이 되어 있지 않다면 session 등록 */
			ms.setSession(session, id);
			redirectUrl = "Login.jsp";
		}
		else {
			/* 회원정보는 존재하지만 로그인이 이미 되어 있다면  */
			redirectUrl = "Login.jsp?error=This ID is already logged in.";
		}
	}
	
	response.sendRedirect(redirectUrl);
%>