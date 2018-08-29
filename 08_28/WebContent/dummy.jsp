<%@page import="kr.ac.green.dto.Dummy"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%
	Dummy dummy = (Dummy) request.getAttribute("dummy");

	
%>
<body>
 <form action="delete.html" method="post">
	 number : <input type="text" name="number" value="<%=dummy.getNumber() %>" />
	 <br />
	 first : <input type="text" name="first" value="<%=dummy.getFirst()%>" />
	 <br />
	 second : <input type="text" name="second" value="<%=dummy.getSecond() %>" />
	 <br />
	 <input type="submit" value="delete" />
	 <input type="button" value="modify" />
 
 </form>
</body>
</html>