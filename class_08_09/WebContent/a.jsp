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
		// <jsp:param �� ���ڵ� ����� �����Ѵ�.
		// get, post�� ������� ����ض�~
		request.setCharacterEncoding("euc-kr");
	
		String[] params = request.getParameterValues("addr");
	%>
	before addr : <%= Arrays.toString(params) %>
	<hr>
	<jsp:include page="b.jsp">
		<jsp:param name="addr" value="�ѱ�" />
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




































