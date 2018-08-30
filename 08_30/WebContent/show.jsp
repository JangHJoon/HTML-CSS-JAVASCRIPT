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
			    if(this.responseText == "valid"){
			    	
			    	if(btnObj.name == "modify"){
						location.href="goModify.html?p_id="+${post.p_id};
			    	} else if(btnObj.name == "delete") {
			    	 	location.href="goList.html";
			    	}
			     } else {
			    	 alert("비밀번호가 틀렸어요");
			     }			      
			    }
			  };			  
			  xhttp.open("POST", btnObj.name+".html", true);
			  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			  xhttp.send("p_id="+${post.p_id}+"&p_password="+password );			
		}		
	}
	function back() {
		location.href = "goList.html";
	}
</script>
</head>
<body>
<h1>show</h1>
<form>
	<table>
		<tr>
			<td>id</td>
			<td><input type="text" value="${post.p_id}" readonly/></td>
		</tr>
		<tr>
			<td>title</td>
			<td><input type="text" value="${post.p_title}" readonly/></td>
		</tr>
		<tr>
			<td>date</td>
			<td><input type="text" value="${post.p_date}" readonly/></td>
		</tr>
		<tr>
			<td>content</td>
			<td><textarea rows="6" cols="30" readonly>${post.p_content}</textarea></td>
		</tr>
		<tr>
			<td><input type="button" value="목록" onclick="back()"></td>
			<td align="right">
				<input type="button" value="수정" name="modify" onclick="chkPw(this)" />
				<input type="button" value="삭제" name="delete" onclick="chkPw(this)" />	
			</td>
		</tr>
	</table>

<!-- 
	id :<input type="text" value="${post.p_id}" readonly/>
	<br />
	title : <input type="text" value="${post.p_title}" readonly/>
	<br />
	date : <input type="text" value="${post.p_date}" readonly/>
	<br />
	content : <textarea rows="5" cols="40" readonly>${post.p_content}</textarea>
	<br />
	<input type="button" value="수정" name="modify" onclick="chkPw(this)" />
	<input type="button" value="삭제" name="delete" onclick="chkPw(this)" />
-->	
		
</form>
<div id="test"></div>

</body>
</html>