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
		<title>ȸ������ ����ȭ��</title>
		
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
					alert("��й�ȣ�� �Է��ϼ���.");
					return false;
				}
				
				if (document.userInfo.user_password.value != document.userInfo.conf_password.value) {
					alert("��й�ȣ Ȯ���� Ʋ�Ƚ��ϴ�.");
					return false;
				}
				
				if (!document.userInfo.phone_number.value) {
					alert("��ȭ��ȣ�� �Է��ϼ���.")
					return false;
				}
				
				return true;
			}
		</script>
	</head>
	<body onload="init()">
		<br><br>
		<b><font size="6" color="gray">ȸ������ ����</font></b>
		<br><br><br>
		
		<form method="post" action="MainForm.jsp?contentPage=pro/ModifyPro.jsp" name="userInfo" onsubmit="return checkValue()">
			<table>
					<tr>
						<td id="title">���̵�</td>
						<td id="title"><%=customerBean.getUser_id() %></td>
					</tr>
					
					<tr>
						<td id="title">��й�ȣ</td>
						<td>
							<input type="password" name="user_password" maxlength="10" value="<%=customerBean.getUser_password() %>">
						</td>
					</tr>
					
					<tr>
						<td id="title">��й�ȣ Ȯ��</td>
						<td>
							<input type="password" name="conf_password" maxlength="10" value="<%=customerBean.getUser_password() %>">
						</td>
					</tr>
					
					<tr>
						<td id="title">�ּ�</td>
						<td>
							<select name="address" id="address">
								<option value="����Ư����">����Ư����</option>
								<option value="�λ걤����">�λ걤����</option>
								<option value="�뱸������">�뱸������</option>
								<option value="��õ������">��õ������</option>
								<option value="���ֱ�����">���ֱ�����</option>
								<option value="����������">����������</option>
								<option value="��걤����">��걤����</option>
								<option value="����Ư����ġ��">����Ư����ġ��</option>
								<option value="��⵵">��⵵</option>
								<option value="������">������</option>
								<option value="��û�ϵ�">��û�ϵ�</option>
								<option value="��û����">��û����</option>
								<option value="����ϵ�">����ϵ�</option>
								<option value="���󳲵�">���󳲵�</option>
								<option value="���ϵ�">���ϵ�</option>
								<option value="��󳲵�">��󳲵�</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td id="title">�޴���ȭ</td>
						<td>
							<input type="text" name="phone_number" maxlength="20" value="<%=customerBean.getPhone_number() %>" >
						</td>
					</tr>
					
					<tr>
						<td id="title">����</td>
						<td>
							<input type="radio" name="sex" value="M" checked>��
							<input type="radio" name="sex" value="F" checked>��
							<input type="radio" name="sex" value="privacy" checked>�����
						</td>
					</tr>
					
					<tr>
						<td id="title">����(0�� �����)</td>
						<td>
							<input type="number" name="age" min = "0" value="<%=customerBean.getAge() %>">
						</td>
					</tr>
					
					<tr>
						<td id="title">����</td>
						<td>
							<input type="text" name="job" maxlength="20" value="<%=customerBean.getJob()==null ? "" : customerBean.getJob() %>">
						</td>
					</tr>
			</table>
			<br><br>
			<input type="button" value="���" onclick = "javascript:window.location='MainForm.jsp'">
			<input type="submit" value="����" />
		</form>
	</body>
</html>