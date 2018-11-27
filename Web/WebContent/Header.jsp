<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>상단 영역</title>
		
		<link rel = "stylesheet" href="css/bootstrap.min.css">
		<style type="test/css">
			#wrap {
				text-align: center;
				width: 800px;
				height: 150px;
			}
		</style>
		
		<script type="text/javascript">
			function changeView(value) {
				if (value == "0") {	// Home 버튼 클릭시 메인화면 이동
					location.href="MainForm.jsp";
				} else if (value == "1") {	// 로그인 버튼 클릭시 로그인 화면 이동
					location.href="MainForm.jsp?contentPage=view/LoginForm.jsp";
				} else if (value == "2") {	// 회원가입 버튼 클릭시 회원가입 화면으로 이동
					location.href="MainForm.jsp?contentPage=view/JoinForm.jsp";
				} else if (value == "3") {	// 로그아웃 버튼 클릭시 로그아웃 처리
					location.href="pro/LogoutPro.jsp";
				} else if (value == "4") {	// 회원정보 변경
					location.href="MainForm.jsp?contentPage=view/UserInfoForm.jsp";
				} else if (value == "5") {	// 카테고리 버튼 클릭시물품 리스트화면으로 이동
					location.href="MainForm.jsp?contentPage=view/CategoryForm.jsp";
				}
			}
		</script>
	</head>
	
	<body>
		<div id = "wrap">
			<p>
				<button class="btn btn-success" onclick="changeView(0)">HOME</button>
				<%
					// 로그인 안되었을 경우, 로그인 회원가입 버튼을 보여줌
					if (session.getAttribute("sessionID") == null) {
				%>
						<button id="loginBtn" class="btn btn-primary" onclick="changeView(1)">로그인</button>
						<button id="joinBtn"  class="btn btn-primary" onclick="changeView(2)">회원가입</button>
				<%
					} else { // 로그인 되있을 경우, 로그아웃, 내정보 버튼을 보여줌
				%>
						<button id="logoutBtn" class="btn btn-primary" onclick="changeView(3)">로그아웃</button>
						<button id="updateBtn" class="btn btn-primary" onclick="changeView(4)">내정보</button>
						<button id="categoryBtn" class="btn btn-primary" onclick="changeView(5)">카테고리</button>
				<%  } %>
			</p>
		</div>
	</body>
</html>