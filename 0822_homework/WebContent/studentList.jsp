<%@page import="kr.ac.green.MyList"%>
<%@page import="kr.ac.green.Student"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	
	
	Student[] result = (Student[])request.getAttribute("search");

	if(result == null){
		
		//페이지 해야함
		MyList list = (MyList)application.getAttribute("list");
		if(list != null){
			result = list.values().toArray(new Student[0]);			
		}
	} 
%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<b>Student List</b>
<table>
	<tr>
		<td>ID</td>
		<td>Name</td>
		<td>Tel</td>
		<td>Grade</td>
		<td>Class</td>
	</tr>
	<% 
	if(result == null || result.length == 0){
	
	%>
	<tr>
		<td colspan="5">no data</td>
	</tr>
	
	<% 
	
	} else {
	
		for(Student s: result){
			
	%>
			
		<tr>
			<td><%= s.getId() %></td>
			<td><%= s.getName() %></td>
			<td><%= s.getTel() %></td>
			<td><%= s.getGrade() %></td>
			<td><%= s.getClazz() %></td>
			
		</tr>		
			
			
			
			
			
			
	<% 
			
			
			
			
			
		}
	
	}
	%>
	<tr>
		<td colspan="5"> <%= result==null?0:result.length %> row(s) </td>
	</tr>	
</table>