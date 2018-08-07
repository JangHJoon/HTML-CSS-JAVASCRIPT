<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>write.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr"); // 한글처리
	
	String userInput = request.getParameter("userInput");
	
	String srcPath = "/data/data.txt";
	
	String realPath = application.getRealPath(srcPath);
	
	FileWriter fw = null;
	
	try{
		// java 파일 안에서 이미 에러처리를 하기 때문에 안해도 오류가 안뜬다.
		fw = new FileWriter(realPath);
		fw.write(userInput + "\n");
		fw.flush();
	} catch(IOException e) {
		application.log(e.getMessage());
	} finally {
		try{ if(fw!= null) fw.close(); } catch(Exception e) {}
	}
	
	
%>

</body>
</html>