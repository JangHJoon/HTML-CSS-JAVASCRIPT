<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="org.doo.*" %>
<%@ include file="checkSession.jspf" %>
<%	
	
	if(MemberManager.deleteMember(application, member.getU_id())) {
		session.invalidate();
		session = request.getSession(); // ���ο� ���� ����
		session.setAttribute("msg", "ȸ��Ż�� �Ϸ�Ǿ����ϴ�.");
		response.sendRedirect("loginForm.jsp");
	} else {		
		session.setAttribute("msg", "ȸ��Ż���� ������ �߻��߽��ϴ�.");		
%>
	<jsp:forward page="info.jsp" />
<%				
	}
		
%>