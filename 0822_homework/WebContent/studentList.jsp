<%@page import="kr.ac.green.MyList"%>
<%@page import="kr.ac.green.Student"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

	MyList list = (MyList)application.getAttribute("list");
	if(list == null){
		list = new MyList();
		application.setAttribute("list", list);
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
	if(list.size() == 0){
	
	%>
	<tr>
		<td colspan="5">no data</td>
	</tr>
	
	<% 
	
	} else {
	
		for(Integer index : list.keySet()){
			
	%>
			
		<tr>
			<td><%= index %></td>
			<td><%= list.get(index).getName() %></td>
			<td><%= list.get(index).getTel() %></td>
			<td><%= list.get(index).getGrade() %></td>
			<td><%= list.get(index).getClazz() %></td>
			
		</tr>		
			
			
			
			
			
			
	<% 
			
			
			
			
			
		}
	
	}
	%>
	<tr>
		<td colspan="5"> temp </td>
	</tr>	
</table>