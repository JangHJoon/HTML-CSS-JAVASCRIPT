<%@page import="kr.ac.green.dto.Item"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.ac.green.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table>

<tr>
	<th>id</th>
	<th>name</th>
	<th>price</th>
</tr>
<%


	ItemDao dao = ItemDao.getInstance();
	Connection con = dao.connect();
	Item[] list = dao.getAll(con);
	for(Item temp : list){

%>
<tr onclick="document.location ='/goModify.do';">
	<td><%= temp.getItem_id() %></td>
	<td><%= temp.getItem_name() %></td>
	<td><%= temp.getItem_price() %></td>
</tr>

<%

	}
	
	dao.close(con);

%>

</table>
</body>
</html>