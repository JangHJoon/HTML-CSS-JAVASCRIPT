<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
	function insert(){
		var formObj = document.insertForm;
		
		//blank check
		
		formObj.method="post";
		formObj.action="insert.do";
		formObj.submit();
		
		
		
	}
</script>
<form name="insertForm">
	NAME <input type="text" name="name" /> <br />
	Tel <input type="text" name="tel" /> <br />
	Grade <input type="text" name="grade" /> <br />
	Class <input type="text" name="class" /> <br />
	<input type="button" value="Insert" onclick="insert()" />
</form>