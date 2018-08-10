<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="kr.ac.green.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>save.jsp</title>
</head>
<body>

<% 

	request.setCharacterEncoding("euc-kr");
	String ip = request.getRemoteAddr();
	String msg = request.getParameter("msg");
	
	
	log("test");
	
	if(ip.equals("0:0:0:0:0:0:0:1")){
		ip = "운영자";
	}
	if(msg == null | msg.equals("")){
		
		
		
	} else {
		log("test");
		GuestMessage guestMsg = new GuestMessage(ip, msg);
		
		Object object = application.getAttribute("guest");
		Vector<GuestMessage> data = null;
		if(object == null){
			data =  new Vector<GuestMessage>();
			application.setAttribute("guest", data);		
		} else {
			data = (Vector<GuestMessage>)object;
		}
		
		data.add(guestMsg);
		log(data.size()+"");
		
		application.setAttribute("guset", data);		
		log("test");
	}
	
	response.sendRedirect("layout.jsp?menu=guest");

%>

</body>
</html>