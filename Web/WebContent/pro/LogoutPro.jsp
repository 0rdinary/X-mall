<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>로그아웃 처리</title>
	</head>
	<body>
		<%
			session.invalidate();	// 모든세션정보 삭제
			response.sendRedirect("../MainForm.jsp");
		%>
	</body>
</html>