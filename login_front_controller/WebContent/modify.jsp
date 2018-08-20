<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="jspf/checkLogin.jspf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="style/main.css" rel="stylesheet"/>
<script src="script/common.js"></script>
</head>
<body>
	<div id="titleBox">정보수정</div>
	<div id="mainBox">
		<form method="post">
			<label for="uid">ID</label>
			<input type="text" name="uid" readonly="readonly" value="<%= user.getUid() %>" title="아이디"/>
			<br/>
			<label for="upw">Password</label>
			<input type="password" name="upw" title="비밀번호"/>
			<br/>
			<label for="retry">Retry</label>
			<input type="password" name="retry" title="비밀번호"/>
			<br/>
			<label for="nick">Nickname</label>
			<input type="text" name="nick" value="<%= user.getNick() %>" title="닉네임"/>
			<br/>
			<input type="button" value="수정" onclick="doWhat(this.form, 'doModify', true)"/>
			<input type="button" value="취소" onclick="doWhat(this.form, 'cancelModify')"/>	
			<input type="hidden" name="cmd" />	
		</form>
	</div>	
	<div id="msgBox"><%= request.getAttribute("msg") %></div>
</body>
</html>