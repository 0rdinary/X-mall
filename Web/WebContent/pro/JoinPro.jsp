<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="jsp.customer.model.CustomerBean" %>
<%@ page import="jsp.customer.model.CustomerDAO" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>ȸ������ ó�� JSP</title>
		<style>
			#wrap{
				margin-left:auto;
				margin-right:auto;
				text-align:center;
			}
			table {
				margin-left:auto;
				margin-right:auto;
				border:3px solid skyblue
			}
			td {
				border:1px solid skyblue
			}
			#title{
				background-color:skyblue
			}
		</style>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
		%>
		<jsp:useBean id="customerBean" class="jsp.customer.model.CustomerBean"/>
		<jsp:setProperty property="*" name="customerBean"/>
		
		<%
			CustomerDAO dao = CustomerDAO.getInstance();
		
			dao.insertCustomer(customerBean);
		%>
		
		<div id="wrap">
			<br><br>
			<b><font size="5" color="gray">ȸ������ ������ Ȯ���ϼ���.</font></b>
			<br><br>
			<font color="blue"><%=customerBean.getUser_id() %></font>�� ������ ���ϵ帳�ϴ�.
			<table>
				<tr>
					<td id="title">���̵�</td>
					<td><%=customerBean.getUser_id() %></td>
				</tr>
				<tr>
					<td id="title">��й�ȣ</td>
					<td><%=customerBean.getUser_password() %></td>
				</tr>
				<tr>
					<td id="title">�ּ�</td>
					<td><%=customerBean.getAddress() %></td>
				</tr>
				<tr>
					<td id="title">�޴���ȭ</td>
					<td><%=customerBean.getPhone_number() %></td>
				</tr>
				<tr>
					<td id="title">����</td>
					<td><%=customerBean.getSex() %>
				</tr>
				<tr>
					<td id="title">����</td>
					<td><%=customerBean.getAge() %>
				</tr>
				<tr>
					<td id="title">����</td>
					<td><%=customerBean.getJob() %>
				</tr>
			</table>
			
			<br>
			<input type="button" value="Ȯ��">
			<input type="button" value="���">
		</div>
	</body>
</html>