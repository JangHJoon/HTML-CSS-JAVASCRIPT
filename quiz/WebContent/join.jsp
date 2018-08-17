<%@page import="java.util.Hashtable"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" trimDirectiveWhitespaces="true" %>
<%@page import="kr.ac.green.*" %>
<%    
	String initMsg = "";
	
	if(application.getAttribute("userData") == null){
		Hashtable<String, UserData> newData = new Hashtable<String,UserData>();
		application.setAttribute("userData", newData);
	}
	
	String id = request.getParameter("u_id");
	String pw = request.getParameter("u_pw");
	String re = request.getParameter("u_re");
	String name = request.getParameter("u_name");
	String nick = request.getParameter("u_nick");
	
	if(id != null && pw != null && re != null && name != null && nick != null){
		
	   	if(!pw.equals(re)){	   		
	   		initMsg = "비밀번호가 일치하지 않습니다.";
	   		// 비밀번호 불일치
	   	}	   	
	   	Hashtable<String,UserData> userData = (Hashtable<String,UserData>)application.getAttribute("userData");
	   	if(userData.containsKey(id)){	   		
	   		initMsg = "아이디가 중복됩니다.";
	   		// 아이디 중복	   		
	   	} else {
	   		UserData user = new UserData(id,pw,name,nick);
	   		userData.put(id, user); 
	   		response.sendRedirect("/quiz/loginForm.jsp?id=" + id );
	   	}
	}
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>join.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
	<script type="text/javascript" src="js/main.js" charset='utf-8'></script>
</head>
<body>	
	<p class="titleStr">
		Join Member
	</p>
	<form name="joinForm">
		<div class="centerBox">
			<label for="u_id">ID :</label> <input type="text" id="u_id" name="u_id" onblur="chkId()" /><br/>
			<label for="u_pw">PW :</label> <input type="password" id="u_pw" name="u_pw" onblur="chkPw()" /><br/>
			<label for="u_re">Retry :</label> <input type="password" id="u_re" name="u_re" onblur="chkPw()" /><br/>
			<label for="u_name">Name :</label> <input type="text" id="u_name" name="u_name" /><br/>
			<label for="u_nick">Nick :</label> <input type="text" id="u_nick" name="u_nick" /><br/>				
			<div class="btns">
				<input type="button" value="회원가입" onclick="join()" />
				<input type="button" value="취소" onclick="goLogin()" />		
			</div>
		</div>
		<div class="msgBox" id="msg">
			<%= initMsg %>
		</div>	
	</form>	
</body>
</html>