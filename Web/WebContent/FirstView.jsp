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
				} else { // 해당아이템으로 이동할 수 있게 함
					location.href = "MainForm.jsp?contentPage=view/ItemInfoForm.jsp?itemId=" + val;
				}
			}
		</script>
	</head>
	<body>
		<%
			if (session.getAttribute("sessionID") == null) {	// 로그인이 안되었다면
		%>
				<br><br><br>
				<b><font size="6" color="gray">X-mall에 오신걸 환영합니다</font></b>
				<br><br><br>
		<%
			} else {
		%>
				<br><br><br>
				<%
					if (session.getAttribute("sessionID").toString().equals("-1")) {
				%>
					<b><font size=6 color="red">관리자 계정 접속 </font></b>
				<% } else { %>
					<font size=6 color="skyblue"><%=session.getAttribute("sessionID") %></font>
					<font size=6>님 환영합니다.</font>
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
			<b><font color="gray" size="6">처음 방문한 고객님을 위한 추천상품</font></b>
			<table>
				<tr id = "title">
					<td>상품번호</td>
					<td>상품이름</td>
					<td>상품가격</td>
				</tr>
				<tr id = "content" onclick = "changeForm(<%=result.getItem_id() %>)" style="cursor:pointer">
					<td><%=result.getItem_id() %></td>
					<td><%=result.getName() %></td>
					<td><%=result.getPrice() %>원</td>
				</tr>
			</table>
		<% }} %>
	</body>
</html>