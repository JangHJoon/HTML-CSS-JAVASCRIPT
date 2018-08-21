<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String fail = request.getParameter("fail");
	String id = request.getParameter("id");
	String msg = "";
	if(id == null){
		id = "";
	}
	
	if(fail != null){
		if(fail.equals("id")){
			// 아이디 없음
			msg = "아이디가 없습니다.";
		}
		
		if(fail.equals("pw")){
			// 비밀번호 틀림
			msg = "비밀번호가 틀렸습니다.";
						
		}
	}
%>
<html>
<head>
	<title>LoginForm</title>
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script>
		function login(){
		
			var formObj = document.loginForm;
			if(chkBlank(formObj)){
				formObj.method = "post";
				formObj.action = "login.do";
				formObj.submit();
			} else {
							
			}			
		}	
		
		function chkBlank(){
			var formObj = arguments[0];
			for(var i=0 ; i<formObj.length ; i++){
			
				if(formObj[i].type != "button"){
					if(!formObj[i].value.trim())
						return false;
				}				
			}			
			return true;			
		}
		
		function goJoin(){
			location.href = "goJoin.do";
			
		}
	
	</script>
</head>


<body>
	<p class="titleStr">
		Login
	</p>
	<form name="loginForm">
		<div class="centerBox">
			<label for="u_id">ID :</label> <input type="text" name="u_id" value="<%= id %>" /><br/>
			<label for="u_pw">PW :</label> <input type="password" name="u_pw" /><br/>
			<div class="btns">
				<input type="button" value="로그인" onclick="login()" />
				<input type="button" value="회원가입" onclick="goJoin()" />
			</div>
		</div>
		<div class="msgBox">
			<%= msg %>
		</div>		
	</form>
</body>
</html>