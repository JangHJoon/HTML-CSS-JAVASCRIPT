<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>goal.jsp</title>
</head>
<body>
<%
	String value = session.getAttribute("mykey").toString();
%>
<%= value %>
<%= request.getAttribute("null") %>
<hr />
<%-- E.L  --%>
<%-- ���ǿ��� mykey --%>
${ sessionScope.mykey }
${ sessionScope["mykey"] }
<%-- �⺻��ü 4���� loop�Ͽ� mykey�� ã�´� --%>
${ mykey }
<%-- jsp�� �޸� E.L�� null���� ������ �ʴ´�. --%>
${ requestScope.some }
<hr />
<%-- ��Ƽ�꿡 import ����, ����ȯx --%>
${ someObj.value1 } : ${ someObj.value2 }
${ sessionScope.someObj.value1  } : ${ sessionScope.someObj.value2 }
<hr />
<%-- �迭 --%>
${ sessionScope.arr[0] }, ${ sessionScope.arr[1] }, ${ sessionScope.arr[2] } 
<hr />
<%-- �� --%>
${ sessionScope.mymap["first"] }, ${sessionScope.mymap["second"] }
<hr />
<%-- ������ ���, ���ڷ� �ٲ㼭 ����Ѵ�, null�� 0���� ����Ѵ�.--%>
${ 100-1 }, ${ "100"-1 }, ${ null-1 }
<hr />
<%-- ��ü�� ���� key�� ���� Ȯ��, ���ǽĿ� ��� --%>
${ empty arr }
<hr />
<%-- �Ķ���� �� ������ --%>
${ param.myparam }
<hr />
<%-- contextPath ������ --%>
${ pageContext.request.contextPath }
<hr />
<%-- web.xml���� �� ������ application.getInitParameter("test") --%>
${ initParam.test }
</body>
</html>