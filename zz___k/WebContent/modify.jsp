<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ac.green.kr.Stock" %>
<%@ page import="java.util.Vector" %>
<%
	Vector<Stock> list = (Vector<Stock>)request.getAttribute("result");
	if((list == null) || (list.size() == 0)) {
		pageContext.include("noData.jsp");
	} else {
%>
<script>
	function mod() {
		var formObj = document.getElementById("modify");
		formObj.action="modify.do";
		formObj.method="post";
		formObj.submit();
	}
</script>
<form id="modify">
	<table>
		<tr>
			<td>ID</td>
			<td><input type="text" size=20 name="no" value="<%= list.get(0).getNo() %>" readonly/></td>
		</tr>
		<tr>
			<td>Name</td>
			<td><input type="text" size=20 name="name" value="<%= list.get(0).getName() %>" readonly/></td>
		</tr>
		<tr>
			<td>Sort</td>
			<td><input type="text" size=20 name="sort" value="<%= list.get(0).getSort() %>"/></td>
		</tr>
		<tr>
			<td>Amount</td>
			<td><input type="text" size=20 name="amount" value="<%= list.get(0).getAmount() %>"/></td>
		</tr>
		<tr>
			<td>EXP</td>
			<td><input type="text" size=20 name="exp" value="<%= list.get(0).getExp() %>"/></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="modify" onclick="mod()"/></td>
		</tr>
	</table>
</form>
<%
	}
%>