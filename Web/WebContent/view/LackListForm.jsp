<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "jsp.item.model.ItemDAO" %>
<%@ page import = "jsp.item.model.ItemBean" %>
<%@ page import = "jsp.item.model.LackItemBean" %>
<%@ page import = "jsp.category.model.CategoryDAO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.StringTokenizer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>품목 리스트</title>
		
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
					location.href = "MainForm.jsp?contentPage=view/AdminItemForm.jsp?itemId=" + val;
				}
			}
		</script>
	</head>
	<body>
		<br><br>
		<b><font size="6" color="gray">재고가 부족한 품목</font>
		</b>
		<br><br>
		<%
			ItemDAO dao = ItemDAO.getInstance();
			List<LackItemBean> itemList = new ArrayList<LackItemBean>();
			
			itemList = dao.getLackItemList();
		%>
	
		<br>
		<div id="board">
			<table>
				<tr id="title">
					<td>상품 번호</td>
					<td>상품 이름</td>
					<td>부족한 갯수</td>
				</tr>
				
				<%
					int loopMax = itemList.size();
					for (int i = 0; i < loopMax; i++) {
				%>
					<!-- 리스트를 누르면 해당하는 페이지로 이동할 수 있게 함 -->
					<tr id="content" onclick="changeForm(<%=itemList.get(i).getItem_id() %>)" style="cursor:pointer">
						<td><%=itemList.get(i).getItem_id() %></td>
						<td><%=itemList.get(i).getName() %></td>
						<td><%=itemList.get(i).getLack() %></td>
					</tr>
				<%	} %>
			</table>
			<br><br>
			<input type="button" value="카테고리로" onclick="changeForm(-1)">
		</div>
	</body>
</html>