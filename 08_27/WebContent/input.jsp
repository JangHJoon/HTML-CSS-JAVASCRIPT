<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>input.jsp</title>
</head>
<body>
	<form action="./insert.do" method="post">
		name : <input type="text" name="item_name" />
		<br>
		price : <input type="text" name="item_price" />
		<br>
		<input type="submit" value="입력" />
	</form>
</body>
</html>