<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>jstlEx.jsp</title>
</head>
<body>


	<c:set var="myNum" value="10" />
	<%=	pageContext.getAttribute("myNum")%>
<br />
	<c:if test="${ myNum > 3 }">
		myNum bigger than 3
	</c:if>
<br />
	<c:choose>
		<c:when test="${ myNum > 10 }">
		myNum > 10
		</c:when>
		<c:when test="${ myNum > 15 }">
		myNum > 15
		</c:when>
		<c:otherwise>
		myNum >= 10
		</c:otherwise>
	</c:choose>
<br />
	<c:forEach var="idx" begin="0" end="5" step="1">
		hello : ${ idx }
	</c:forEach>	
<br />	
	
	<%
	
		String[] arr = {"abc", "def" , "ghi"};
		request.setAttribute("arr", arr);
	
	%>
	
	<c:forEach items="${ arr }" var="str" varStatus="status">
		${ str } : ${ status.count } : ${ status.index }
		<br />
	</c:forEach>
	
	
	
</body>
</html>