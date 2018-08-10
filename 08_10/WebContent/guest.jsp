<%@page import="java.util.Hashtable"%>
<%@page import="java.util.Vector"%>
<%@page import="kr.ac.green.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Object object = application.getAttribute("guest");
	Vector<GuestMessage> data = null;
	if(object == null){
		data =  new Vector<GuestMessage>();
		application.setAttribute("guest", data);		
	} else {
		data = (Vector<GuestMessage>)object;
	}	
	
%>

<table>
	<tr>
		<th></th>
		<th>메시지</th>
		<th>ip</th>
	</tr>
	
	<%
	
	for(int i=0 ; i<data.size() ; i++){
	
	%>
	<tr>
		<td><%= (i+1) %></td>
		<td><%= data.get(i).getMsg() %></td>
		<td><%= data.get(i).getIp() %></td>
	</tr>
		
	<% 
	}
	%>

</table>




<form action="save.jsp" method="post">
	<input type="text" name="msg" />
	<input type="submit" value="등록" />
</form>

</body>
</html>