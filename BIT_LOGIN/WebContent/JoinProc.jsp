<%@page import="bit_login.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String pwcon = request.getParameter("pwcon");
	String redirectUrl = "Join.jsp?error=The passwords are different.";
	MemberDAO m = MemberDAO.getInstance();
	if (m.checkPw(pw, pwcon)) {
		if (m.checkLength(id, pw)) {
			if (m.joinMember(id.toLowerCase(), pw)) {
				redirectUrl = "Login.jsp?error=registration completed";
			}
			else {
				redirectUrl = "Join.jsp?error=ID already registered.";
			}
		}
		else {
			redirectUrl = "Join.jsp?error=ID or PW length exceeded.";
		}
	}
	response.sendRedirect(redirectUrl);
%>