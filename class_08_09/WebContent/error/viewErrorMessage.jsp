<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page isErrorPage = "true" %>
<html>
<head><title>���� �߻�</title></head>
<body>

��û ó�� �������� ������ �߻��Ͽ����ϴ�.<br>
���� �ð� ���� ������ �ذ��ϵ��� �ϰڽ��ϴ�.
<p>
���� Ÿ��: <%= exception.getClass().getName() %> <br>
���� �޽���: <b><%= exception.getMessage() %></b>
</body>
</html>
<%
	for(int i=0; i<500; i++) {
%>
	<!-- empty -->
<%
	}
%>










