<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Vector" %>
<%@ page import="kr.ac.green.Product" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list.jsp</title>
</head>
<body>
	<a href="goInput.do">��ǰ���</a>
	<hr>
	<table>
		<tr>
			<th>��ǰ��</th>
			<th>����</th>
		</tr>
		<%
			Vector<Product> list = 
				(Vector<Product>)request.getAttribute("list");
			if(list == null || list.size() == 0) {
		%>
		<tr>
			<td colspan="2">��ϵ� ��ǰ�� �����ϴ�.</td>
		</tr>	
		<%
			} else {
				for(Product p : list) {
		%>
		<tr>
			<td><%= p.getName() %></td>
			<td><%= p.getPrice() %></td>
		</tr>
		<%
				}
			}
		%>
	</table>
</body>
</html>






