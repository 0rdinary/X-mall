<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>X-mall 회원가입</title>
		
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
		
		<script type="text/javascript">
			function checkValue() {
				if (!document.userInfo.user_id.value) {
					alert("아이디를 입력하세요.");
					return false;
				}
				
				if (!document.userInfo.user_password.value) {
					alert("비밀번호를 입력하세요.");
					return false;
				}
				
				if (document.userInfo.user_password.value != document.userInfo.conf_password.value) {
					alert("비밀번호를 동일하게 입력하세요.");
					return false;
				}
				
				return true;
			}
			
			function goLoginForm() {
				location.href="loginForm.jsp";
			}
		</script>
	</head>
	<body>
		<div id="wrap">
			<br><br>
			<b><font size="6" color="gray">회원가입</font></b>
			<br><br><br>
			
			<form method="post" action="../pro/JoinPro.jsp" name="userInfo" onsubmit="return checkValue()">
				<table>
					<tr>
						<td id="title">*아이디(숫자 11자리이내)</td>
						<td>
							<input type="text" name="user_id" maxlength="11">
							<input type="button" value="중복확인" >
						</td>
					</tr>
					
					<tr>
						<td id="title">*비밀번호</td>
						<td>
							<input type="password" name="user_password" maxlength="10">
						</td>
					</tr>
					
					<tr>
						<td id="title">*비밀번호 확인</td>
						<td>
							<input type="password" name="conf_password" maxlength="10">
						</td>
					</tr>
					
					<tr>
						<td id="title">*주소</td>
						<td>
							<select name="address">
								<option value="서울특별시">서울특별시</option>
								<option value="부산광역시">부산광역시</option>
								<option value="대구광역시">대구광역시</option>
								<option value="인천광역시">인천광역시</option>
								<option value="광주광역시">광주광역시</option>
								<option value="대전광역시">대전광역시</option>
								<option value="울산광역시">울산광역시</option>
								<option value="세종특별자치시">세종특별자치시</option>
								<option value="경기도">경기도</option>
								<option value="강원도">강원도</option>
								<option value="충청북도">충청북도</option>
								<option value="충청남도">충청남도</option>
								<option value="전라북도">전라북도</option>
								<option value="전라남도">전라남도</option>
								<option value="경상북도">경상북도</option>
								<option value="경상남도">경상남도</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td id="title">*휴대전화</td>
						<td>
							<input type="text" name="phone_number" maxlength="20">
						</td>
					</tr>
					
					<tr>
						<td id="title">성별</td>
						<td>
							<input type="radio" name="sex" value="M" checked>남
							<input type="radio" name="sex" value="F" checked>여
							<input type="radio" name="sex" value="privacy" checked>비공개
						</td>
					</tr>
					
					<tr>
						<td id="title">나이(0은 비공개)</td>
						<td>
							<input type="number" name="age" min = "0">
						</td>
					</tr>
					
					<tr>
						<td id="title">직업</td>
						<td>
							<input type="text" name="job" maxlength="20">
						</td>
					</tr>
				</table>
				<br>
				<input type="submit" value="가입"/> <input type="button" value="취소" onclick="goLoginForm()">
			</form>
		</div>
	</body>
</html>