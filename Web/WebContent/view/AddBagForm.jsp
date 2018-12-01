<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "jsp.shoppingbag.model.ShoppingbagBean" %>
<%@ page import = "jsp.shoppingbag.model.ShoppingbagDAO" %>
<%@ page import = "jsp.include.model.IncludeBean" %>
<%@ page import = "jsp.include.model.IncludeDAO" %>
<%
	String itemId = request.getParameter("itemId");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>장바구니에 담기</title>
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
	</head>
	<body>
		<br><br>
		<b><font size="6" color="gray">장바구니에 담기</font></b>
		<br><br>
	</body>
</html>