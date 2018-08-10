<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Arrays" %>
<%-- b.jsp --%>
<%
	String[] addrs = request.getParameterValues("addr");
%>
in b.jsp : <%= Arrays.toString(addrs) %>
<hr>
<jsp:include page="c.jsp" />
