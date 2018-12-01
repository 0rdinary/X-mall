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
		<title>��ٱ��� ����</title>
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
			// ������ ������ �˾ƿ�
			CustomerDAO cdao = CustomerDAO.getInstance();
			CustomerBean custInfo = cdao.getUserInfo(session.getAttribute("sessionID").toString());
			// ORDERED_BY ���̺��� Is_Ordered�� true�� �ٲٰ� ���� ��¥�� �߰���
			OrderedbyBean order = new OrderedbyBean();
			order.setYear(Calendar.YEAR);
			order.setMonth(Calendar.MONTH);
			order.setDay(Calendar.DAY_OF_MONTH);
			OrderedbyDAO odao = OrderedbyDAO.getInstance();
			odao.updateOrder(order, Integer.parseInt(bagId), custInfo.getAddress());
		%>
		<br><br>
		<b><font color="gray" size="6"><%=bagId %> - ��ٱ��� ���Ű� �Ϸ�Ǿ����ϴ�.</font></b>
		<br><br>
	</body>
</html>