<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "jsp.include.model.IncludeDAO" %>
<%@ page import = "jsp.include.model.IncludeBean" %>
<%@ page import = "jsp.item.model.ItemBean" %>
<%@ page import = "jsp.item.model.ItemDAO" %>
<%@ page import = "jsp.manage.model.ManageBean" %>
<%@ page import = "jsp.manage.model.ManageDAO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
    
<%
	String bagId = request.getParameter("bagId");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>�ֹ� ����</title>
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
			#warn {
				background-color:red;
			}
		</style>
		<script type="text/javascript">
			function changeForm(val) {
				if (val == "-1") {
					location.href="MainForm.jsp?contentPage=view/HistoryListForm.jsp"
				} else {
					location.href = "MainForm.jsp?contentPage=view/OrderShoppingbagForm.jsp?bagId=" + val;
				}
			}
		</script>
	</head>
	<body>
		<%
			// ��ٱ��ϰ� �����ϰ� �ִ� �����۵��� ������
			IncludeDAO idao = IncludeDAO.getInstance();
			List<IncludeBean> ilist = new ArrayList<IncludeBean>();
			ilist = idao.getIncludeList(Integer.parseInt(bagId));
			
			// �ش��ϴ� ������ ����
			ItemDAO itdao = ItemDAO.getInstance();
			ManageDAO mdao = ManageDAO.getInstance();
		%>
		<br><br>
		<b><font size="6" color="gray"><%=bagId %> - ��ٱ��� ����</font></b>
		<br><br>
		<table>
			<tr id = "title">
				<td>��ǰ ��ȣ</td>
				<td>��ǰ �̸�</td>
				<td>����</td>
				<td>���</td>
				<td>�Ѱ���(��)</td>
			</tr>
			<%
				int listSize = ilist.size();
				int total = 0;
				for (int i = 0; i < listSize; i++) {
					int item_id = ilist.get(i).getItem_id();
					ItemBean item = itdao.getItem(item_id);
					String item_name = item.getName();
					int item_price = item.getPrice();
					int stock = ilist.get(i).getStock();
					int totalStock = mdao.getStock(item_id);
					total += item_price*stock;
			%>
					<tr id = "content">
						<td><%=item_id %></td>
						<td><%=item_name %></td>
						<td><%=item_price %></td>
						<td><%=stock %></td>
						<td><%=item_price * stock %></td>
					</tr>
			<%  } %>
			<tr id = "content">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><%=total %></td>
			</tr>
		</table>
		<input type="button" value="�ֹ���������" onclick = "changeForm(-1)" style="cursor:pointer">
	</body>
</html>