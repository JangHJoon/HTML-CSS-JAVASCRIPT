<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%

	// 로그인 안하고 들어왔을 때
	Object id = session.getAttribute("userId");
	if(id == null){
		out.println("<script>alert('로그인을 하세요~');</script>");
		// 이거 작동안함
		response.sendRedirect("loginForm.jsp");
	}
	
	
	// 로그아웃 했을 때
	String logout = request.getParameter("logout");
	if(logout != null){
		session.invalidate();
		response.sendRedirect("loginForm.jsp");
		
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
	location.href="info.jsp";
}

function logout(){
	location.href="loginSuccess.jsp?logout=1";
	
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
				<input type="button" value="정보보기" onclick="info()" />
				<input type="button" value="로그아웃" onclick="logout()" />
			</div>
		</div>
		<div class="msgBox">
			
		</div>
		
	</form>	
</body>
</html>