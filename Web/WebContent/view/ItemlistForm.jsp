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
		<title>ǰ�� ����Ʈ</title>
		
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
					<td>ǰ�� ��ȣ</td>
					<td>ǰ�� �̸�</td>
					<td>����</td>
					<td>�Ǹ���</td>
					<td>����</td>
				</tr>
				<tr>
				</tr>
			</table>
		</div>
		<%=categoryIdx %>
	</body>
</html>