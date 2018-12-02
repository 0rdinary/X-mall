<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "jsp.customer.model.CustomerBean" %>
<%@ page import = "jsp.customer.model.CustomerDAO" %>
<%
	String uid = request.getParameter("uid");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>아이디 확인</title>
		<script type="text/javascript">
			function changeForm(val) {
				if (val == "-1") {
					location.href="MainForm.jsp?contentPage=view/JoinForm.jsp";
				}
			}
		</script>
	</head>
	<body>
			<br><br>
			<b><font size="6" color="gray"><%=uid %>는 </font></b>
			<br><br>
		<%
			CustomerBean cb = null;
			CustomerDAO cdao = CustomerDAO.getInstance();
			
			cb = cdao.getUserInfo(uid);
			if (cb == null) {
		%>
			<br><br>
			<b><font size="6" color="gray">사용가능한 아이디입니다</font></b>
			<br><br>
		<% } else { %>
			<br><br>
			<b><font size="6" color="gray">사용불가한 아이디입니다</font></b>
			<br><br>
		<% } %>
		<input type="button" value="돌아가기" onclick="changeForm(-1)" >
	</body>
</html>