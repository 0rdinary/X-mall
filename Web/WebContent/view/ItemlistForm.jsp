<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "jsp.item.model.ItemDAO" %>
<%@ page import = "jsp.item.model.ItemBean" %>
<%
	String categoryIdx=request.getParameter("categoryIdx");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>품목 리스트</title>
		
		<style>
			table {
				margin-left:auto;
				margin-right:auto;
				border:3px solid skyblue;
			}
			td {
				border:1px solid skyblue;
			}
		</style>
	</head>
	<body>
	
		<br>
		<div id="board">
			<table>
				<tr height="30">
					<td>품목 번호</td>
					<td>품목 이름</td>
					<td>가격</td>
					<td>판매자</td>
					<td>평점</td>
				</tr>
				<tr>
				</tr>
			</table>
		</div>
		<%=categoryIdx %>
	</body>
</html>