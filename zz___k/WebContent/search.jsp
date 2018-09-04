<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String menu = request.getParameter("menu");

	if(menu == null) {
		menu = "";
	}
%>
<script>
	function goSearch() {
		var formObj = document.getElementById("search");
		formObj.action="search.do";
		formObj.method="get";
		formObj.submit();
	}
</script>

<form id="search">
검색 :
	<select name="select">
		<option value="no">No</option>
		<option value="name">Name</option>
		<option value="sort">Sort</option>
	</select>
내용 : 
	<input type="text" name="search" size=20/>
	<input type="hidden" name="menu" value="<%= menu %>"/>
	<input type="button" value="search" onclick="goSearch()"/>
</form>