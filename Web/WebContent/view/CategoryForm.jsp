<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>카테고리</title>
		
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
			function searchForm() {
				var selectTp = document.getElementById('tp');
				var tp;
				for (i = 0, j = selectTp.length; i < j; i++) {
					if (selectTp.options[i].selected) {
						tp = selectTp.options[i].value;
						break;
					}
				}
				var tt = document.getElementById("search").value;
				
				location.href="MainForm.jsp?contentPage=view/SearchItemlistForm.jsp?word=" + encodeURI(tp + "+" + tt);
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
			<tr id = "content">
				<td rowspan="3" onclick="changeCategory(11)" style="cursor:pointer">과일/견과</td>
				<td onclick="changeCategory(1)" style="cursor:pointer;">사과/배/감</td>
			</tr>
			<tr id = "content">
				<td onclick="changeCategory(2)" style="cursor:pointer;">수박/메론/참외</td>
			</tr>
			<tr id = "content">
				<td onclick="changeCategory(3)" style="cursor:pointer;">키위/포도</td>
			</tr>
			
			<tr id = "content">
				<td rowspan="3" onclick="changeCategory(12)" style="cursor:pointer">채소</td>
				<td onclick="changeCategory(4)" style="cursor:pointer;">고구마/호박고구마/감자</td>
			</tr>
			<tr id = "content">
				<td onclick="changeCategory(5)" style="cursor:pointer;">두부/콩나물</td>
			</tr>
			<tr id = "content">
				<td onclick="changeCategory(6)" style="cursor:pointer;">오이/가지/호박/옥수수</td>
			</tr>
			
			<tr id = "content">
				<td rowspan="3" onclick="changeCategory(13)" style="cursor:pointer">유제품/냉장/냉동/간편식</td>
				<td onclick="changeCategory(7)" style="cursor:pointer;">아이스크림</td>
			</tr>
			<tr id = "content">
				<td onclick="changeCategory(8)" style="cursor:pointer;">만두/돈까스/떡갈비/냉동</td>
			</tr>
			<tr id = "content">
				<td onclick="changeCategory(9)" style="cursor:pointer;">면/떡국/찌개/냉장</td>
			</tr>
		</table>
		<select name="tp" id = "tp">
			<option value="iid">상품 번호</option>
			<option value="name">상품 이름</option>
			<option value="pd">생산자</option>
			<option value="ip">판매자</option>
		</select>
		<input type="text" id="search" name="search">
		<input type="button" value="검색하기" onclick="searchForm()">
	</body>
</html>