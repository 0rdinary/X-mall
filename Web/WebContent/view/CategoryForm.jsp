<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>ī�װ�</title>
		
		<style type="text/css">
			table {
				margin-left:auto;
				margin-right:auto;
				width:500px;
				border:3px solid skyblue;
			}
			
			td {
				border:1px solid skyblue;
			}
			
			#title {
				background-color:skyblue;
			}
			
			#content {
				background-color:white;
			}
		</style>
		
		<script type="text/javascript">
			function changeCategory(val) {
				location.href="MainForm.jsp?contentPage=view/ItemlistForm.jsp?categoryIdx=" + val;
			}
		</script >
	</head>
	<body>
		<br><br>
		<b><font size="6" color="gray">��ǰ ī�װ�</font></b>
		<br><br>
	
		<table>
			<tr>
				<td id="title" colspan="2">ī�װ� ����</td>
			</tr>
			<tr id = "content">
				<td rowspan="3" onclick="changeCategory(11)" style="cursor:pointer">����/�߰�</td>
				<td onclick="changeCategory(1)" style="cursor:pointer;">���/��/��</td>
			</tr>
			<tr id = "content">
				<td onclick="changeCategory(2)" style="cursor:pointer;">����/�޷�/����</td>
			</tr>
			<tr id = "content">
				<td onclick="changeCategory(3)" style="cursor:pointer;">Ű��/����</td>
			</tr>
			
			<tr id = "content">
				<td rowspan="3" onclick="changeCategory(12)" style="cursor:pointer">ä��</td>
				<td onclick="changeCategory(4)" style="cursor:pointer;">����/ȣ�ڰ���/����</td>
			</tr>
			<tr id = "content">
				<td onclick="changeCategory(5)" style="cursor:pointer;">�κ�/�ᳪ��</td>
			</tr>
			<tr id = "content">
				<td onclick="changeCategory(6)" style="cursor:pointer;">����/����/ȣ��/������</td>
			</tr>
			
			<tr id = "content">
				<td rowspan="3" onclick="changeCategory(13)" style="cursor:pointer">����ǰ/����/�õ�/�����</td>
				<td onclick="changeCategory(7)" style="cursor:pointer;">���̽�ũ��</td>
			</tr>
			<tr id = "content">
				<td onclick="changeCategory(8)" style="cursor:pointer;">����/���/������/�õ�</td>
			</tr>
			<tr id = "content">
				<td onclick="changeCategory(9)" style="cursor:pointer;">��/����/�/����</td>
			</tr>
		</table>
	</body>
</html>