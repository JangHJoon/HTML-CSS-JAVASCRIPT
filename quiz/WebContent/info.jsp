<%@page import="java.util.Hashtable"%>
<%@page import="kr.ac.green.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" trimDirectiveWhitespaces="true" %>
<%
	String initMsg = "";
	
	if(application.getAttribute("userData") == null){	
		// error
		return;
	}
	
	//로그인 안 한 상태
	if(session.getAttribute("userId") == null){
		//out.println("<script>alert('로그인을 하세요~');</script>");
		response.sendRedirect("/quiz/loginForm.jsp");
		return;
	}

	String id =(String)session.getAttribute("userId");
	
	// 탈퇴
	String input = request.getParameter("withdraw");
	if(input != null){
		Hashtable<String,UserData> userData = (Hashtable<String,UserData>)application.getAttribute("userData");
		if(userData.get(id).getPw().equals(input)){
			userData.remove(id);		
			session.invalidate();
			response.sendRedirect("/quiz/loginForm.jsp");
			return;		
		} else {
			initMsg = "비밀번호가 틀립니다.";
			
		}
	}
	
	Hashtable<String,UserData> userData = (Hashtable<String,UserData>)application.getAttribute("userData");
	if(!userData.containsKey(id)){
		// error
		return;
	}
	
	UserData user= userData.get(id);	
	
	// 수정
	String pw = request.getParameter("u_pw");
	String re = request.getParameter("u_re");
	String nick = request.getParameter("u_nick");
	

	
	if(pw != null && nick != null){	
		if(pw.equals(re)){			
			UserData newUser= new UserData(id,pw,userData.get(id).getName(),nick);		
			userData.put(id, newUser);			
			response.sendRedirect("/quiz/loginSuccess.jsp");
		}else {
			initMsg="비밀번호가 일치하지 않습니다.";
		}
	
	}
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Info.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
	<script type="text/javascript" src="js/main.js" charset='utf-8'></script>
</head>
<body onload="<%
	out.print("init("+ user.getId()+ ","+ user.getName() + "," + user.getNick()+")");%>">
	<p class="titleStr">
		Info
	</p>
	<form name="infoForm">
		<div class="centerBox">
			<label for="u_id">ID :</label> <input type="text" id="u_id" name="u_id" /><br/>
			<label for="u_pw">PW :</label> <input type="password" id="u_pw" name="u_pw" onblur="chkPw()" /><br/>
			<label for="u_re">Retry :</label> <input type="password" id="u_re" name="u_re" onblur="chkPw()" /><br/>
			<label for="u_name">Name :</label> <input type="text" id="u_name" name="u_name" /><br/>
			<label for="u_nick">Nick :</label> <input type="text" id="u_nick" name="u_nick" /><br/>				
			<div class="btns">
				<input type="button" value="수정" onclick="modify()" />
				<input type="button" value="취소" onclick="goSuccess()" />
				<input type="button" value="회원탈퇴" onclick="withdraw()" />
			</div>
		</div>
		
		<div class="msgBox" id="msg">
			<%= initMsg %>
		</div>		
	</form>	
</body>
</html>