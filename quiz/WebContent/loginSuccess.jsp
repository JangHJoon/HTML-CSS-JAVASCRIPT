<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" trimDirectiveWhitespaces="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login Success</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
	<script type="text/javascript" src="js/main.js" charset='utf-8'></script>
</head>
<body>
<%
	// �α��� ���ϰ� ������ ��
	if(session.getAttribute("userId") == null){
%>
<script>
		alert('�α��� �ϰ� ������');
		location.href="loginForm.jsp";
</script>		
<% 		
		//response.sendRedirect("loginForm.jsp");
		return;
	} 
	
	// �α׾ƿ� ���� ��
	String logout = request.getParameter("logout");
	if(logout != null){
		session.invalidate();
		response.sendRedirect("/quiz/loginForm.jsp");	
		return;
	}
		
	String id = (String)session.getAttribute("userId");
	
	
%>
	<p class="titleStr">
		Success!!
	</p>
	<form name="successForm">
		<div class="centerBox">	
			<div class="hello">
			<%= id %>�� ȯ���մϴ�.
			</div>		
			<div class="btns">
				<input type="button" value="��������" onclick="info()" />
				<input type="button" value="�α׾ƿ�" onclick="logout()" />
			</div>
		</div>
		<div class="msgBox">			
		</div>
		
	</form>	
</body>
</html>