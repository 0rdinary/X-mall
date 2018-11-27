<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import = "jsp.customer.model.CustomerBean" %>
<%@ page import = "jsp.customer.model.CustomerDAO" %>

<%
	request.setCharacterEncoding("euc-kr");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>ȸ������ ����ó��</title>
	</head>
	<body>
		<jsp:useBean id="customerBean" class="jsp.customer.model.CustomerBean"/>
		<jsp:setProperty property="*" name="customerBean"/>
		
		<%
			String id = session.getAttribute("sessionID").toString();
			customerBean.setUser_id(Integer.parseInt(id));
			System.out.println(customerBean.getAddress());
			
			CustomerDAO dao = CustomerDAO.getInstance();
			dao.updateCustomer(customerBean);
		%>
		
		<br><br>
		<font size="5" color="gray">ȸ�������� �����Ǿ����ϴ�.</font>
		<br><br>
		<input type="button" value="��������" onclick="javascript:window.location='MainForm.jsp'">
	</body>
</html>