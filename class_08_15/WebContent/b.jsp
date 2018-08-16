<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>b.jsp</title>
<script>
	/*
		형태가 서로다른경우 false
		숫자, 문자열 비교 시
		문자열 -> 숫자로 변환...
		변환이 불가능한 경우
		"" -> 0
		"apple" -> NaN(Not a Number) : false
	*/
	var num1 = 0;
	var num2 = "";
	alert(num1 == num2);
	/*
	// 수치인경우 0은 false, 그외는 true 
	var num = -1;
	// 문자열인 경우 빈문자열은 false, 그외는 true
	num = "a";
	if(num) {
		alert("true");
	} else {
		alert("false");
	}
	*/
</script>
</head>
<body>
	<h1>b.jsp</h1>
</body>
</html>