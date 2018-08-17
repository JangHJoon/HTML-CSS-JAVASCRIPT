<%@page import="java.util.Hashtable"%>
<%@page import="java.util.Vector"%>
<%@page import="kr.ac.green.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" trimDirectiveWhitespaces="true" %>
<% 
   	String initMsg = "";
	
	// �α��� �� ����
   	if(session.getAttribute("userId") != null){
   		response.sendRedirect("/quiz/loginSuccess.jsp");
   	}
    	
   	// ȸ������ ��
   	String idAfterJoin = request.getParameter("id");
   	if(idAfterJoin == null){
   		idAfterJoin = "";
   	}
   	
   	
	if(application.getAttribute("userData") == null){
		Hashtable<String, UserData> newData = new Hashtable<String, UserData>();
		application.setAttribute("userData", newData);
	}    	
    
	// �α���
   	String id = request.getParameter("u_id");
   	String pw = request.getParameter("u_pw");
   	
   	if(id != null && pw != null){
   		
   		Hashtable<String, UserData> userData = (Hashtable<String, UserData>)application.getAttribute("userData");
   		if(userData.containsKey(id)){
   			
			if(pw.equals(userData.get(id).getPw())){ // �α��� ����				
				session.setAttribute("userId", id);
				response.sendRedirect("/quiz/loginSuccess.jsp");
				
			} else { 
				initMsg = "��й�ȣ�� Ʋ���ϴ�.";
			}
			
		} else {
			initMsg = "�ش� ���̵� �����ϴ�.";
		}  
   	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<title>LoginForm</title>
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script type="text/javascript" src="js/main.js" charset='utf-8'></script>
</head>
<body>
	<p class="titleStr">
		Login
	</p>
	<form name="loginForm">
		<div class="centerBox">
			<label for="u_id">ID :</label> <input type="text" name="u_id" value="<%= idAfterJoin %>"  /><br/>
			<label for="u_pw">PW :</label> <input type="password" name="u_pw" /><br/>
			<div class="btns">
				<input type="button" value="�α���" onclick="login()"/>
				<input type="button" value="ȸ������" onclick="goJoin()" />
			</div>
		</div>
		<div class="msgBox">
			<%= initMsg %>
		</div>		
	</form>
</body>
</html>