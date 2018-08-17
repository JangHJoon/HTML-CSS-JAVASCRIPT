<%@ page import="java.util.Hashtable"%>
<%@ page import="kr.ac.green.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" trimDirectiveWhitespaces="true" %>
<%
	String id = request.getParameter("checkId");
	Object userData = application.getAttribute("userData");
	
	if(id == null){
		//error
		
		return;	
	}
	
	if(userData == null){
		out.println("아이디가 사용가능합니다.");
		return;
	}

	Hashtable<String, UserData> user =(Hashtable<String, UserData>)userData;
	if(user.containsKey(id)){
		log("checkif");
		out.println("아이디가 존재합니다.");
		return;
	} 
	
	out.println("아이디가 사용가능합니다.");
%>



