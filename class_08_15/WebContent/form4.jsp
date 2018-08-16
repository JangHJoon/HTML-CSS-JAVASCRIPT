<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function chkFood() {
		var food = document.getElementsByName("food"); 
		
		var count = 0;
		// 고정길이가 아님.
		var foodList = [];
		for(var i=0; i<food.length; i++) {
			// checkbox, radio의 checked 속성은 true, false로
			// 리턴된다. 
			if(food[i].checked) {
				// 배열의 끝에 원소를 추가
				foodList.push(food[i].value);	
				// unshift(원소) : 배열의 처음에 원소를 추가
				// pop() : 마지막 원소 제거
				// shift() : 첫번째 원소 제거
			}
		}
		document.getElementById("foodList").innerHTML = 
			foodList.toString();
		/*
		var formObj = document.foodForm;
		formObj.action = "result.jsp";
		formObj.method = "post";
		formObj.submit();		
		*/
	}
</script>
</head>
<body>
	<div id="foodList"></div>
	<form name="foodForm">
		<input type="checkbox" name="food" value="pasta" 
		checked="checked"/>파스타
		<br>
		<input type="checkbox" name="food" value="pizza" />피자
		<br>
		<input type="checkbox" name="food" value="chicken" />치킨
		<br>
		<input type="checkbox" name="food" value="hamburger" />햄버거
		<br>
		<input type="checkbox" name="food" value="banana" />바나나
		<br>
		<input type="button" value="check" onclick="chkFood()" />
	</form>
</body>
</html>




