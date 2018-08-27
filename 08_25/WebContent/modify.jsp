<%@page import="kr.ac.green.dto.Item"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

	Item item = (Item)request.getAttribute("modify_item");
	if(item ==null){
		//error
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>modify.jsp</title>
<script type="text/javascript">
	function modItem(){

		var formObj=document.modifyForm;
		formObj.method="post";
		formObj.action="modify.do";
		formObj.submit();
	}
	function delItem(){

		var formObj=document.modifyForm;
		formObj.method="post";
		formObj.action="delete.do";
		formObj.submit();
		
	}
</script>

</head>
<body>

<form name="modifyForm">
	id : <input type="text" value="<%=item.getItem_id() %>" />
	name : <input type="text" value="<%=item.getItem_name() %>" />
	price : <input type="text" value="<%=item.getItem_price() %>" />
	<input type="button" value="수정" onclick="modItem()" />
	<input type="button" value="삭제" onclick="delItem()" />
</form>

</body>
</html>