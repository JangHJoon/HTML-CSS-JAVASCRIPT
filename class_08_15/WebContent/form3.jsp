<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>form3.jsp</title>
<script>
	function chkForm() {
		// 폼은 배열로 취급될 수 있다.
		// 폼 태그 내부의 모든 요소를 원소로 가지는것이 아니다.
		// 입력에 관련된 태그만 원소로 가진다.
		var myForm = arguments[0];
		var ok = true;
		for(var i=0; ok && i<myForm.length; i++) {
			if(myForm[i].type != "button") {
				var inputValue = myForm[i].value.trim();
				if(inputValue.length == 0) {
					alert("입력누락 : " + myForm[i].title);
					myForm[i].focus();
					ok = false;
				}
			}
		}
		
		if(ok) {
			// 서브밋~
		}
	}
</script>
</head>
<body>
	<form>
		input1 <input type="text" name="input1" title="input1"/><br>
		input2 <input type="password" name="input2" title="input2"/><br>
		input3 <input type="text" name="input3" title="input3"/><br>
		input4 <input type="text" name="input4" title="input4"/><br>
		input5 <input type="text" name="input5" title="input5"/><br>
		input6 <input type="text" name="input6" title="input6"/><br>
		input7 <textarea name="input7" title="input7"></textarea><br>
		<input type="button" value="check" 
			onclick="chkForm(this.form)"/>
	</form>
</body>
</html>










