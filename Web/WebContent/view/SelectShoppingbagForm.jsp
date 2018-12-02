<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "jsp.shoppingbag.model.ShoppingbagBean" %>
<%@ page import = "jsp.shoppingbag.model.ShoppingbagDAO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.StringTokenizer" %>
<%
	String word = request.getParameter("word");
	StringTokenizer st = new StringTokenizer(word);
	String itemId = st.nextToken();
	String count = st.nextToken();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>장바구니 정보</title>
		<% boolean first = true; %>
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
				var itemId = <%=itemId %>;
				var count = <%=count %>;
				location.href = "MainForm.jsp?contentPage=pro/SelectShoppingbagPro.jsp?word=" + val + "+" + itemId + "+" + count;
			}
		</script>
	</head>
	<body>
		<br><br>
		<b><font size="6" color="gray">장바구니 선택</font></b>
		<br><br>
		
		<%
			// 유저아이디와 일치하는 장바구니를 가져옴
			List<ShoppingbagBean> list = new ArrayList<ShoppingbagBean>();
			ShoppingbagDAO sdao = ShoppingbagDAO.getInstance();
			
			list = sdao.getUnorderedShoppingbagList(Integer.parseInt(session.getAttribute("sessionID").toString()));
		%>
		<table>
			<tr id = "title">
				<td>장바구니 번호</td>
				<td>총가격</td>
				<td>장바구니이름</td>
			</tr>
			<%
				int listSize = list.size();
				for (int i = 0; i < listSize; i++) {
			%>
				<tr id="content" onclick = "changeForm(<%=list.get(i).getBag_id() %>)" style="cursor:pointer">
					<td><%=list.get(i).getBag_id() %></td>
					<td><%=list.get(i).getTotal_price() %></td>
					<td><%=list.get(i).getBag_name()==null ? "장바구니"+list.get(i).getBag_id() : list.get(i).getBag_name() %></td>
				</tr>
			<%  } %>	
		</table>
	</body>
</html>