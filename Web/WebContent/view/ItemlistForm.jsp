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
		<title>품목 리스트</title>
		
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
				} else { // 해당아이템으로 이동할 수 있게 함
					location.href = "MainForm.jsp?contentPage=view/ItemInfoForm.jsp?itemId=" + val;
				}
			}
		</script>
	</head>
	<body>
		<!-- 카테고리 이름 출력 -->
		<br><br>
		<b>
			<font size="6" color="gray">
				<%
					int idx = Integer.parseInt(categoryIdx);
					CategoryDAO cdao = CategoryDAO.getInstance();
				
					if (idx < 11) { // 소분류내에 들어가면
				%>
					<%=cdao.getCategoryName(idx) %>
				<% } else { // 대분류를 출력해야할때
						String large = "";
						switch (idx) {
							case 11 : large = "과일/견과";
										break;
							case 12 : large = "채소";
										break;
							case 13 : large = "유제품/냉장/냉동/간편식";
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
					<td>상품 번호</td>
					<td>상품 이름</td>
					<td>가격</td>
					<td>판매자</td>
					<td>평점</td>
				</tr>
				
				<!-- 해당 설정(카테고리)에 맞는 아이템을 보여줌  -->
				<%
					int loopMax = itemList.size();
					for (int i = 0; i < loopMax; i++) {
				%>
					<!-- 리스트를 누르면 해당하는 페이지로 이동할 수 있게 함 -->
					<tr id="content" onclick="changeForm(<%=itemList.get(i).getItem_id() %>)" style="cursor:pointer">
						<td><%=itemList.get(i).getItem_id() %></td>
						<td><%=itemList.get(i).getName() %></td>
						<td><%=itemList.get(i).getPrice() %>원</td>
						<td><%=itemList.get(i).getImporter() %></td>
						<td><%=itemList.get(i).getRating() %></td>
					</tr>
				<%	} %>
			</table>
			<br><br>
			<input type="button" value="카테고리로" onclick="changeForm(-1)">
		</div>
	</body>
</html>