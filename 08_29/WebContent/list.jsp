<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.ac.green.dto.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list.jsp</title>
</head>
<body>
	<a href="goInput.html">go input</a>
	<table>
		<tr>
			<th>number</th>
			<th>first</th>
			<th>second</th>
		</tr>		
	
<c:choose>
	<c:when test="${requestScope.list} == null || ${requestScope.list}.length == 0 ">
		<tr>
			<td colspan="3">no data</td>
		</tr>
	</c:when>
	<c:when test="true">
	<c:forEach items="${list}" var="d" >
		<tr onclick="getDummy(${d.number})">
			<td>${d.number}</td>
			<td>${d.first}</td>
			<td>${d.second}</td>
		</tr>		
	</c:forEach>		
	</c:when>
</c:choose>
		
		<tr>
			<td colspan="3">
			
			<c:forEach var="idx" begin="1" end="${pageCount}" step="1">
				<c:choose>
					<c:when test="${pageNum} == ${idx}">
						[${idx}]
					</c:when>
					<c:when test="true">					
						<a href="list.html?pageNum=${idx}">[${idx}]</a>
					</c:when>		
				</c:choose>	
			</c:forEach>			
			
			</td>
		</tr>

	</table>
	<script>
		function getDummy() {
			var number = arguments[0];
			location.href="showDummy.html?number=" + number;
		}
	</script>
</body>
</html>











