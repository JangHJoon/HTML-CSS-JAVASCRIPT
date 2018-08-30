<%@page import="kr.ac.green.dto.Post"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	th{
		background: #F2CB61;
	}
</style>
</head>
<body>
<h1>list</h1>
<table>
	<tr>
		<th>id</th>
		<th>title</th>
		<th>date</th>
		<th>ip</th>
	</tr>
	<c:choose>
	<c:when test="${requestScope.posts} == null || ${requestScope.posts}.length == 0 ">
		<tr>
			<td colspan="4">no data</td>
		</tr>
	</c:when>
	<c:otherwise>
		<c:forEach items="${requestScope.posts}" var="p" >
			<tr onclick="location.href='show.html?p_id=${p.p_id}'">
				<td>${p.p_id}</td>
				<td>${p.p_title}</td>
				<td>${p.p_date}</td>
				<td>${p.p_ip}</td>
			</tr>		
		</c:forEach>		
	</c:otherwise>
</c:choose>
		
		<tr>
			<td colspan="4" align="center">
			
			<c:forEach var="idx" begin="1" end="${pageCount}" step="1">
				<c:choose>
					<c:when test="${pageNum} == ${idx}">
						[${idx}]
					</c:when>
					<c:when test="true">					
						<a href="goList.html?pageNum=${idx}">[${idx}]</a>
					</c:when>		
				</c:choose>	
			</c:forEach>			
			
			</td>
		</tr>
		
		<tr>
			<td colspan="4" align="right"><input type="button" value="입력" onclick="location.href='goInsert.html'" /></td>
		</tr>
</table>
</body>
</html>