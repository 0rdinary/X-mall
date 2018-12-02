<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>매출확인</title>
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
			function checkValue() {
				var fYear = !document.getElementById("fYear").value ? 0 : document.getElementById("fYear").value ;
				var fMonth = !document.getElementById("fMonth").value ? 0 : document.getElementById("fMonth").value ;
				var fDay = !document.getElementById("fDay").value ? 0 : document.getElementById("fDay").value;
				var tYear = !document.getElementById("tYear").value ? 0 : document.getElementById("tYear").value;
				var tMonth = !document.getElementById("tMonth").value ? 0 : document.getElementById("tMonth").value;
				var tDay = !document.getElementById("tDay").value ? 0 : document.getElementById("tDay").value;
				
				if ((fDay != 0) && ((fYear==0) || (fMonth==0)) ) {
					alert("from : 일을 입력하려면 년과 달을 입력해주세요");
					return false;
				} else if ((fMonth != 0) && (fYear == 0)) {
					alert("to : 달을 입력하려면 년을 입력해주세요");
					return false;
				} else if ((tDay != 0) && ((tYear==0) || (tMonth==0)) ) {
					alert("from : 일을 입력하려면 년과 달을 입력해주세요");
					return false;
				} else if ((tMonth != 0) && (tYear == 0)) {
					alert("to : 달을 입력하려면 년을 입력해주세요");
					return false;
				}
				
				return true;
			}
			function changeForm() {
				if (checkValue()) {
					var fYear = !document.getElementById("fYear").value ? 0 : document.getElementById("fYear").value ;
					var fMonth = !document.getElementById("fMonth").value ? 0 : document.getElementById("fMonth").value ;
					var fDay = !document.getElementById("fDay").value ? 0 : document.getElementById("fDay").value;
					var tYear = !document.getElementById("tYear").value ? 0 : document.getElementById("tYear").value;
					var tMonth = !document.getElementById("tMonth").value ? 0 : document.getElementById("tMonth").value;
					var tDay = !document.getElementById("tDay").value ? 0 : document.getElementById("tDay").value;
					location.href="MainForm.jsp?contentPage=pro/IncomePro.jsp?word=" + fYear + "+" + fMonth + "+" + fDay + "+" + tYear + "+" + tMonth + "+" +tDay;
				}
			}
		</script>
	</head>
	<body>
		<br><br>
		<b><font size = "6" color="gray" >매출 확인</font></b>
		<br><br>
		<table>
			<tr>
				<td id="title">From</td>
				<td id="content"><input type="text" id="fYear" name="fYear">년</td>
				<td id="content"><input type="text" id="fMonth" name="fMonth">월</td>
				<td id="content"><input type="text" id="fDay" name="fDay">일</td>
			</tr>
			<tr>
				<td id="title">To</td>
				<td id="content"><input type="text" id="tYear" name="tYear">년</td>
				<td id="content"><input type="text" id="tMonth" name="tMonth">월</td>
				<td id="content"><input type="text" id="tDay" name="tDay">일</td>
			</tr>
		</table>
		<input type="button" value="확인하기" onclick="changeForm()">
	</body>
</html>