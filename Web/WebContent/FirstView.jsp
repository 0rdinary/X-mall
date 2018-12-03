<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "jsp.customer.model.CustomerDAO" %>
<%@ page import = "jsp.customer.model.CustomerBean" %>
<%@ page import = "jsp.item.model.ItemDAO" %>
<%@ page import = "jsp.item.model.ItemBean" %>
<%@ page import = "jsp.ordered_by.model.OrderedbyDAO" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>X-mall</title>
		<style>
			table {
				margin-left:auto;
				margin-right:auto;
				width:700px;
				border:3px solid skyblue;
			}
			td {
				border:1px solid skyblue;
			}
			#title {
				background-color:skyblue;
			}
			#content{
				background-color:white;
			}
		</style>
		
		<script type="text/javascript">
			function changeForm(val) {
				if (val == "-1") {
					location.href = "MainForm.jsp?contentPage=view/CategoryForm.jsp";
				} else { // �ش���������� �̵��� �� �ְ� ��
					location.href = "MainForm.jsp?contentPage=view/ItemInfoForm.jsp?itemId=" + val;
				}
			}
		</script>
	</head>
	<body>
		<%
			if (session.getAttribute("sessionID") == null) {	// �α����� �ȵǾ��ٸ�
		%>
				<br><br><br>
				<b><font size="6" color="gray">X-mall�� ���Ű� ȯ���մϴ�</font></b>
				<br><br><br>
		<%
			} else {
		%>
				<br><br><br>
				<%
					if (session.getAttribute("sessionID").toString().equals("-1")) {
				%>
					<b><font size=6 color="red">������ ���� ���� </font></b>
				<% } else { %>
					<font size=6 color="skyblue"><%=session.getAttribute("sessionID") %></font>
					<font size=6>�� ȯ���մϴ�.</font>
				<% }} %>
				
		<%
			OrderedbyDAO odao = OrderedbyDAO.getInstance();
			if (session.getAttribute("sessionID") != null && !session.getAttribute("sessionID").toString().equals("-1")) {
				int uid = Integer.parseInt(session.getAttribute("sessionID").toString());
				boolean isFirst = odao.isFirst(uid);
				if (isFirst == true) {
					CustomerDAO cdao = CustomerDAO.getInstance();
					CustomerBean cust = cdao.getUserInfo(session.getAttribute("sessionID").toString());
					ItemDAO idao = ItemDAO.getInstance();
					ItemBean result = idao.recommend(cust.getAddress());
		%>
			<b><font color="gray" size="6">ó�� �湮�� ������ ���� ��õ��ǰ</font></b>
			<table>
				<tr id = "title">
					<td>��ǰ��ȣ</td>
					<td>��ǰ�̸�</td>
					<td>��ǰ����</td>
				</tr>
				<tr id = "content" onclick = "changeForm(<%=result.getItem_id() %>)" style="cursor:pointer">
					<td><%=result.getItem_id() %></td>
					<td><%=result.getName() %></td>
					<td><%=result.getPrice() %>��</td>
				</tr>
			</table>
		<% }} %>
	</body>
</html>