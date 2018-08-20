<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="style/main.css" rel="stylesheet"/>
<script type="text/javascript" src="script/common.js"></script>
</head>
<body>
	<div id="titleBox">로그인</div>
	<div id="mainBox">
	<form>
		<label for="uid">ID</label>
		<input type="text" name="uid" title="아이디"/>
		<br/>
		<label for="upw">Password</label>
		<input type="password" name="upw" title="비밀번호"/>
		<br/>		
		<input type="button" value="로그인" onclick="doWhat(this.form, 'login', true)"/>
		<input type="button" value="회원가입" onclick="doWhat(this.form, 'goJoin')"/>	
		<input type="hidden" name="cmd" />	
	</form>
	</div>	
	<div id="msgBox"><%= request.getAttribute("msg") %></div>
</body>
</html>