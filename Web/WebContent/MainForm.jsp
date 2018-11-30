<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	String contentPage=request.getParameter("contentPage");
	if (contentPage == null){
		contentPage="FirstView.jsp";
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>X-mall</title>
		
		<style>
			#wrap {
				width: 800px;
				margin: 0 auto 0 auto;
			}
			
			#header {
				text-align: center;
				width: 800px;
				heigth: 150px;
				background-color: #92FFFF;
				padding: 60px 0px;
			}
			
			#main {
				float: left;
				width: 800px;
				height: 1000px;
				background-color: #FFCA6C;
				text-align: center;
				vertical-align: middle;
			}
			
			#footer {
				clear: left;
				width: 800px;
				height: 60px;
				text-align: center;
				background-color: #7DFE74;
			}
		</style>
		
	</head>
	<body>
		<div id="wrap">
			<div id="header">
				<jsp:include page="Header.jsp" />
			</div>
			<div id="main">
				<jsp:include page="<%=contentPage%>" />
			</div>
			<div id="footer"> X-mall by team1 </div>
		</div>
	</body>
</html>