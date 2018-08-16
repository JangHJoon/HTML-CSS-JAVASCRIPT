<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>form.jsp</title>
<script>
	var tempNum = 10;
	function goNextPage(nextPage) {
		nextPage += ".jsp";
		// 페이지 이동
		location.href=nextPage;
	}
	function submitNextPage() {
		// 폼의 이름으로 접근1
		// var formObj = document.myForm;
		// 폼의 이름으로 접근2
		// var formObj = document.forms["myForm"];
		// 아이디로 접근
		var formObj = document.getElementById("myFormId");
		
		// formObj의 구성요소중 name이 inputA의 
		// value 값을 가져온다.
		var inputValue = formObj.inputA.value.trim();		
		if(inputValue) {			
			formObj.action = "a.jsp";
			formObj.method = "get";
			formObj.submit();	
		} else {
			alert("입력하세요~");			
		}
		
	}
</script>
</head>
<body>
	<a href="javascript:goNextPage('a')">click go A</a>
	<br>
	<a href="b.jsp">click go B</a>
	<br>
	<form id="myFormId" name="myForm">
		inputA <input type="text" name="inputA" />
		<br>
		inputB <input type="text" name="inputB" />
		<br>
		<input type="button" value="goA" 
				onclick="submitNextPage()" />
		<input type="button" value="goB" onclick="goNextPage('b')"/>
	</form>
</body>
</html>









