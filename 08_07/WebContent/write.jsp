<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("euc-kr"); // �ѱ�ó��
	
	String userInput = request.getParameter("userInput");
	
	String srcPath = "/data/data.txt";
	
	String realPath = application.getRealPath(srcPath);
	
	FileWriter fw = null;
	
	try{
		// java ���� �ȿ��� �̹� ����ó���� �ϱ� ������ ���ص� ������ �ȶ��.
		fw = new FileWriter(realPath, true);
		// ���� ��ħ�ϸ� ��� �߰��� �Ǳ� ������ �����̷�Ʈ ó���ؾ��Ѵ�.
		fw.write(userInput + "\n");
		fw.flush();
		
		// ��Ŭ���� ���������� �ӽ������� �����ȴ�.
	} catch(IOException e) {
		application.log(e.getMessage());
	} finally {
		try{ if(fw!= null) fw.close(); } catch(Exception e) {}
	}
	
	response.sendRedirect("list.jsp");
	//�ڷ� ���� �ص� ������ �ȵȴ�.	
	//html �ڵ尡 �ʿ����.
	
%>

