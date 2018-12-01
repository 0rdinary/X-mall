<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "jsp.customer.model.CustomerDAO" %>
<%@ page import = "jsp.customer.model.CustomerBean" %>

<!DOCTYPE html>
<html>
	<head>
		<%
			String id = session.getAttribute("sessionID").toString();
		
			CustomerDAO dao = CustomerDAO.getInstance();
			CustomerBean customerBean = dao.getUserInfo(id);
		%>
		<meta charset="EUC-KR">
		<title>회원정보 수정화면</title>
		
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
			function init() {
				setComboValue("<%=customerBean.getAddress()%>");
			}
			
			function setComboValue(val) {
				var selectAddress = document.getElementById('address');
				for (i = 0, j = selectAddress.length; i < j; i++) {
					if (selectAddress.options[i].value == val) {
						selectAddress.options[i].selected = true;
						break;
					}
				}
			}
			
			function checkValue() {
				if (!document.userInfo.user_password.value) {
					alert("비밀번호를 입력하세요.");
					return false;
				}
				
				if (document.userInfo.user_password.value != document.userInfo.conf_password.value) {
					alert("비밀번호 확인이 틀렸습니다.");
					return false;
				}
				
				if (!document.userInfo.phone_number.value) {
					alert("전화번호를 입력하세요.")
					return false;
				}
				
				return true;
			}
		</script>
	</head>
	<body onload="init()">
		<br><br>
		<b><font size="6" color="gray">회원정보 수정</font></b>
		<br><br><br>
		
		<form method="post" action="MainForm.jsp?contentPage=pro/ModifyPro.jsp" name="userInfo" onsubmit="return checkValue()">
			<table>
					<tr>
						<td id="title">아이디</td>
						<td id="title"><%=customerBean.getUser_id() %></td>
					</tr>
					
					<tr>
						<td id="title">비밀번호</td>
						<td>
							<input type="password" name="user_password" maxlength="10" value="<%=customerBean.getUser_password() %>">
						</td>
					</tr>
					
					<tr>
						<td id="title">비밀번호 확인</td>
						<td>
							<input type="password" name="conf_password" maxlength="10" value="<%=customerBean.getUser_password() %>">
						</td>
					</tr>
					
					<tr>
						<td id="title">주소</td>
						<td>
							<select name="address" id="address">
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
						<td id="title">휴대전화</td>
						<td>
							<input type="text" name="phone_number" maxlength="20" value="<%=customerBean.getPhone_number() %>" >
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
							<input type="number" name="age" min = "0" value="<%=customerBean.getAge() %>">
						</td>
					</tr>
					
					<tr>
						<td id="title">직업</td>
						<td>
							<input type="text" name="job" maxlength="20" value="<%=customerBean.getJob()==null ? "" : customerBean.getJob() %>">
						</td>
					</tr>
			</table>
			<br><br>
			<input type="button" value="취소" onclick = "javascript:window.location='MainForm.jsp'">
			<input type="submit" value="수정" />
		</form>
	</body>
</html>