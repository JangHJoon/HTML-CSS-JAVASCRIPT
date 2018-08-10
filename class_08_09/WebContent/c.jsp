<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Arrays" %>
<%-- c.jsp --%>
<%
	String[] addrs = request.getParameterValues("addr");
%>
in c.jsp : <%= Arrays.toString(addrs) %>
<%
	request.setAttribute("returnAttr", "someValue");
%>