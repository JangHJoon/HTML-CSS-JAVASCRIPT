<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String menu = request.getParameter("menu");
	if(menu == null){
		menu = "list";
	}
	
	
%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
	function goSearch(){
		var formObj = document.searchForm;
		formObj.method="get";
		formObj.action="search.do";
		formObj.submit();
		
		
	}
	
	
</script>
<form name="searchForm" >
검색: <select name="select">
  <option value="id">ID</option>
  <option value="name">Name</option>
  <option value="class">Class</option>
</select>
내용: <input type="text" name="search" />
<input type="hidden" name="menu" value="<%= menu %>" />
<input type="button" value="go" onclick="goSearch()" />
</form>