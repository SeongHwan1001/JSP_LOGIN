<%@page import="bit_login.MemberSession"%>
<%@page import="bit_login.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	MemberDAO m = MemberDAO.getInstance();
	MemberSession ms = MemberSession.getInstance();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIT_LOGIN</title>
</head>
<body>
	<center>
		현재 접속자수 :
		<%=ms.getUserCount()%>
		
		<!-- 해쉬테이블(세션)을 뒤져 세션이 있는지 확인 -->
		<%
			if (ms.isLogin(session.getId())) {
		%>
		
		<!-- 해쉬테이블에서 login이 되어 있으면 main 출력  -->
		<h1>
			<%=ms.getUserID(session.getId())%>님 반갑습니다.
		</h1>
		<a href="LogoutProc.jsp">로그아웃</a>
		
		<!-- 해쉬테이블(세션)에 존재하지 않으면 else Login 출력 -->
		<%
			} else {
		%>
		<form action="LoginProc.jsp" method="post">
			<h1>Login</h1>
			<input type="text" name="id" size="30" placeholder="아이디" required="required" /> <br /> 
				<input type="password" name="pw" size="30" placeholder="비밀번호" required="required" /> <br /> 
				<input type="submit" value="로그인" />
				<input type="button" onclick="location.href='Join.jsp'" value="회원가입" />
		</form>
		<%
			}
		%>
		<%
			if (request.getParameter("error") != null) {
		%>
		<p style="color: red">
			<%=request.getParameter("error")%>
		</p>
		<%
			}
		%>
	</center>
</body>
</html>