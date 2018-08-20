<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="jspf/checkLogin.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>withdraw.jsp</title>
<link href="style/main.css" rel="stylesheet"/>
<script src="script/common.js"></script>
</head>
<body>
	<div id="titleBox">회원탈퇴</div>
	<div id="mainBox">
		<div id="innerText">정말 탈퇴하시겠습니까?</div>
		<form>
			<input type="button" value="탈퇴" onclick="doWhat(this.form, 'doWithdraw')"/>
			<input type="button" value="취소" onclick="doWhat(this.form, 'cancelWithdraw')"/>
			<input type="hidden" name="cmd" />
		</form>
	</div>
	<div id="msgBox"><%= request.getAttribute("msg") %></div>
</body>
</html>