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
				border:3px solid skyblue;
			}
			
			td {
				border:1px solid skyblue;
			}
			
			#title {
				background-color:skyblue;
			}
		</style>
		
		<script type="text/javascript">
			function changeView(val) {
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
			<tr>
				<td rowspan="3" onclick="changeView(11)" style="cursor:pointer">����/�߰�</td>
				<td onclick="changeView(1)" style="cursor:pointer;">���/��/��</td>
			</tr>
			<tr>
				<td onclick="changeView(2)" style="cursor:pointer;">����/�޷�/����</td>
			</tr>
			<tr>
				<td onclick="changeView(3)" style="cursor:pointer;">Ű��/����</td>
			</tr>
			
			<tr>
				<td rowspan="3" onclick="changeView(12)" style="cursor:pointer">ä��</td>
				<td onclick="changeView(4)" style="cursor:pointer;">����/ȣ�ڰ���/����</td>
			</tr>
			<tr>
				<td onclick="changeView(5)" style="cursor:pointer;">�κ�/�ᳪ��</td>
			</tr>
			<tr>
				<td onclick="changeView(6)" style="cursor:pointer;">����/����/ȣ��/������</td>
			</tr>
			
			<tr>
				<td rowspan="3" onclick="changeView(13)" style="cursor:pointer">����ǰ/����/�õ�/�����</td>
				<td onclick="changeView(7)" style="cursor:pointer;">���̽�ũ��</td>
			</tr>
			<tr>
				<td onclick="changeView(8)" style="cursor:pointer;">����/���/������/�õ�</td>
			</tr>
			<tr>
				<td onclick="changeView(9)" style="cursor:pointer;">��/����/�/����</td>
			</tr>
		</table>
	</body>
</html>