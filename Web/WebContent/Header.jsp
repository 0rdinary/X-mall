<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>��� ����</title>
		
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
				if (value == "0") {	// Home ��ư Ŭ���� ����ȭ�� �̵�
					location.href="MainForm.jsp";
				} else if (value == "1") {	// �α��� ��ư Ŭ���� �α��� ȭ�� �̵�
					location.href="MainForm.jsp?contentPage=view/LoginForm.jsp";
				} else if (value == "2") {	// ȸ������ ��ư Ŭ���� ȸ������ ȭ������ �̵�
					location.href="MainForm.jsp?contentPage=view/JoinForm.jsp";
				} else if (value == "3") {	// �α׾ƿ� ��ư Ŭ���� �α׾ƿ� ó��
					location.href="pro/LogoutPro.jsp";
				} else if (value == "4") {	// ȸ������ ����
					location.href="MainForm.jsp?contentPage=view/UserInfoForm.jsp";
				} else if (value == "5") {	// ī�װ� ��ư Ŭ���ù�ǰ ����Ʈȭ������ �̵�
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
					// �α��� �ȵǾ��� ���, �α��� ȸ������ ��ư�� ������
					if (session.getAttribute("sessionID") == null) {
				%>
						<button id="loginBtn" class="btn btn-primary" onclick="changeView(1)">�α���</button>
						<button id="joinBtn"  class="btn btn-primary" onclick="changeView(2)">ȸ������</button>
				<%
					} else { // �α��� ������ ���, �α׾ƿ�, ������ ��ư�� ������
				%>
						<button id="logoutBtn" class="btn btn-primary" onclick="changeView(3)">�α׾ƿ�</button>
						<button id="updateBtn" class="btn btn-primary" onclick="changeView(4)">������</button>
						<button id="categoryBtn" class="btn btn-primary" onclick="changeView(5)">ī�װ�</button>
				<%  } %>
			</p>
		</div>
	</body>
</html>