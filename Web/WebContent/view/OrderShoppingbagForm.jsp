<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="jsp.customer.model.CustomerBean" %>
<%@ page import="jsp.customer.model.CustomerDAO" %>
<%@ page import="jsp.ordered_by.model.OrderedbyBean" %>
<%@ page import="jsp.ordered_by.model.OrderedbyDAO" %>
<%@ page import="java.util.Calendar" %>
    
<%
	String bagId = request.getParameter("bagId");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>장바구니 구매</title>
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
	</head>
	<body>
		<%
			// 유저의 지역을 알아옴
			CustomerDAO cdao = CustomerDAO.getInstance();
			CustomerBean custInfo = cdao.getUserInfo(session.getAttribute("sessionID").toString());
			// ORDERED_BY 테이블의 Is_Ordered를 true로 바꾸고 구매 날짜를 추가함
			OrderedbyBean order = new OrderedbyBean();
			order.setYear(Calendar.YEAR);
			order.setMonth(Calendar.MONTH);
			order.setDay(Calendar.DAY_OF_MONTH);
			OrderedbyDAO odao = OrderedbyDAO.getInstance();
			odao.updateOrder(order, Integer.parseInt(bagId), custInfo.getAddress());
		%>
		<br><br>
		<b><font color="gray" size="6"><%=bagId %> - 장바구니 구매가 완료되었습니다.</font></b>
		<br><br>
	</body>
</html>