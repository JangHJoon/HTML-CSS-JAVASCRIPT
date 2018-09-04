<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
	function insert() {
		var formObj = document.getElementById("input");
		formObj.action = "insert.do";
		formObj.method = "post";
		formObj.submit();
	}
</script>

<form id="input">
	<table>
		<tr>
			<td>Name</td>
			<td><input type="text" name="name" size=20/></td>
		</tr>
		<tr>
			<td>Sort</td>
			<td><input type="text" name="sort" size=20/></td>
		</tr>
		<tr>
			<td>Amount</td>
			<td><input type="text" name="amount" size=20/></td>
		</tr>
		<tr>
			<td>EXP</td>
			<td><input type="text" name="exp" size=20/></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="µî·Ï" onclick="insert()"/></td>
		</tr>
		
	</table>
</form>