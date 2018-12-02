<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "jsp.shoppingbag.model.ShoppingbagBean" %>
<%@ page import = "jsp.shoppingbag.model.ShoppingbagDAO" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>장바구니 추가</title>
		<style>
			table {
				margin-left:auto;
				margin-right:auto;
				width:600px;
				border:3px solid skyblue;
			}
			td {
				border:1px solid skyblue;
			}
			#title {
				background-color:skyblue;
			}
			#content{
				background-color:white;
			}
		</style>
		<script type="text/javascript">
			function changeForm(val) {
				if (val == "-1") {
					location.href="MainForm.jsp?contentPage=view/ShoppingbaglistForm.jsp"
				} 
			}
		</script>
	</head>
	<body>
		<%
			ShoppingbagDAO ssdao = ShoppingbagDAO.getInstance();
			ssdao.insertShoppingbag(Integer.parseInt(session.getAttribute("sessionID").toString()));
		%>
		<br><br>
		<b><font size="6" color="gray">장바구니가 추가되었습니다</font></b>
		<br><br>
		<input type="button" value="돌아가기" onclick="changeForm(-1)">
	</body>
</html>