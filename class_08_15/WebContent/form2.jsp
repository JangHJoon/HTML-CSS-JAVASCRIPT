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
		// arguments : �Ķ���� ��� �ִ� �迭
		// ex : arguments[1] -> �ι�° �Ķ����
		
		var formObj = arguments[0];	// ù��° �Ķ����
		
		var displayValue = 
			document.getElementById("messageBox").style.display;
		
		formObj.action = "b.jsp";
		if(displayValue == "none") {			
			formObj.submit();
		} else {
			alert("�Է´���");
			return false;
		}
	}
	/*
		<input title="�̸�" type="text" name="input1" 
		onblur="lostFocus(this)"/>
	*/
	function lostFocus() {		
		var field = arguments[0];
		var msgBox = document.getElementById("messageBox");
		
		var msg = "<b>" + field.title + "</b> ���Ծ���~";
		var displayAttr = "block";
		if(field.value.trim()) {
			msg = "���߾�~";
			displayAttr = "none";
		}
		msgBox.innerHTML = msg;
		msgBox.style.display = displayAttr;
	}
</script>
</head>
<body>
	<!-- 
		onsubmit�� ��� return false�� ��� submit�� �����ȴ�.  
		�ܼ��� onsubmit���� ������ �Լ��� false�� �����Ѵٰ�
		�������� �����Ƿ� ������ ��!
	-->
	<form onsubmit="return checkField(this)">
		<input title="�̸�" type="text" name="input1" 
			onblur="lostFocus(this)"/>
		<input title="����" type="text" name="input2" 
			onblur="lostFocus(this)"/>
		<input type="submit" value="click" />
	</form>
	<div id="messageBox">
		���� �Է��ض�~
	</div>
</body>
</html>









