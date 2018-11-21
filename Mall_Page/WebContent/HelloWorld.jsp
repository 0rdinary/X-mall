<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	Statement stm = null;
	ResultSet rs = null;
	Class.forName("com.mysql.jdbc.Driver");
	String myUrl = "jdbc:mysql://localhost/market"; // 'market' is db name
	Connection conn = DriverManager.getConnection(myUrl, "team1", "comp322004");
	try {
		stm = conn.createStatement();
		if (stm.execute("select Name from ITEM")); {
			rs = stm.getResultSet();
			
			while (rs.next()) {
				out.println(rs.getString("Name"));
				out.write("<br>");
			}
			
			rs.close();
			stm.close();
		}
	} catch (Exception e) {
		out.println("rs.next() ERROR");
	}
	
	conn.close();
%>