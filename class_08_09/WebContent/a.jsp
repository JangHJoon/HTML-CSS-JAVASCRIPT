<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>a.jsp</title>
</head>
<body>
	<%
		// <jsp:param 의 인코딩 방식을 결정한다.
		// get, post와 상관없이 사용해라~
		request.setCharacterEncoding("euc-kr");
	
		String[] params = request.getParameterValues("addr");
	%>
	before addr : <%= Arrays.toString(params) %>
	<hr>
	<jsp:include page="b.jsp">
		<jsp:param name="addr" value="한글" />
	</jsp:include>
	<hr>
	<%
		params = request.getParameterValues("addr");
	%>
	after : addr : <%= Arrays.toString(params) %>
	<br>
	return Attribute : <%= request.getAttribute("returnAttr") %>
</body>
</html>




































