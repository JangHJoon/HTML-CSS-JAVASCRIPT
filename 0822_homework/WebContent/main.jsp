<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    
	String rightPage = "studentList.jsp";
	String menu = request.getParameter("menu");
	
	if(menu == null){
		menu = "list";
	}
	
	
	
	if(menu.equals("list")){
		rightPage="studentList.jsp";
	} else if(menu.equals("insert")){
		rightPage="insert.jsp";
	} else if(menu.equals("modify")){
		rightPage="modify.jsp";
	} else if(menu.equals("delete")){
		rightPage="delete.jsp";
	} 

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>main.jsp</title>
	<style>
	ul { list-style-type: none }
	a:link, a:visited {
    background-color: #555555;
    color: white;
    padding: 14px 25px;
    text-align: center; 
    text-decoration: none;
    display: inline-block;
}

a:hover, a:active {
    background-color: #888888;
}
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
	
		width: 	100%;
		height: 100%;
	}
	
	#left{
		float: left;
		width: 30%;
		height: 100%;
	}
	
	#right_top{
		float: right;
		width: 70%;
		height: 30%;
	}
	
	#right_bottom{
		float: right;
		width: 70%;
		height: 70%;
	}
	</style>
</head>

<body>

<div id="whole">
	<div id="top">
		<jsp:include page="title.jsp" />
	</div>

	<div id="left">
		<jsp:include page="menu.jsp" />
	</div>
	
	<div id="right_top">
<%
	if(!menu.equals("insert")){
%>
		<jsp:include page="search.jsp" />
<%
	}	
%>
	</div>
<%

%>	
	<div id="right_bottom">
	<jsp:include page="<%= rightPage %>" />
	</div> 
</div>


</body>
</html>