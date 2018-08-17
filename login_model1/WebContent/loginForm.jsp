<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String msg = (String)session.getAttribute("msg");
	// 사용자 관련 메서지를 세션에 저장함

	if(msg == null) {
		msg = "어서오세요";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<title>LoginForm</title>
	<link rel="stylesheet" type="text/css" href="css/loginForm.css">
	<script>
		function goJoin() {
			location.href="join.jsp";
		}
		
		function checkLogin() {
			var obj = document.loginForm;
			obj.action = "checkLogin.jsp";
			obj.method = "post";
			obj.submit();
		}
	</script>
</head>
<body>
	<p class="titleStr">
		Login
	</p>
	<form name="loginForm">
		<div class="centerBox">
			<label for="u_id">ID :</label> <input type="text" name="u_id" /><br/>
			<label for="u_pw">PW :</label> <input type="password" name="u_pw" /><br/>
			<div class="btns">
				<input type="button" value="로그인" onclick="checkLogin()"/>
				<input type="button" value="회원가입" onclick="goJoin()"/>
			</div>
		</div>
		<div class="msgBox">
			<%= msg %>
		</div>		
	</form>
</body>
</html>
<%@ include file="removeMessage.jspf" %>