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
		// �������̰� �ƴ�.
		var foodList = [];
		for(var i=0; i<food.length; i++) {
			// checkbox, radio�� checked �Ӽ��� true, false��
			// ���ϵȴ�. 
			if(food[i].checked) {
				// �迭�� ���� ���Ҹ� �߰�
				foodList.push(food[i].value);	
				// unshift(����) : �迭�� ó���� ���Ҹ� �߰�
				// pop() : ������ ���� ����
				// shift() : ù��° ���� ����
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
		checked="checked"/>�Ľ�Ÿ
		<br>
		<input type="checkbox" name="food" value="pizza" />����
		<br>
		<input type="checkbox" name="food" value="chicken" />ġŲ
		<br>
		<input type="checkbox" name="food" value="hamburger" />�ܹ���
		<br>
		<input type="checkbox" name="food" value="banana" />�ٳ���
		<br>
		<input type="button" value="check" onclick="chkFood()" />
	</form>
</body>
</html>




