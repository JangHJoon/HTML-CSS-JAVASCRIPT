<%@page import="java.util.Hashtable"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="kr.ac.green.*" %>
   
    <%
    
    
    	String initMsg = "";
     	if(application.getAttribute("userData") == null){
  			Hashtable<String, UserData> userData = new Hashtable<String,UserData>();
     		application.setAttribute("userData", userData);
     	}
    
    	String id = request.getParameter("u_id");
    	String pw = request.getParameter("u_pw");
    	String re = request.getParameter("u_re");
    	String name = request.getParameter("u_name");
    	String nick = request.getParameter("u_nick");
    	
    	if(id == null || pw == null || re == null || name == null || nick == null){
    		
    		
    		
    	} else {
    		
    		
    		

        	if(!pw.equals(re)){
        		
        		initMsg = "비밀번호가 일치하지 않습니다.";
        		// 비밀번호 불일치
        	}
        	
        	Hashtable<String,UserData> userData = (Hashtable<String,UserData>)application.getAttribute("userData");
        	if(userData.containsKey(id)){
        		
        		initMsg = "아이디가 중복됩니다.";
        		// 아이디 중복
        	}
        	
        	UserData user = new UserData(id,pw,name,nick);
        	userData.put(id, user); 
        	response.sendRedirect("loginForm.jsp?id=" + id );
    	}
    	
    	
    	
    
    
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>join.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
	function cancel(){			
		location.href="loginForm.jsp";	
	}
	
	function join(){
		
		if(chkBlank()){
			
			
			var formObj = document.joinForm;
			formObj.method = "post";
			formObj.action = "join.jsp";
			formObj.submit();
			
			
		}
		
	}
	
	function chkBlank(){
		
		var formObj = document.joinForm;
		var flag = true;
		var msg = "";
		var msgBox = document.getElementById("msg");
		for(var i=0 ; i<formObj.length ; i++){
			if(formObj[i].type != "button"){
				if(!formObj[i].value.trim()){
					var what = formObj[i].previousSibling.previousSibling.innerHTML.replace(" :","");
					msg = what + "를 입력하세요";
					msgBox.innerHTML=msg;
					return false;
				}
				
			}
			
		}
		
		return true;
		
	}
	
	
	
	
</script>
</head>
<body>	
	<p class="titleStr">
		Join Member
	</p>
	<form name="joinForm">
		<div class="centerBox">
			<label for="u_id">ID :</label> <input type="text" name="u_id" /><br/>
			<label for="u_pw">PW :</label> <input type="password" name="u_pw" /><br/>
			<label for="u_re">Retry :</label> <input type="password" name="u_re" /><br/>
			<label for="u_name">Name :</label> <input type="text" name="u_name" /><br/>
			<label for="u_nick">Nick :</label> <input type="text" name="u_nick" /><br/>				
			<div class="btns">
				<input type="button" value="회원가입" onclick="join()" />
				<input type="button" value="취소" onclick="cancel()" />		
			</div>
		</div>
		<div class="msgBox" id="msg">
			<%= initMsg %>
		</div>	
	</form>	
</body>
</html>