<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%

	// �α��� ���ϰ� ������ ��
	Object id = session.getAttribute("userId");
	if(id == null){
		out.println("<script>alert('�α����� �ϼ���~');</script>");
		// �̰� �۵�����
		response.sendRedirect("loginForm.jsp");
	}
	
	
	// �α׾ƿ� ���� ��
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
				<input type="button" value="��������" onclick="info()" />
				<input type="button" value="�α׾ƿ�" onclick="logout()" />
			</div>
		</div>
		<div class="msgBox">
			
		</div>
		
	</form>	
</body>
</html>