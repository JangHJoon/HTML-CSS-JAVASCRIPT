<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	//jsp의 디렉티브의 줄바꿈 공백 문자 처리
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Calendar 클래스 사용</title>
</head>
<body>
	<%
		Calendar cal = Calendar.getInstance();
	%>
	오늘은
	<%=cal.get(Calendar.YEAR)%>년
	<%=cal.get(Calendar.MONTH)%>월
	<%=cal.get(Calendar.DATE)%>일 입니다.

</body>
</html>