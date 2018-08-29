<%@page import="kr.ac.green.dto.Post"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	Post post = (Post)request.getAttribute("post");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function chkPw(){		
		
		var btnObj = arguments[0];
		var password = prompt("비밀번호", "");

		if (password != null) {			
			
			 var xhttp = new XMLHttpRequest();
			  xhttp.onreadystatechange = function() {
			    if (this.readyState == 4 && this.status == 200) {
			      document.getElementById("demo").innerHTML = this.responseText;
			      
			      // location
			      
			    }
			  };
			  
			  xhttp.open("POST", btnObj.name+".html", true);
			  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			  xhttp.send("p_id=<%=post.getP_id()%>&p_password="+password );			
		}		
	}

</script>
</head>
<body>
<form>
	id :<input type="text" value="<%= post.getP_id() %>" />
	<br />
	title : <input type="text" value="<%= post.getP_title() %>" />
	<br />
	date : <input type="text" value="<%= post.getP_date() %>" />
	<br />
	content : <textarea rows="5" cols="5"><%= post.getP_content() %></textarea>
	<br />
	<input type="button" value="수정" name="modify" onclick="chkPw(this)" />
	<input type="button" value="삭제" name="delete" onclick="chkPw(this)" />

</form>

</body>
</html>