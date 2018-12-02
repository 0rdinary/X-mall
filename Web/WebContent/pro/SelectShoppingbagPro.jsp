<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "jsp.include.model.IncludeBean" %>
<%@ page import = "jsp.include.model.IncludeDAO" %>
<%@ page import = "java.util.StringTokenizer" %>
<%
	String word = request.getParameter("word");
	StringTokenizer st = new StringTokenizer(word);
	String bagId = st.nextToken();
	String itemId = st.nextToken();
	String count = st.nextToken();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>��ٱ��� �߰�</title>
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
					location.href="MainForm.jsp?contentPage=view/ShoppingbaglistForm.jsp"
				} 
			}
		</script>
	</head>
	<body>
		<%
			// ��Ŭ��忡 �߰��ϰ� ���ι� ������ �ٲ�
			IncludeDAO idao = IncludeDAO.getInstance();
			IncludeBean ib = null;
			ib = idao.getInclude(Integer.parseInt(bagId), Integer.parseInt(itemId));
			if (ib == null) {
				ib = new IncludeBean();
				ib.setBag_idx(Integer.parseInt(bagId));
				ib.setUser_id(Integer.parseInt(session.getAttribute("sessionID").toString()));
				ib.setItem_id(Integer.parseInt(itemId));
				ib.setStock(Integer.parseInt(count));
				
				idao.updateInclude(ib, 0, ib.getStock());
		%>
			<br><br>
			<b><font size="6" color="gray">��ٱ��ϰ� �߰��Ǿ����ϴ�</font></b>
			<br><br>
		<% } else { %>
			<br><br>
			<b><font size="6" color="gray">�̹� ��ٱ��Ͽ� ����ֽ��ϴ�</font></b>
			<br><br>
		<% } %>
		<input type="button" value="��ٱ��� Ȯ���ϱ�" onclick="changeForm(-1)">
	</body>
</html>