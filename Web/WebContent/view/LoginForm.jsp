<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>X-mall 로그인</title>
		<style>
				#wrap{
					width:530px;
					margin-left:auto;
					margin-right:auto;
					text-align:center;
				}
				table{
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
		</script>
	</head>
	<body>
	
	</body>
</html>