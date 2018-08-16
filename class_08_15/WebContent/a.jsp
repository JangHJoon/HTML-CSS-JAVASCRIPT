<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>a.jsp</title>
<script>	
	// var 키워드를 생략하면 전역변수가 된다.
	// 코드 관리가 어려워 지므로 반드시 var를 붙여서 사용한다.
	function init() {
		var num = 10;	
	}
	function add() {
		var num = 1;
		num++;
		alert(num);
	}
</script>
</head>
<body>
	<h1>a.jsp</h1>	
	<a href="javascript:init()">init</a>
	<br>
	<a href="javascript:add()">add</a>
</body>
</html>











