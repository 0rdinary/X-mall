<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "jsp.item.model.ItemBean" %>
<%@ page import = "jsp.item.model.ItemDAO" %>
<%@ page import = "jsp.producerlocation.model.ProducerlocationBean" %>
<%@ page import = "jsp.producerlocation.model.ProducerlocationDAO" %>
<%@ page import = "jsp.manage.model.ManageBean" %>
<%@ page import = "jsp.manage.model.ManageDAO" %>
<% 
	String itemId=request.getParameter("itemId");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>품목 정보</title>
		
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
				}
			}
		</script>
	</head>
	
	<body>
		<%
			// 번호에 맞는 상품을 찾아옴
			ItemDAO idao = ItemDAO.getInstance();
			ItemBean item = idao.getItem(Integer.parseInt(itemId));
			// 번호에 맞는 생산자를 찾아옴
			ProducerlocationDAO pdao = ProducerlocationDAO.getInstance();
			ProducerlocationBean pd = pdao.getItemToProducer(Integer.parseInt(itemId));
			// 번호에 맞는 아이템의 재고를 검색함
			ManageDAO mdao = ManageDAO.getInstance();
		%>
		<br><br>
		<b><font size="6" color="gray">상품 정보</font></b>
		<br><br>
		<table>
			<tr>
				<td id = "title">상품 번호</td>
				<td id = "content"><%=item.getItem_id() %></td>
			</tr>
			<tr>
				<td id = "title">상품 이름</td>
				<td id = "content"><%=item.getName() %></td>
			</tr>
			<tr>
				<td id = "title">가격</td>
				<td id = "content"><%=item.getPrice() %>원</td>
			</tr>
			<tr>
				<td id = "title">할인율</td>
				<td id = "content"><%=item.getDiscount_rate() %>%</td>
			</tr>
			<tr>
				<td id = "title">유통기한</td>
				<td id = "content">
					<%=item.getYear() %>년
					<%=item.getMonth() %>월
					<%=item.getDay() %>일
				</td>
			</tr>
			<tr>
				<td id = "title">평점</td>
				<td id = "content"><%=item.getRating() %></td>
			</tr>
			<tr>
				<td id = "title">생산자</td>
				<td id = "content"><%=pd.getProducer() %></td>
			</tr>
			<tr>
				<td id = "title">판매자</td>
				<td id = "content"><%=item.getImporter() %></td>
			</tr>
			<tr>
				<td id = "title">재고</td>
				<td id = "content"><%=mdao.getStock(Integer.parseInt(itemId)) %>개</td>
			</tr>
		</table>
		<input type="button" value="카테고리로" onclick="changeForm(-1)">
		<input type="button" value="장바구니에 담기" >
	</body>
</html>