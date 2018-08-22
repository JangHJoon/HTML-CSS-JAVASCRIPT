<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    
	String menu = request.getParameter("menu");
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>main.jsp</title>
	<style>
	html{
		width: 100%;
		height: 100%;
	}
	
	body{
		width: 100%;
		height: 100%;
	}
	
	#whole{
		width: 100%;
		height: 100px;
		background:#fff000;
	}
	
	#top{
	margin: 0 auto;
		width: 	100%;
		height: 100%;
	}
	
	#left{
		float: left;
		width: 30%;
		height: 80%;
	}
	
	#right_top{
		float: right;
		width: 70%;
		height: 80%;
	}
	</style>
</head>

<body>

<div id="whole">
	<div id="top">
	<jsp:include page="title.jsp" />
	</div>
<%
%>	
	<div id="left">
	<jsp:include page="menu.jsp" />
	</div>
	
	<div id="right_top">
	<jsp:include page="search.jsp" />
	</div>

<%
%>	
	<div id="right_bottom">
	<jsp:include page="studentList.jsp" />
	</div> 
</div>


</body>
</html>