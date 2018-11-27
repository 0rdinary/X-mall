<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>카테고리</title>
		
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
		<b><font size="6" color="gray">물품 카테고리</font></b>
		<br><br>
	
		<table>
			<tr>
				<td id="title" colspan="2">카테고리 선택</td>
			</tr>
			<tr>
				<td rowspan="3" onclick="changeView(11)" style="cursor:pointer">과일/견과</td>
				<td onclick="changeView(1)" style="cursor:pointer;">사과/배/감</td>
			</tr>
			<tr>
				<td onclick="changeView(2)" style="cursor:pointer;">수박/메론/참외</td>
			</tr>
			<tr>
				<td onclick="changeView(3)" style="cursor:pointer;">키위/포도</td>
			</tr>
			
			<tr>
				<td rowspan="3" onclick="changeView(12)" style="cursor:pointer">채소</td>
				<td onclick="changeView(4)" style="cursor:pointer;">고구마/호박고구마/감자</td>
			</tr>
			<tr>
				<td onclick="changeView(5)" style="cursor:pointer;">두부/콩나물</td>
			</tr>
			<tr>
				<td onclick="changeView(6)" style="cursor:pointer;">오이/가지/호박/옥수수</td>
			</tr>
			
			<tr>
				<td rowspan="3" onclick="changeView(13)" style="cursor:pointer">유제품/냉장/냉동/간편식</td>
				<td onclick="changeView(7)" style="cursor:pointer;">아이스크림</td>
			</tr>
			<tr>
				<td onclick="changeView(8)" style="cursor:pointer;">만두/돈까스/떡갈비/냉동</td>
			</tr>
			<tr>
				<td onclick="changeView(9)" style="cursor:pointer;">면/떡국/찌개/냉장</td>
			</tr>
		</table>
	</body>
</html>