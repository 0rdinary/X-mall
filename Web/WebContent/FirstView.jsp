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
			if (session.getAttribute("sessionID") == null) {	// �α����� �ȵǾ��ٸ�
		%>
				<br><br><br>
				<b><font size="6" color="gray">X-mall�� ���Ű� ȯ���մϴ�</font></b>
				<br><br><br>
		<%
			} else {
		%>
				<br><br><br>
				<%
					if (session.getAttribute("sessionID").toString().equals("-1")) {
				%>
					<b><font size=6 color="red">������ ���� ���� </font></b>
				<% } else { %>
					<font size=6 color="skyblue"><%=session.getAttribute("sessionID") %></font>
					<font size=6>�� ȯ���մϴ�.</font>
				<% }} %>
	</body>
</html>