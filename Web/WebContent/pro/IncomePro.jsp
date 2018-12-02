<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.Calendar" %>
<%@ page import = "java.util.StringTokenizer" %>
<%@ page import = "jsp.ordered_by.model.OrderedbyDAO" %>
<%
	String word = request.getParameter("word");
	StringTokenizer st = new StringTokenizer(word);
	int fYear = Integer.parseInt(st.nextToken());
	int fMonth = Integer.parseInt(st.nextToken());
	int fDay = Integer.parseInt(st.nextToken());
	int tYear = Integer.parseInt(st.nextToken());
	int tMonth = Integer.parseInt(st.nextToken());
	int tDay = Integer.parseInt(st.nextToken());
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>매출 확인하기</title>
	</head>
	<body>
		<br><br>
		<% if (fYear != 0) { %>
			<b><font color="gray" size="4"><%=fYear %>년</font></b>
		<% } if (fMonth != 0) { %>
			<b><font color="gray" size="4"><%=fMonth %>월</font></b>
		<% } if (fDay != 0) { %>
			<b><font color="gray" size="4"><%=fDay %>일</font></b>
		<% } if (fYear != 0 || fMonth != 0 || fDay != 0) {%>
			<b><font color="gray" size="4"> 부터 </font></b>
		<% } %>
		<% if (tYear != 0) { %>
			<b><font color="gray" size="4"><%=tYear %>년</font></b>
		<% } if (tMonth != 0) { %>
			<b><font color="gray" size="4"><%=tMonth %>월</font></b>
		<% } if (tDay != 0) { %>
			<b><font color="gray" size="4"><%=tDay %>일</font></b>
		<% } if (tYear != 0 || tMonth != 0 || tDay != 0) { %>
			<b><font color="gray" size="4"> 까지 </font></b>
		<% } %>
		<b><font color="gray" size="4"> 매출 </font></b>
		<br><br>
		<%
			if (fYear == 0) {
				fYear = 1;
				fMonth = 1;
				fDay = 1;
			} else if (fMonth == 0) {
				fMonth = 1;
				fDay = 1;
			} else if (fDay == 0) {
				fDay = 1;
			}
		
			if (tYear == 0) {
				tYear = 9999;
				tMonth = 12;
				tDay = 31;
			} else if (tMonth == 0){
				tMonth = 12;
				tDay = 31;
			} else if (tDay == 0) {
				switch (tMonth) {
				case 1:
				case 3:
				case 5:
				case 7:
				case 8:
				case 10:
				case 12: tDay = 31;
						break;
				case 2: tDay = 28;
						break;
				case 4:
				case 6:
				case 9:
				case 11: tDay = 30;
				}
			}
		
			OrderedbyDAO odao = OrderedbyDAO.getInstance();
			Calendar cal = Calendar.getInstance();
			cal.set(fYear, fMonth-1, fDay);

			java.util.Date date = cal.getTime(); 
			Date from = new Date(date.getTime());
			
			cal.set(tYear, tMonth-1, tDay);
			java.util.Date dat = cal.getTime();
			Date to = new Date(dat.getTime());
			
			int income = odao.getIncome(from, to);
		%>
		<b><font color="gray" size="6"><%=income %>원</font></b>
	</body>
</html>