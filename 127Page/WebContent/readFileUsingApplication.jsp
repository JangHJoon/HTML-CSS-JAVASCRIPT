<%@page import="java.io.IOException"%>
<%@page import="java.io.IOError"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>application 기본 객체 사용하여 자원 읽기</title>
</head>
<body>
<%
	String resourcePath = "/message/notice.txt";
	
	out.println("자원의 실제 경로 : <br> ");
	out.println(application.getRealPath(resourcePath));
%>
<br>---------------------<br>
<%
	out.println(resourcePath + "의 내용");
%>
<br>---------------------<br>

<%
	InputStreamReader isr = null;
	try{
		isr = new InputStreamReader(
				application.getResourceAsStream(resourcePath));
		
		char[] buf = new char[128];
		int len = -1;
		
		while((len = isr.read(buf))!= -1){
			out.println(new String(buf, 0, len));
		}
		
		
	} catch(IOException e){
		out.println(e.getMessage());
	} finally {
		try{if(isr!= null) isr.close();}catch(Exception e){}
	}





%>

</body>
</html>