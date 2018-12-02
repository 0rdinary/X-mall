<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>X-mall</title>
	</head>
	<body>
		<%
			if (session.getAttribute("sessionID") == null) {	// 로그인이 안되었다면
		%>
				<br><br><br>
				<b><font size="6" color="gray">X-mall에 오신걸 환영합니다</font></b>
				<br><br><br>
		<%
			} else {
		%>
				<br><br><br>
				<%
					if (session.getAttribute("sessionID").toString().equals("-1")) {
				%>
					<b><font size=6 color="red">관리자 계정 접속 </font></b>
				<% } else { %>
					<font size=6 color="skyblue"><%=session.getAttribute("sessionID") %></font>
					<font size=6>님 환영합니다.</font>
				<% }} %>
	</body>
</html>