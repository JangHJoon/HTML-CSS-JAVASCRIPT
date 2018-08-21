<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>input.jsp</title>
<script>
	function cancelInput() {
		var formObj = document.getElementById("inputForm");
		formObj.action = "cancelInput.do";		
		formObj.method = "get";
		formObj.submit();
	}
	function doInput() {
		var formObj = document.getElementById("inputForm");
		// 공백검사
		formObj.action = "input.do";
		formObj.method = "post";		
		formObj.submit();
	}
</script>
</head>
<body>
	<form id="inputForm">
		제품명 <input type="text" name="name" />
		<br>
		가격 <input type="text" name="price" />
		<br>
		<input type="button" value="입력" onclick="doInput()"/>
		<input type="button" value="취소" onclick="cancelInput()"/>
		
	</form>
</body>
</html>




























