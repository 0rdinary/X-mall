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
		<title>재고 수정</title>
		<script type="text/javascript">
		function changeForm(val) {
				if (val == "-1") {
					location.href = "MainForm.jsp?contentPage=view/CategoryForm.jsp";
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
		<b><font size = "6" color="gray">재고가 수정되었습니다</font></b>
		<br><br>
		
		<input type = "button" value="카테고리로" onclick="changeForm(-1)">
	</body>
</html>