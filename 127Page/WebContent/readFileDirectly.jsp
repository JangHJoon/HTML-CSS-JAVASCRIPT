<%@page import="java.io.File"%>

<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>절대 경로를 사용하여 자원 읽기</title>
</head>
<body>
<%
	char[] buf = new char[128];
	int len = -1;
	
	File testFile = new File(".");
	out.println(testFile.getCanonicalPath() + "<br>");
	// 디스크 상의 경로와 어플리케이션의 경로는 일치하지 않는다.
	// --> application의 자원 접근 메소드를 사용해야 한다.
	
	String filePath = "C:\\notice.txt";
	filePath = "notice.txt";
	InputStreamReader isr = null;
	FileInputStream fis = null;
	try{
		fis = new FileInputStream(filePath);
		isr = new InputStreamReader(fis);
		
		while((len = isr.read(buf)) != -1){
			out.println(new String(buf,0,len));
		}
		
	} catch(IOException e){
		out.println(e.getMessage());
	} finally {
		try{if(fis != null)fis.close();}catch(Exception e){}
		try{if(isr != null)isr.close();}catch(Exception e){}		
	}
%>

</body>
</html>