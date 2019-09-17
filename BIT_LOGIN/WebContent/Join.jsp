<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>BIT_LOGIN</title>
</head>

<body>
<center>
	<form action="JoinProc.jsp" method="post">
		<h1>회원가입</h1>
		<p style="color: green">
			아이디는 10자 이내로, 패스워드는 20자 이내로
		</p>
		ID <input type="text" name="id" size="30" placeholder="아이디" required="required" /> <br /> 
		PW <input type="password" name="pw" size="30" placeholder="비밀번호" required="required" /> <br /> 
		PW confirm <input type="password" name="pwcon" size="30" placeholder="비밀번호 확인" required="required" /> <br /> 
		<input type="submit" value="회원가입" />
		<input type="button" onclick="location.href='Login.jsp'" value="취소" />
	</form>
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