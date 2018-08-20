<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.ac.green.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="style/main.css" rel="stylesheet"/>
<script src="script/common.js"></script>
</head>
<%
	User user = (User)request.getAttribute("user");
	if(user == null) user = new User("","","");
%>
<body>
	<div id="titleBox">ȸ������</div>
	<div id="mainBox">
		<form method="post">
			<label for="uid">ID</label>
			<input type="text" name="uid" title="���̵�" value="<%= user.getUid() %>"/>
			<br/>
			<label for="upw">Password</label>
			<input type="password" name="upw" title="�н�����" value="<%= user.getUpw() %>"/>
			<br/>
			<label for="retry">Retry</label>
			<input type="password" name="retry" title="�н�����" value="<%= user.getUpw() %>"/>
			<br/>
			<label for="nick">nickname</label>
			<input type="text" name="nick" title="�г���" value="<%= user.getNick() %>"/>
			<br/>
			<input type="button" value="����" onclick="doWhat(this.form, 'doJoin', true)"/>
			<input type="button" value="���" onclick="doWhat(this.form, 'cancelJoin')"/>	
			<input type="hidden" name="cmd" />	
		</form>
	</div>	
	<div id="msgBox"><%= request.getAttribute("msg") %></div>
</body>
</html>