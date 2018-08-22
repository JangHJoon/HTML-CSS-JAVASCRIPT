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
			// ���̵� ����
			msg = "���̵� �����մϴ�.";	
		} else if(fail.equals("pw")){
			// ��й�ȣ �� ��ġ
			msg = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
		
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
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
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
					var name = formObj[i].previousSibling.previousSibling.innerHTML.replace(" :","");
					var msg = name + "�� �Է��ϼ���";
					sendMsg(msg);
					pass = false;
				}
			}				
		}			
		return pass;
	}
	
	function sendMsg(){
		var msg = arguments[0];
		var msgBox = document.getElementById("msgBox");
		if(msgBox){
			msgBox.innerHTML = msg;
		} else {
			alert(msg);
		}
	}
	
	function chkSamePw(){
		
	}
	
	function addListener(){
		var pw = document.getElementById("u_pw");
		var re = document.getElementById("u_re");
		
		if(pw && re){
			
			pw.addEventListener("onblur", chkSamePw(pw.));
			re.addEventListener("onblur", chkSamePw);
			
		}
		
		
		
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
			<label for="u_pw">PW :</label> <input type="password" name="u_pw" value="<%= user.getId() %>"  onblur=""/><br/>
			<label for="u_re">Retry :</label> <input type="password" name="u_re" value="<%= user.getPw() %>" /><br/>
			<label for="u_name">Name :</label> <input type="text" name="u_name" value="<%= user.getName() %>" /><br/>
			<label for="u_nick">Nick :</label> <input type="text" name="u_nick" value="<%= user.getNick() %>" /><br/>				
			<div class="btns">
				<input type="button" value="ȸ������" onclick="join()" />
				<input type="button" value="���" onclick="goLogin()" />		
			</div>
		</div>
		<div class="msgBox" id="msgBox">
			<%= msg %>
		</div>	
	</form>	
</body>
</html>