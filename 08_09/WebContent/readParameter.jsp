<%@page import="org.apache.jasper.runtime.JspRuntimeLibrary"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page errorPage="/error/viewErrorMessage.jsp" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>파라미터 출력</title>
</head>
<body>


<%@ include file="/error/viewErrorMessage.jsp"  %>

<jsp:include page="/error/viewErrorMessage.jsp">
	<jsp:param value="param1" name="1"/>
	<jsp:param value="param2" name="2"/>
</jsp:include>

<% 


JspWriter testOut = out;

out.println(testOut == out);





try{
	
	
%>

	name 파라미터 값 : <%= request.getParameter("name").toUpperCase() %>
<% }
catch(Exception e) {
	out.println("error");
}
%>



</body>
</html>