<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>	
</style>
<script>
	function checkField() {	
		// arguments : 파라미터 담고 있는 배열
		// ex : arguments[1] -> 두번째 파라미터
		
		var formObj = arguments[0];	// 첫번째 파라미터
		
		var displayValue = 
			document.getElementById("messageBox").style.display;
		
		formObj.action = "b.jsp";
		if(displayValue == "none") {			
			formObj.submit();
		} else {
			alert("입력누락");
			return false;
		}
	}
	/*
		<input title="이름" type="text" name="input1" 
		onblur="lostFocus(this)"/>
	*/
	function lostFocus() {		
		var field = arguments[0];
		var msgBox = document.getElementById("messageBox");
		
		var msg = "<b>" + field.title + "</b> 빼먹었다~";
		var displayAttr = "block";
		if(field.value.trim()) {
			msg = "잘했어~";
			displayAttr = "none";
		}
		msgBox.innerHTML = msg;
		msgBox.style.display = displayAttr;
	}
</script>
</head>
<body>
	<!-- 
		onsubmit의 경우 return false인 경우 submit이 중지된다.  
		단순히 onsubmit에서 지정한 함수가 false를 리턴한다고
		중지되지 않으므로 주의할 것!
	-->
	<form onsubmit="return checkField(this)">
		<input title="이름" type="text" name="input1" 
			onblur="lostFocus(this)"/>
		<input title="나이" type="text" name="input2" 
			onblur="lostFocus(this)"/>
		<input type="submit" value="click" />
	</form>
	<div id="messageBox">
		전부 입력해라~
	</div>
</body>
</html>









