<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �߻�</title>
</head>
<body>
��û ó�� �������� ������ �߻��Ͽ����ϴ�.<br>
���� �ð� ���� ������ �ذ��ϵ��� �ϰڽ��ϴ�.
<p>

<%--

������ ��Ƽ�꿡�� isErrorPage�� true�� �ؾ� 
�⺻��ü exception ��ü�� �� �� �ִ�. 

���� ���������� �߻��� ���ܿ� ���� exception ��ü�� �ٸ���.

--%>

���� Ÿ�� : <%= exception.getClass().getName() %><br>
���� �޼��� : <%= exception.getMessage() %>

</body>
</html>