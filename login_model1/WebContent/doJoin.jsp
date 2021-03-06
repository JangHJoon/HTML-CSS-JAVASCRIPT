<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="org.doo.*" %>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="member" class="org.doo.Member"/>
<jsp:setProperty property="*" name="member"/>

<%
	String msg = "회원가입 성공";
	String nextPage = "loginForm.jsp";
	if(!MemberManager.addMember(application, member)) {
		msg = "이미 존재하는 아이디 입니다.";
		nextPage = "join.jsp";
	} 
	session.setAttribute("msg", msg);
	response.sendRedirect(nextPage); // 서버 데이터 관련이라 리다이렉트 적용
%>