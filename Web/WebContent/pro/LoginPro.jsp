<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "jsp.customer.model.CustomerDAO" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>로그인 처리 JSP</title>
	</head>
	
	<body>
		<%
			// 인코딩 처리
			request.setCharacterEncoding("euc-kr");
		
			String id = request.getParameter("id");
			String pw = request.getParameter("password");
			
			CustomerDAO dao = CustomerDAO.getInstance();
			
			int check;
			try {
				int temp = Integer.parseInt(id);
				check = dao.loginCheck(temp, pw);
			} catch (Exception e) {
				check = -1;
			}
			
			// URL 및 로그인관련 전달 메시지 
			String msg = "";
			
			if (check == 1) {	// 로그인 성공
				// 세션에 아이디 세팅
				session.setAttribute("sessionID", id);
				msg = "../MainForm.jsp";
			} else if (check == 0) {	// 비밀번호가 틀림
				msg = "../MainForm.jsp?contentPage=view/LoginForm.jsp?msg=0";
			} else {	// 아이디가 틀림
				msg = "../MainForm.jsp?contentPage=view/LoginForm.jsp?msg=-1";
			}
			
			// sendRedirect(String URL) : 해당 URL로 이동
			// URLenldp get 방식 처럼 데이터를 전달 가능 
			response.sendRedirect(msg);
		%>
	</body>
</html>