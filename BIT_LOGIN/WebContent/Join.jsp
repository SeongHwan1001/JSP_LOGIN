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
		<h1>ȸ������</h1>
		<p style="color: green">
			���̵�� 10�� �̳���, �н������ 20�� �̳���
		</p>
		ID <input type="text" name="id" size="30" placeholder="���̵�" required="required" /> <br /> 
		PW <input type="password" name="pw" size="30" placeholder="��й�ȣ" required="required" /> <br /> 
		PW confirm <input type="password" name="pwcon" size="30" placeholder="��й�ȣ Ȯ��" required="required" /> <br /> 
		<input type="submit" value="ȸ������" />
		<input type="button" onclick="location.href='Login.jsp'" value="���" />
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