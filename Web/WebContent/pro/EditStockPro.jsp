<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.StringTokenizer" %>
<%@ page import = "jsp.manage.model.ManageDAO" %>
<%
	String word = request.getParameter("word");
	StringTokenizer st = new StringTokenizer(word);
	String sid = st.nextToken();
	String iid = st.nextToken();
	String stock = st.nextToken();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>��� ����</title>
		<script type="text/javascript">
		function changeForm(val) {
				if (val == "-1") {
					location.href = "MainForm.jsp?contentPage=view/CategoryForm.jsp";
				} else if (val == "-2") {
					var ii = <%= iid %>
					location.href = "MainForm.jsp?contentPage=view/AdminItemForm.jsp?itemId=" + ii;
				}
			}
		</script>
	</head>
	
	<body>
		<%
			ManageDAO mdao = ManageDAO.getInstance();
			mdao.updateStock(Integer.parseInt(sid), Integer.parseInt(iid), Integer.parseInt(stock));
		%>
	
		<br><br>
		<b><font size = "6" color="gray">��� �����Ǿ����ϴ�</font></b>
		<br><br>
		
		<input type = "button" value="ī�װ���" onclick="changeForm(-1)">
		<input type = "button" value="��ǰ����" onclick="changeForm(-2)">
	</body>
</html>