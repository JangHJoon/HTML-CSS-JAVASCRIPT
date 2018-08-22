<%@page import="kr.ac.green.MyList"%>
<%@page import="kr.ac.green.Student"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 

	Student[] result = (Student[])request.getAttribute("search");

	if(result == null){	
	 //blank page
	}  else if(result.length == 0){
		pageContext.include("nodata.jsp");
	} else if(result.length > 1){
		pageContext.include("studentList.jsp");		
	} else if(result.length == 1){
%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script>
	function modify(){
		var formObj = document.modifyForm;
		formObj.method="post";
		formObj.action="modify.do"
		formObj.submit();
	}


</script>
<form name="modifyForm">
	ID <input type="text" name="id" value="<%= result[0].getId() %>" readonly /> <br />
	NAME <input type="text" name="name" value="<%= result[0].getName() %>" readonly /> <br />
	Tel <input type="text" name="tel" value="<%= result[0].getTel() %>" /> <br />
	Grade <input type="text" name="grade" value="<%= result[0].getGrade() %>" /> <br />
	Class <input type="text" name="class" value="<%= result[0].getClazz() %>" /> <br />
	<input type="button" value="modify" onclick="modify()" />
</form>
<%
	}
%>