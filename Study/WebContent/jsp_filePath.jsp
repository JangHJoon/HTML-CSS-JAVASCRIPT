<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%

// server -> right click 
// add and remove 
// remove all 
// finish

<%
	request.getRequestDispatcher("url").forward(request, response);
%>
<jsp:forward page="url" />

// close and server f3
// server location tap enable
// set server folder
	File file = new File("");
	out.println(file.getCanonicalPath());
	out.println("<br>=====================<br>");
	
	
	out.println(application.getRealPath(""));
	out.println("<br>=====================<br>");
	
	String filePath = request.getSession().getServletContext().getRealPath("");
	
	out.println(filePath);
	out.println("<br>=====================<br>");


%>

</body>
</html>