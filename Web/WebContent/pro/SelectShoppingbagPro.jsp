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
		<title>장바구니 추가</title>
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
			// 인클루드에 추가하고 쇼핑백 정보도 바꿈
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
			<b><font size="6" color="gray">장바구니가 추가되었습니다</font></b>
			<br><br>
		<% } else { %>
			<br><br>
			<b><font size="6" color="gray">이미 장바구니에 들어있습니다</font></b>
			<br><br>
		<% } %>
		<input type="button" value="장바구니 확인하기" onclick="changeForm(-1)">
	</body>
</html>