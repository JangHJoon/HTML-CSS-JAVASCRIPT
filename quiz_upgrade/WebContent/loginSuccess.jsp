<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id =(String)session.getAttribute("id");
	if(id == null){
		// �߸��� ����
	}
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login Success</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
	function info(){	
		var formObj = document.successForm;	
		formObj.action = "goInfo.do";
		formObj.submit();
	}
	
	function logout(){
		var formObj = document.successForm;	
		formObj.action = "logout.do";
		formObj.submit();
				
	}	
</script>
</head>
<body>
	<p class="titleStr">
		Success!!
	</p>
	<form name="successForm">
		<div class="centerBox">				
			<div class="btns">
				<input type="button" value="��������" onclick="info()" />
				<input type="button" value="�α׾ƿ�" onclick="logout()" />
			</div>
		</div>
		<div class="msgBox">
			
		</div>
		
	</form>	
</body>
</html>