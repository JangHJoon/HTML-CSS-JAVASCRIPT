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
	// 로그인 안하고 들어왔을 때
	if(session.getAttribute("userId") == null){
%>
<script>
		alert('로그인 하고 오세요');
		location.href="loginForm.jsp";
</script>		
<% 		
		//response.sendRedirect("loginForm.jsp");
		return;
	} 
	
	// 로그아웃 했을 때
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
			<%= id %>님 환영합니다.
			</div>		
			<div class="btns">
				<input type="button" value="정보보기" onclick="info()" />
				<input type="button" value="로그아웃" onclick="logout()" />
			</div>
		</div>
		<div class="msgBox">			
		</div>
		
	</form>	
</body>
</html>