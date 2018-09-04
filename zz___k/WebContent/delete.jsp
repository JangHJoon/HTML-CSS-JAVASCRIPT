<%@page import="ac.green.kr.Stock"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	Vector<Stock> list = (Vector<Stock>)request.getAttribute("result");
	if((list == null) || (list.size() == 0)) {
		pageContext.include("noData.jsp");
	} else {
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
	function del() {
		var formObj = document.getElementById("delete"); 
		formObj.action="delete.do";
		formObj.method="post";
		formObj.submit();
	}
</script>
<form id="delete">
	<table>
		<tr>
			<td>No</td>
			<td><input type="text" size=20 name="no" value="<%= list.get(0).getNo() %>" readonly /></td>
		</tr>
		<tr>
			<td>Name</td>
			<td><input type="text" size=20 name="name" value="<%= list.get(0).getName() %>" readonly /></td>
		</tr>
		<tr>
			<td>Sort</td>
			<td><input type="text" size=20 name="sort" value="<%= list.get(0).getSort() %>" readonly/></td>
		</tr>
		<tr>
			<td>Amount</td>
			<td><input type="text" size=20 name="amount" value="<%= list.get(0).getAmount() %>" readonly/></td>
		</tr>
		<tr>
			<td>EXP</td>
			<td><input type="text" size=20 name="exp" value="<%= list.get(0).getExp() %>" readonly/></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="delete" onclick="del()"/></td>
		</tr>
	</table>
</form>
<%
	}
%>
