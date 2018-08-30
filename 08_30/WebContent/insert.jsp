<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function back() {
		location.href = "goList.html";
	}
</script>
</head>
<body>
<h1>insert</h1>
	<form action="insert.html" method="post">
		<table>
			<tr>
				<td>title</td>
				<td><input type="text" name="p_title" /></td>
			</tr>
			<tr>
				<td>password</td>
				<td><input type="password" name="p_password" /></td>
			</tr>
			<tr>
				<td>content</td>
				<td><textarea rows="10" cols="35" name="p_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="button" value="목록" onclick="back()">&nbsp;<input type="submit"/></td>
			</tr>
		</table>
<!-- 
	title : <input type="text" name="p_title" />
	password : <input type="password" name="p_password" />
	<br />
	content : <textarea rows="10" cols="70" name="p_content"></textarea>
	<br />
	<input type="submit"/>
-->	
		
	</form>
</body>
</html>