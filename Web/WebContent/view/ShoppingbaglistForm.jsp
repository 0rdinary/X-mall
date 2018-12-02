<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "jsp.shoppingbag.model.ShoppingbagBean" %>
<%@ page import = "jsp.shoppingbag.model.ShoppingbagDAO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>��ٱ��� ����</title>
		<style>
			table {
				margin-left:auto;
				margin-right:auto;
				width:600px;
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
					<% 
						ShoppingbagDAO ssdao = ShoppingbagDAO.getInstance();
						ssdao.insertShoppingbag(Integer.parseInt(session.getAttribute("sessionID").toString()));
					%>
					location.reload();
				} else { // �ش���ι����� ���� �̵��� �� �ְ� ��
					location.href = "MainForm.jsp?contentPage=view/ShoppingbagInfoForm.jsp?bagId=" + val;
				}
			}
		</script>
	</head>
	<body>
		<br><br>
		<b><font size="6" color="gray">��ٱ��� ����Ʈ</font></b>
		<br><br>
		
		<%
			// �������̵�� ��ġ�ϴ� ��ٱ��ϸ� ������
			List<ShoppingbagBean> list = new ArrayList<ShoppingbagBean>();
			ShoppingbagDAO sdao = ShoppingbagDAO.getInstance();
			
			list = sdao.getUnorderedShoppingbagList(Integer.parseInt(session.getAttribute("sessionID").toString()));
		%>
		<table>
			<tr id = "title">
				<td>��ٱ��� ��ȣ</td>
				<td>�Ѱ���</td>
				<td>��ٱ����̸�</td>
			</tr>
			<%
				int listSize = list.size();
				for (int i = 0; i < listSize; i++) {
			%>
				<tr id="content" onclick = "changeForm(<%=list.get(i).getBag_id() %>)" style="cursor:pointer">
					<td><%=list.get(i).getBag_id() %></td>
					<td><%=list.get(i).getTotal_price() %></td>
					<td><%=list.get(i).getBag_name()==null ? "��ٱ���"+list.get(i).getBag_id() : list.get(i).getBag_name() %></td>
				</tr>
			<%  } %>	
		</table>
		<input type="button" value="�߰��ϱ�" onclick = "changeForm(-1)">
	</body>
</html>