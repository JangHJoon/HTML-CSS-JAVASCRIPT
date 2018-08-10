<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>layout.jsp</title>
<style type="text/css">
body{
	margin: 100px;

}
#top{
	background-color: white;
	display: block;
	padding: 20px;
}

#menu_bar ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

#menu_bar li {
    float: left;
}

#menu_bar li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

/* Change the link color to #111 (black) on hover */
#menu_bar li a:hover {
    background-color: #111;
}



#left_content{
	
	display: block;
	height: 100%;
}

#right_content{
	background-color: white;
	display: inline;
	height: 100%;
}

#bottom{
	display: block;
}



</style>

</head>
<body>
<%

	String movie_name = request.getParameter("movie_name");
	if(movie_name == null){
		movie_name = "god2";
	}	
	String topPage = movie_name +".jsp";
	
	String info = request.getParameter("menu");
	if(info == null){
		info = "info";
	}
	
	String rightPage = null;
	String leftPage = null;
	if(info.equals("guest")){
		leftPage = "empty.jsp";
		rightPage = "guest.jsp";
	} else if(info.equals("info")){
		
		leftPage = "infoTap.jsp";
		rightPage = request.getParameter("tap");
		if(rightPage == null){
			rightPage = "summary.jsp";
		} else {
			rightPage += ".jsp";
			
		}
		
		
		
	} else if(info.equals("actors")){
		rightPage = info + ".jsp";
		leftPage = "empty.jsp";
	} else if(info.equals("chat")){
		rightPage = info + ".jsp";
		leftPage = "empty.jsp";
	} 
	log("rightPage :" + rightPage);
		
	String url = request.getScheme() + "://" 
			+ request.getServerName() + ":"
			+ request.getServerPort() 
			+ request.getRequestURI() 
			+ ((request.getQueryString()==null)?"": "?" + request.getQueryString());
	
	
	out.println(url);
	
%>

<div id="top">
<jsp:include page="<%= topPage %>" />
</div>

<div id="menu_bar">
<ul>
	<li id="info"><a href="layout.jsp?menu=info">정보</a></li>
	<li id="actor"><a href="layout.jsp?menu=actors">배우</a></li>
	<li id="guest"><a href="layout.jsp?menu=guest">방명록</a></li>
	<li id="chat"><a href="layout.jsp?menu=chat">채팅</a></li>
</ul>
</div>

<div id="left_content">
<jsp:include page="<%= leftPage %>" />
</div>

<div id="right_content">

<jsp:include page="<%= rightPage %>" />

</div>

<div id="bottom">
<jsp:include page="bottom.jsp" />
</div>

	


</body>
</html>