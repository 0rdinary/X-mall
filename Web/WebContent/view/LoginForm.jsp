<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<%
			request.setCharacterEncoding("euc-kr");
		%>
		<title>X-mall �α���</title>
		<style>
				table{
					padding: 60px 0px;
					margin-left:auto;
					margin-right:auto;
					border:3px solid skyblue
				}
						
				td{
					border:1px solid skyblue
				}
				#title{
					background-color:skyblue
				}
		</style>
		
		<script type = "text/javascript">
			function checkValue() {
				inputForm = eval("document.loginInfo");
				if (!inputForm.user_id.value) {
					alert("���̵� �Է��ϼ���");
					inputForm.id.focus();
					return false;
				}
				if (!inputForm.user_password.value) {
					alert("��й�ȣ�� �Է��ϼ���");
					inputForm.user_password.focus();
					return false;
				}
			}
			
			function goMainForm() {
				location.href="MainForm.jsp";
			}
		</script>
	</head>
	<body>
		<div id="wrap">
			<form name="loginInfo" method="post" action="pro/LoginPro.jsp" onsubmit="return checkValue()">
				�̿��� ���ؼ� �α����� ���ֽʽÿ�
				<br><br>
				
				<table>
					<tr>
						<td bgcolor="skyblue">���̵�</td>
						<td><input type="text" name="id" maxlength="11"></td>
					</tr>
					<tr>
						<td bgcolor="skyblue">��й�ȣ</td>
						<td><input type="password" name="password" maxlength="10"></td>
					</tr>
				</table>
				<input type="submit" value="�α���"/>
				<input type="button" value="���" onclick="goMainForm()"/>
			</form>
			
			<%
				String msg=request.getParameter("msg");
			
				if(msg!= null && msg.equals("0")) {
					out.println("<br>");
					out.println("<font color='red' size='5'>��й�ȣ�� Ȯ���� �ּ���.</font>");
				} else if (msg!= null && msg.equals("-1")) {
					out.println("<br>");
					out.println("<font color='red' size='5'>���̵� Ȯ���� �ּ���.</font>");
				}
			%>
		</div>
	</body>
</html>