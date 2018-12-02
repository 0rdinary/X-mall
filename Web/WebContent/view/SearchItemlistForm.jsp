<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "jsp.item.model.ItemDAO" %>
<%@ page import = "jsp.item.model.ItemBean" %>
<%@ page import = "jsp.category.model.CategoryDAO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.StringTokenizer" %>
<%
	request.setCharacterEncoding("euc-kr");
	String word=request.getParameter("word");
	StringTokenizer st = new StringTokenizer(word);
	String type = st.nextToken();
	String tt = st.nextToken();
	System.out.println(tt);
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
		<br><br>
		<b><font size="6" color="gray">��ǰ �˻�</font>
		</b>
		<br><br>
		<%
			ItemDAO dao = ItemDAO.getInstance();
			List<ItemBean> itemList = new ArrayList<ItemBean>();
			
			if (type.equals("iid")) {
				ItemBean ib = new ItemBean();
				ib = dao.getItem(Integer.parseInt(tt));
				itemList.add(ib);
			} else if (type.equals("name")) {
				itemList = dao.searchName(tt);
			} else if (type.equals("pd")) {
				itemList = dao.searchProducer(tt);
			} else if (type.equals("ip")) {
				itemList = dao.searchImporter(tt);
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