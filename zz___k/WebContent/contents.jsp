<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Vector" %>
<%@ page import="ac.green.kr.Stock" %>
<%
	String menu = request.getParameter("menu");
	Vector<Stock> list = (Vector<Stock>)request.getAttribute("result");
%>

<%
	if(menu == null || menu.equals("")) {
%>
		<div id="contents_top">
			<jsp:include page="search.jsp"/>
		</div>
		<div id="contents_ctr">
			<jsp:include page="stockList.jsp"/>
		</div>
<%
	} else if(menu.equals("insert")) {
%>
		<div id="contents_ctr">
			<jsp:include page="insert.jsp"/>
		</div>
<%
	} else if(menu.equals("modify")) {
		if(list == null) {
%>
			<div id="contents_top">
				<jsp:include page="search.jsp"/>
			</div>
<%
		} else {
%>
			<div id="contents_top">
				<jsp:include page="modify.jsp"/>
			</div> 
<%
		}
	} else if(menu.equals("delete")) {
		if(list == null) {		
%>
			<div id="contents_top">
				<jsp:include page="search.jsp"/>
			</div>		
<%
		} else {
%>
			<div id="contents_top">
				<jsp:include page="delete.jsp"/>
			</div>
<%
		}
	}
%>

