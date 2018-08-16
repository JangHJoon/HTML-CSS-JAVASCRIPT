<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!--  
	<meta http-equiv="refresh" content="0;url=http://localhost:8080/Study/jsp_filePath.jsp">
-->
<title>Insert title here</title>
</head>
<body>

<% 


	//response.setStatus(HttpServletResponse.SC_FOUND);	
	//response.setHeader("Location", "http://localhost:8080/Study/jsp_filePath.jsp");
	response.sendRedirect("http://localhost:8080/Study/jsp_filePath.jsp");


%>

</body>
</html>