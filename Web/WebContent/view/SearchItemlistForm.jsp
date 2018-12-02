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
					location.href = "MainForm.jsp?contentPage=view/ItemInfoForm.jsp?itemId=" + val;
				}
			}
		</script>
	</head>
	<body>
		<br><br>
		<b><font size="6" color="gray">상품 검색</font>
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