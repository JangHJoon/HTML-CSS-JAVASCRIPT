<%@page import="kr.ac.green.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	String msg = "";
	
	String fail = request.getParameter("fail");
	
	User user = (User)request.getAttribute("user");
	if(user == null){
		user = new User("","","","");
	}
	
	if(fail != null){
		if(fail.equals("id")){
			// 아이디 존재
			msg = "아이디가 존재합니다.";	
		} else if(fail.equals("pw")){
			// 비밀번호 비 일치
			msg = "비밀번호가 일치하지 않습니다.";
		
		}
		
	}
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>join.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
	
	function goLogin() {
		location.href = "goLogin.do";		
	}
	
	function join() {
		var formObj = document.joinForm;
		if(chkBlank(formObj) && chkPw(formObj)){
			formObj.method = "post";
			formObj.action = "join.do";
			formObj.submit();
		}
	}
	
	function chkPw(){
		var formObj = arguments[0];
		var pass = true;
		if(formObj.u_pw == formObj.u_re){
			alert("비밀번호가 일치하지 않습니다.");
			pass = false;
		}		
		return pass;
	}
	
	function chkBlank(){
		var formObj = arguments[0];
		var pass = true;
		
		for(var i=0 ; pass && i<formObj.length ; i++){
			var field = formObj[i];	
			if(field.type != "button"){
				if(!field.value.trim()){
					var name = formObj[i].label.innerHtml;
					alert(name + "을 입력하세요!");
					pass = false;
				}
			}				
		}			
		return pass;
	}

</script>
</head>
<body>	
	<p class="titleStr">
		Join Member
	</p>
	<form name="joinForm">
		<div class="centerBox">
			<label for="u_id">ID :</label> <input type="text" name="u_id" value="<%= user.getId() %>" /><br/>
			<label for="u_pw">PW :</label> <input type="password" name="u_pw" value="<%= user.getId() %>" /><br/>
			<label for="u_re">Retry :</label> <input type="password" name="u_re" value="<%= user.getPw() %>" /><br/>
			<label for="u_name">Name :</label> <input type="text" name="u_name" value="<%= user.getName() %>" /><br/>
			<label for="u_nick">Nick :</label> <input type="text" name="u_nick" value="<%= user.getNick() %>" /><br/>				
			<div class="btns">
				<input type="button" value="회원가입" onclick="join()" />
				<input type="button" value="취소" onclick="goLogin()" />		
			</div>
		</div>
		<div class="msgBox" id="msg">
			<%= msg %>
		</div>	
	</form>	
</body>
</html>