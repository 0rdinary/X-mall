<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>����Ȯ��</title>
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
					alert("from : ���� �Է��Ϸ��� ��� ���� �Է����ּ���");
					return false;
				} else if ((fMonth != 0) && (fYear == 0)) {
					alert("to : ���� �Է��Ϸ��� ���� �Է����ּ���");
					return false;
				} else if ((tDay != 0) && ((tYear==0) || (tMonth==0)) ) {
					alert("from : ���� �Է��Ϸ��� ��� ���� �Է����ּ���");
					return false;
				} else if ((tMonth != 0) && (tYear == 0)) {
					alert("to : ���� �Է��Ϸ��� ���� �Է����ּ���");
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
		<b><font size = "6" color="gray" >���� Ȯ��</font></b>
		<br><br>
		<table>
			<tr>
				<td id="title">From</td>
				<td id="content"><input type="text" id="fYear" name="fYear">��</td>
				<td id="content"><input type="text" id="fMonth" name="fMonth">��</td>
				<td id="content"><input type="text" id="fDay" name="fDay">��</td>
			</tr>
			<tr>
				<td id="title">To</td>
				<td id="content"><input type="text" id="tYear" name="tYear">��</td>
				<td id="content"><input type="text" id="tMonth" name="tMonth">��</td>
				<td id="content"><input type="text" id="tDay" name="tDay">��</td>
			</tr>
		</table>
		<input type="button" value="Ȯ���ϱ�" onclick="changeForm()">
	</body>
</html>