<%@page import="java.util.Vector"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list.jsp</title>
</head>
<body>
	<%
		String srcPath = "/data/data.txt";
	//srcPath = application.getInitParameter("filePath");
	// web.xml
	// 프로퍼티 파일 사용 해서 더 간략하게 사용 가능
	
	
	// 임시 파일 저장소 또는 현재 파일(우선권 높음)
	application.log("test"); // 배포하기 전에는 콘솔에 찍힌다.
	
	
	String realPath = application.getRealPath(srcPath);
	out.println(realPath);
	InputStream is = null;
	InputStreamReader isr = null;
	BufferedReader br = null;
	Vector<String> vec = null;
	try{
		is = application.getResourceAsStream(srcPath);
		isr = new InputStreamReader(is);
		br = new BufferedReader(isr);
		
		String line = null;
		vec = new Vector<String>();
		while((line = br.readLine())!= null){
			vec.add(line);
		}
		
		
		
	} catch (IOException e){
		application.log("예외발생 ", e);
		
	} finally {
		br.close();
		isr.close();
		is.close();
	}
	
	%>
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>내용</th>
		</tr>
		
		<% 
		for(int i=0; i<vec.size() ; i++){
		%>
		<tr>
			<td><%= i+1 %></td>
			<td><%= vec.get(i) %></td>
		</tr>
		<% 
		}
		%>
		
	</table>
	
	
</body>
</html>