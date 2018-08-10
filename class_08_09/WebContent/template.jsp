<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>template.jsp</title>
<style>	
	html {
		width: 100%;
		height: 100%;
	}
	body {
		width: 100%;
		height: 100%;
	}
	#whole {
		margin: 0 auto;		
		width: 80%;
		height: 80%;
	}
	#logo {
		width: 100%;
		height: 10%;
		text-align: center;		
	}
	#menu {
		float: left; 
		width: 30%;
		height: 80%;
		
	}	
	#content {
		float: right;
		width: 70%;
		height: 80%;
		text-align: center;
	}
	#footer {
		clear: both;
		width: 100%;
		height: 10%;
		text-align: center;
	}
	a {
		text-decoration: none;
	}
	a:hover {
		font-weight: bold;
	}
	ul {
		list-style: none;
	}
</style>
</head>
<%
	String menu = request.getParameter("menu");
	if(menu == null) {
		menu = "A";
	}
	String contentPage = "menu" + menu + ".jsp";
%>
<body>
	<div id="whole">
		<div id="logo">
			<jsp:include page="logo.jsp" />
		</div>
		<div id="menu">
			<jsp:include page="menu.jsp" />
		</div>
		<div id="content">
			<jsp:include page="<%= contentPage %>" />
		</div>
		<div id="footer">
			<jsp:include page="footer.jsp" />
		</div>
	</div>
</body>
</html>



































