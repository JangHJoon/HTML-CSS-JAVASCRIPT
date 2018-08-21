<%@page import="kr.ac.green.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String msg = "";

	String fail = request.getParameter("fail");
	
	
	
	if(fail != null){
		if(fail.equals("pw")){
			// ��й�ȣ ����ġ
			msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
		}			
		
	}
	
	
	User user = (User)request.getAttribute("user");
	if(user == null){
		user = new User("","","","");
	}



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Info.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">

	function modify(){
		var formObj = document.infoForm;
		if(chkBlank(formObj) && chkPw(formObj)){
			
			formObj.method = "post";
			formObj.action = "modify.do";
			formObj.submit();
			// diable�ϸ� �ȳ��󰡳� readonly �ؾ���
			
			
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
					var name = formObj[i].label.innerHtml;
					alert(name + "�� �Է��ϼ���!");
					pass = false;
				}
			}				
		}			
		return pass;
	}

	
	function withdraw(){
		var pw = prompt("��й�ȣ�� �Է��ϼ���", "");

		if (pw != null && pw.trim() != "") {
		  
			location.href="withdraw.do?pw="+ pw;	
			// ������ �����̷�Ʈ �Ǵϱ� get������� ������ �ɰŰ���
			// �µ� Ʋ���� ��� �����ϱ� ������
		} 
		
	}
	
	function goInfo(){
		location.href="goSuccess.do";
	}


</script>

</head>

<body>
	<p class="titleStr">
		Info
	</p>
	<form name="infoForm">
		<div class="centerBox">
			<label for="u_id">ID :</label> <input type="text" name="u_id" value="<%= user.getId() %>" readonly /><br/>
			<label for="u_pw">PW :</label> <input type="password" name="u_pw" value="" /><br/>
			<label for="u_re">Retry :</label> <input type="password" name="u_re" value="" /><br/>
			<label for="u_name">Name :</label> <input type="text" name="u_name" value="<%= user.getName() %>" readonly /><br/>
			<label for="u_nick">Nick :</label> <input type="text" name="u_nick" value="<%= user.getNick() %>" /><br/>				
			<div class="btns">
				<input type="button" value="����" onclick="modify()" />
				<input type="button" value="���" onclick="goInfo()" />
				<input type="button" value="ȸ��Ż��" onclick="withdraw()" />
			</div>
		</div>
		<div class="msgBox">
			<%= msg %>
		</div>		
	</form>	
</body>
</html>