<%@page import="java.util.Hashtable"%>
<%@page import="java.util.Vector"%>
<%@page import="kr.ac.green.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    	String initMsg = "";

    	if(session.getAttribute("userId") != null){
    		response.sendRedirect("loginSuccess.jsp");
    	}
    	
    	Object userData = application.getAttribute("userData");
		if(userData == null){
			Hashtable<String, UserData> newData = new Hashtable<String, UserData>();
			application.setAttribute("userData", newData);
		}
    	
    	
    
    	String id = request.getParameter("u_id");
    	String pw = request.getParameter("u_pw");
    	
    	if(id == null || pw == null){
    		
  			// ���̵� ����
    		initMsg = "";
  			
    		
    	} else {
    		
    		userData = application.getAttribute("userData");
    		if(userData == null){
    			Hashtable<String, UserData> newData = new Hashtable<String, UserData>();
    			application.setAttribute("userData", newData);
    		} else {    			
    			Hashtable<String, UserData> userList = (Hashtable<String, UserData>)userData;
    			
    			if(userList.containsKey(id)){
    				
    				if(pw.equals(userList.get(id).getPw())){
    					// �α��� ����
    					session.setAttribute("userId", id);
    					response.sendRedirect("loginSuccess.jsp");
    					
    				} else {
    					initMsg = "��й�ȣ�� Ʋ���ϴ�.";
    					// ��й�ȣ ��ġ xx
    				}
    				
    				
    			} else {
    				initMsg = "�ش� ���̵� �����ϴ�.";
    				// ���̵� ����
    				
    			}    			
    			
    			
    			
    			
    			
    		}
    	}
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<title>LoginForm</title>
	<link rel="stylesheet" type="text/css" href="css/main.css">
	
	<script type="text/javascript">
	
	function login(){
		if(checkValid()){
			
			var formObj = document.loginForm;
			formObj.method = "post";
			formObj.action = "loginForm.jsp";
			formObj.submit();
			
		}		
	}
	
	function join(){
		location.href="join.jsp";
	}
	
	
	function checkValid(){
		
		var id = document.getElementsByName("u_id")[0];
		var pw = document.getElementsByName("u_pw")[0];			
		var msgBox = document.getElementsByClassName("msgBox")[0];
		
		if(!id.value.trim()){
			msgBox.innerHTML="���̵� �Է����ּ���";
			id.focus();
			return false;
		} 
		if(!pw.value.trim()){
			msgBox.innerHTML="�н����带 �Է����ּ���";			
			pw.focus();
			return false;
		}
		return true;
		
			
				
	}
			
	
	
	</script>
	
</head>
<body>

	<p class="titleStr">
		Login
	</p>
	<form name="loginForm">
		<div class="centerBox">
			<label for="u_id">ID :</label> <input type="text" name="u_id" /><br/>
			<label for="u_pw">PW :</label> <input type="password" name="u_pw" /><br/>
			<div class="btns">
				<input type="button" value="�α���" onclick="login()"/>
				<input type="button" value="ȸ������" onclick="join()" />
			</div>
		</div>
		<div class="msgBox">
			<%= initMsg %>
		</div>		
	</form>
</body>
</html>