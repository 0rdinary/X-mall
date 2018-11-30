<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "jsp.item.model.ItemDAO" %>
<%@ page import = "jsp.item.model.ItemBean" %>
<%@ page import = "jsp.category.model.CategoryDAO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%
	String categoryIdx=request.getParameter("categoryIdx");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>ǰ�� ����Ʈ</title>
		
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
					location.href = "MainForm.jsp?contentPage=view/CategoryForm.jsp";
				} else { // �ش���������� �̵��� �� �ְ� ��
					location.href = "MainForm.jsp?contentPage=view/ItemInfoForm.jsp?itemId=" + val;
				}
			}
		</script>
	</head>
	<body>
		<!-- ī�װ� �̸� ��� -->
		<br><br>
		<b>
			<font size="6" color="gray">
				<%
					int idx = Integer.parseInt(categoryIdx);
					CategoryDAO cdao = CategoryDAO.getInstance();
				
					if (idx < 11) { // �Һз����� ����
				%>
					<%=cdao.getCategoryName(idx) %>
				<% } else { // ��з��� ����ؾ��Ҷ�
						String large = "";
						switch (idx) {
							case 11 : large = "����/�߰�";
										break;
							case 12 : large = "ä��";
										break;
							case 13 : large = "����ǰ/����/�õ�/�����";
						}
				%>
					<%=large %>
				<% } %>
			</font>
		</b>
		<br><br>
		<%
			ItemDAO dao = ItemDAO.getInstance();
			List<ItemBean> itemList = new ArrayList<ItemBean>();
		
			if (idx < 11) {
				ItemBean dest = new ItemBean();
				dest.setCid(Integer.parseInt(categoryIdx));
				
				itemList = dao.getItemList(dest);
			} else {
				switch (idx) {
					case 11 : itemList = dao.getItemList(1, 2, 3);
								break;
					case 12 : itemList = dao.getItemList(4, 5, 6);
								break;
					case 13 : itemList = dao.getItemList(7, 8, 9);
				}
			}
		%>
	
		<br>
		<div id="board">
			<table>
				<tr id="title">
					<td>��ǰ ��ȣ</td>
					<td>��ǰ �̸�</td>
					<td>����</td>
					<td>�Ǹ���</td>
					<td>����</td>
				</tr>
				
				<!-- �ش� ����(ī�װ�)�� �´� �������� ������  -->
				<%
					int loopMax = itemList.size();
					for (int i = 0; i < loopMax; i++) {
				%>
					<!-- ����Ʈ�� ������ �ش��ϴ� �������� �̵��� �� �ְ� �� -->
					<tr id="content" onclick="changeForm(<%=itemList.get(i).getItem_id() %>)" style="cursor:pointer">
						<td><%=itemList.get(i).getItem_id() %></td>
						<td><%=itemList.get(i).getName() %></td>
						<td><%=itemList.get(i).getPrice() %>��</td>
						<td><%=itemList.get(i).getImporter() %></td>
						<td><%=itemList.get(i).getRating() %></td>
					</tr>
				<%	} %>
			</table>
			<br><br>
			<input type="button" value="ī�װ���" onclick="changeForm(-1)">
		</div>
	</body>
</html>