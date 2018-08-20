<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	
	ServletContext application1 = request.getSession().getServletContext();
	ServletContext application2 = getServletConfig().getServletContext();
	ServletContext application3 = getServletContext();
 	ServletContext application4 = pageContext.getServletContext();
 	
 	out.println(application);
 	out.println(application == application1);
 	out.println(application == application2);
 	out.println(application == application3);
 	out.println(application == application4);
		

%>

</body>
</html>