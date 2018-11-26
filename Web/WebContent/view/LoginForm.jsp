<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<%
			request.setCharacterEncoding("euc-kr");
		%>
		<title>X-mall 로그인</title>
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
					alert("아이디를 입력하세요");
					inputForm.id.focus();
					return false;
				}
				if (!inputForm.user_password.value) {
					alert("비밀번호를 입력하세요");
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
				이용을 위해서 로그인을 해주십시오
				<br><br>
				
				<table>
					<tr>
						<td bgcolor="skyblue">아이디</td>
						<td><input type="text" name="id" maxlength="11"></td>
					</tr>
					<tr>
						<td bgcolor="skyblue">비밀번호</td>
						<td><input type="password" name="password" maxlength="10"></td>
					</tr>
				</table>
				<input type="submit" value="로그인"/>
				<input type="button" value="취소" onclick="goMainForm()"/>
			</form>
			
			<%
				String msg=request.getParameter("msg");
			
				if(msg!= null && msg.equals("0")) {
					out.println("<br>");
					out.println("<font color='red' size='5'>비밀번호를 확인해 주세요.</font>");
				} else if (msg!= null && msg.equals("-1")) {
					out.println("<br>");
					out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
				}
			%>
		</div>
	</body>
</html>