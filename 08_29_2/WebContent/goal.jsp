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
<%-- 세션에서 mykey --%>
${ sessionScope.mykey }
${ sessionScope["mykey"] }
<%-- 기본객체 4개를 loop하여 mykey를 찾는다 --%>
${ mykey }
<%-- jsp와 달리 E.L은 null값이 나오지 않는다. --%>
${ requestScope.some }
<hr />
<%-- 디렉티브에 import 생략, 형변환x --%>
${ someObj.value1 } : ${ someObj.value2 }
${ sessionScope.someObj.value1  } : ${ sessionScope.someObj.value2 }
<hr />
<%-- 배열 --%>
${ sessionScope.arr[0] }, ${ sessionScope.arr[1] }, ${ sessionScope.arr[2] } 
<hr />
<%-- 맵 --%>
${ sessionScope.mymap["first"] }, ${sessionScope.mymap["second"] }
<hr />
<%-- 간단한 계산, 숫자로 바꿔서 계산한다, null은 0으로 계산한다.--%>
${ 100-1 }, ${ "100"-1 }, ${ null-1 }
<hr />
<%-- 객체에 대한 key값 유무 확인, 조건식에 사용 --%>
${ empty arr }
<hr />
<%-- 파라미터 값 들고오기 --%>
${ param.myparam }
<hr />
<%-- contextPath 들고오기 --%>
${ pageContext.request.contextPath }
<hr />
<%-- web.xml에서 값 들고오기 application.getInitParameter("test") --%>
${ initParam.test }
</body>
</html>