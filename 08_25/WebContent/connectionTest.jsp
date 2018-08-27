<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.ac.green.*" %>
<%

	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="item" class="kr.ac.green.dto.Item" />
<jsp:setProperty property="*" name="item"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>connectionTest.jsp</title>
</head>
<body>
<%
	ItemDao dao = ItemDao.getInstance();
	Connection con = dao.connect();
	log(String.valueOf(item.getItem_id()));
	log(item.getItem_name());
	log(String.valueOf(item.getItem_price()));
	
	int result = dao.insertItem(con, item);
	if(result == 1) {
%>
<h1>Insert 성공</h1>
<%
	response.sendRedirect("list.jsp");
	} else {
%>
<h1>Insert 실패</h1>
<%
	}
	dao.close(con);
%>
</body>
</html>












