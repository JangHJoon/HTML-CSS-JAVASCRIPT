<%@page import="java.util.Vector"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.DataInputStream"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style type="text/css">
	table{
		border: 1px solid black;
	}

</style>
<title>전화번호부</title>
</head>
<%
	String filePath = application.getInitParameter("filePath");

	FileInputStream fis = null;	
	DataInputStream dis = null;
	
	Vector<String> nameList = new Vector<String>();
	Vector<String> telList = new Vector<String>();
	Vector<String> addressList = new Vector<String>();
	

	try{
		fis = new FileInputStream(application.getRealPath(filePath));
		dis = new DataInputStream(fis);
	
		while(true){
			try{
				nameList.add(dis.readUTF());
				telList.add(dis.readUTF());
				addressList.add(dis.readUTF());
			}catch(IOException e){
				break;
			}catch(Exception e){
				throw e;
			}
		}	
				
	}catch(IOException e){
		application.log("예외", e);
	}catch(Exception e){
		application.log("파일 끝?");
	} finally{
		try{if(dis!= null)dis.close();}catch(Exception e){}
		try{if(fis!= null)dis.close();}catch(Exception e){}
	}
%>

<body>
	<table>
		<tr>
			<th></th>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
		</tr>
		
		<% 
			for(int i=0 ; i<nameList.size() ; i++){
		%>
			<tr>
				<td><%= i+1 %></td>
				<td><%= nameList.get(i) %></td>
				<td><%= telList.get(i) %></td>
				<td><%= addressList.get(i) %></td>
			</tr>
		<% 
			}
		%>
		
	
	
	</table>

</body>
</html>