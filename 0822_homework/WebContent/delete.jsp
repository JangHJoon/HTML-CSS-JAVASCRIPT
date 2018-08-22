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
	function del(){
		var formObj = document.modifyForm;
		formObj.method="post";
		formObj.action="delete.do"
		formObj.submit();
	}


</script>
<form name="modifyForm">
	ID <input type="text" name="id" value="<%= result[0].getId() %>" readonly /> <br />
	NAME <input type="text" name="name" value="<%= result[0].getName() %>" readonly /> <br />
	Tel <input type="text" name="tel" value="<%= result[0].getTel() %>" readonly /> <br />
	Grade <input type="text" name="grade" value="<%= result[0].getGrade() %>"  readonly /> <br />
	Class <input type="text" name="class" value="<%= result[0].getClazz() %>"  readonly /> <br />
	<input type="button" value="delete" onclick="del()" />
</form>
<%
	}
%>