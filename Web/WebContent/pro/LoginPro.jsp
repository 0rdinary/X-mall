<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "jsp.customer.model.CustomerDAO" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>�α��� ó�� JSP</title>
	</head>
	
	<body>
		<%
			// ���ڵ� ó��
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
			
			// URL �� �α��ΰ��� ���� �޽��� 
			String msg = "";
			
			if (check == 1) {	// �α��� ����
				// ���ǿ� ���̵� ����
				session.setAttribute("sessionID", id);
				msg = "../MainForm.jsp";
			} else if (check == 0) {	// ��й�ȣ�� Ʋ��
				msg = "../MainForm.jsp?contentPage=view/LoginForm.jsp?msg=0";
			} else {	// ���̵� Ʋ��
				msg = "../MainForm.jsp?contentPage=view/LoginForm.jsp?msg=-1";
			}
			
			// sendRedirect(String URL) : �ش� URL�� �̵�
			// URLenldp get ��� ó�� �����͸� ���� ���� 
			response.sendRedirect(msg);
		%>
	</body>
</html>