<%@page import="java.util.Hashtable"%>
<%@page import="kr.ac.green.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String withdraw = request.getParameter("withdraw");
	

Object id = session.getAttribute("userId");
if(id == null){
	out.println("<script>alert('·Î±×ÀÎÀ» ÇÏ¼¼¿ä~');</script>");
	// ÀÌ°Å ÀÛµ¿¾ÈÇÔ
	log("if ¹® ¾È");
	response.sendRedirect("loginForm.jsp");
	return;
}

	if(withdraw != null){
		Hashtable<String,UserData> userData = (Hashtable<String,UserData>)application.getAttribute("userData");
		userData.remove((String)session.getAttribute("userId"));
		
		session.invalidate();
		response.sendRedirect("loginForm.jsp");
		return;
		
	}

	

	
	Object check = application.getAttribute("userData");
	if(check == null){
	
		Hashtable<String,UserData> newData = new Hashtable<String,UserData>();
		application.setAttribute("userData", newData);
	}
	
	Hashtable<String,UserData> userData = (Hashtable<String,UserData>)application.getAttribute("userData");
	log("userData" + userData);
	log("id" + id);
	if(!userData.contains((String)id)){
		// ¹º°¡ Àß¸øµÊ			
	}
	
	UserData user= userData.get((String)id);

	
	

	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Info.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
function init(){
	var id = arguments[0];
	var pw = arguments[1];
	var name = arguments[2];
	var nick = arguments[3];
	
	
	
	document.getElementsByName("u_id")[0].value=id;
	document.getElementsByName("u_id")[0].readOnly=true;
	
	
	document.getElementsByName("u_pw")[0].value=pw;
	document.getElementsByName("u_re")[0].value=pw;
	document.getElementsByName("u_name")[0].value=name;
	document.getElementsByName("u_name")[0].readOnly=true;
	document.getElementsByName("u_nick")[0].value=nick;
	
	
	
}

function modify(){
	
	
}

function cancel(){
	
	location.href="loginSuccess.jsp";
	
}

function withdraw(){
	
    var r = confirm("Á¤¸»·Î Å»Åð ÇÒ²¨¾ß?");
    if (r == true) {
    	
		location.href="info.jsp?withdraw=1";
        
    } else {
        // Å»Åð Ãë¼Ò
    }
    
	
	
	
}

</script>

</head>

<body>
	<p class="titleStr">
		Info
	</p>
	<form name="infoForm">
		<div class="centerBox">
			<label for="u_id">ID :</label> <input type="text" name="u_id" /><br/>
			<label for="u_pw">PW :</label> <input type="password" name="u_pw" /><br/>
			<label for="u_re">Retry :</label> <input type="password" name="u_re" /><br/>
			<label for="u_name">Name :</label> <input type="text" name="u_name" /><br/>
			<label for="u_nick">Nick :</label> <input type="text" name="u_nick" /><br/>				
			<div class="btns">
				<input type="button" value="¼öÁ¤" onclick="modify()" />
				<input type="button" value="Ãë¼Ò" onclick="cancel()" />
				<input type="button" value="È¸¿øÅ»Åð" onclick="withdraw()" />
			</div>
		</div>
		<div class="msgBox">
			
		</div>		
	</form>	
	<%
	out.println("<script>  init("+ user.getId() + ", " + user.getPw() 
			+ ", "+ user.getName() + ", " + user.getNick() + "); </script>");
	%>
</body>
</html>