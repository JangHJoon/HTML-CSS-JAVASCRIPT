<%@page import="kr.ac.green.dto.Post"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Post[] posts = (Post[]) request.getAttribute("posts");
%>
<table>
	<tr>
		<th>id</th>
		<th>title</th>
		<th>date</th>
		<th>ip</th>
	</tr>
	
	<%
		if(posts == null || posts.length == 0){			
	%>			
		<tr>
			<td colspan="4">no data</td>
		</tr>		
	<%	
		} else {	
			for(Post p : posts){
	%>
		<tr>
			<td><%= p.getP_id() %></td>
			<td><%= p.getP_title() %></td>
			<td><%= p.getP_date() %></td>
			<td><%= p.getP_ip() %></td>
		</tr>	
	<% 
			}
		}
	%>
</table>
	<input type="button" value="입력" onclick="location.href='goInsert.html'" />
</body>
</html>