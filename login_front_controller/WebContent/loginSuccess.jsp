<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="jspf/checkLogin.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>loginSuccess.jsp</title>
<link href="style/main.css" rel="stylesheet" />
<script src="script/common.js"></script>
</head>
<body>
	<div id="titleBox">로그인성공</div>
	<div id="mainBox">
	<form>
		<input type="button" value="회원정보수정" onclick="doWhat(this.form, 'goModify')"/>
		<input type="button" value="로그아웃" onclick="doWhat(this.form, 'logout')"/>
		<input type="button" value="회원탈퇴" onclick="doWhat(this.form, 'goWithdraw')"/>
		<input type="hidden" name="cmd" />
	</form>
	</div>
	<div id="msgBox"><%= request.getAttribute("msg") %></div>
</body>
</html>