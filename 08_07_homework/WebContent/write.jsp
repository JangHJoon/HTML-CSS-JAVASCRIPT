<%@page import="java.io.DataOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String name = request.getParameter("name");	
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");
	
	String filePath = application.getInitParameter("filePath");
	
	FileWriter fw = null;
	FileOutputStream fos = null;
	DataOutputStream dos = null;
	try{
		
		fos = new FileOutputStream(application.getRealPath(filePath), true);
		dos = new DataOutputStream(fos);
		
		dos.writeUTF(name);
		dos.writeUTF(tel);
		dos.writeUTF(address);
		
		
	} catch(IOException e){
		application.log("예외발생", e);
	} finally{
		try{if(dos!=null)dos.close();}catch(Exception e){}
		try{if(fos!=null)fos.close();}catch(Exception e){}
	}
	
	response.sendRedirect("list.jsp");

%>
