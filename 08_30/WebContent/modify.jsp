<%@page import="kr.ac.green.dto.Post"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	Post post = (Post)request.getAttribute("post");
	if(post == null){
		//error
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function mod(){
		var formObj = document.modifyForm;
		formObj.method="post";
		formObj.action="modify2.html"
		formObj.submit();
	}
</script>
</head>
<body>
<h1>modify</h1>
<form name="modifyForm">
	id :<input type="text" name="p_id" value="${post.p_id}" readonly />
	<br />
	title : <input type="text" name="p_title" value="${post.p_title}" />
	<br />
	password : <input type="password" name="p_password" value="${post.p_password}" />
	<br />
	content : <textarea rows="5" cols="5" name="p_content">${post.p_content}</textarea>
	<br />
	<input type="button" value="수정" name="modify" onclick="mod()" />
	<input type="button" value="취소" name="delete" onclick="location.href='show.html?p_id=${post.p_id}'" />	
</form>
<div id="test"></div>

</body>
</html>