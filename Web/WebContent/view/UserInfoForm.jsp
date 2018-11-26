<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import = "jsp.customer.model.CustomerDAO" %>
<%@ page import = "jsp.customer.model.CustomerBean" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>ȸ�� ����</title>
		
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
			function changeForm(val) {
				if (val == "-1") {
					location.href = "MainForm.jsp";
				} else if (val == "0") {
					location.href = "MainForm.jsp?contentPage=view/ModifyForm.jsp";
				}
			}
		</script>
	</head>
	<body>
		<%
			String id = session.getAttribute("sessionID").toString();
		
			CustomerDAO dao = CustomerDAO.getInstance();
			CustomerBean customerBean = dao.getUserInfo(id);
		%>
		
			<br><br>
			<b><font size="6" color="gray">������</font></b>
			<br><br><br>
			
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
					<td><%=customerBean.getSex()==null ? "privacy" : customerBean.getSex() %></td>
				</tr>
				<tr>
					<td id="title">����</td>
					<td><%=customerBean.getAge() %></td>
				</tr>
				<tr>
					<td id="title">����</td>
					<td><%=customerBean.getJob()==null ? "privacy" : customerBean.getJob() %></td>
				</tr>
			</table>
			
			<br>
			<input type="button" value="Ȩ����" onclick="changeForm(-1)">
			<input type="button" value="ȸ������ ����" onclick="changeForm(0)">
	</body>
</html>