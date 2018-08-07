<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("euc-kr"); // 한글처리
	
	String userInput = request.getParameter("userInput");
	
	String srcPath = "/data/data.txt";
	
	String realPath = application.getRealPath(srcPath);
	
	FileWriter fw = null;
	
	try{
		// java 파일 안에서 이미 에러처리를 하기 때문에 안해도 오류가 안뜬다.
		fw = new FileWriter(realPath, true);
		// 새로 고침하면 계속 추가가 되기 때문에 리다이렉트 처리해야한다.
		fw.write(userInput + "\n");
		fw.flush();
		
		// 이클립스 서버에서는 임시폴더에 생성된다.
	} catch(IOException e) {
		application.log(e.getMessage());
	} finally {
		try{ if(fw!= null) fw.close(); } catch(Exception e) {}
	}
	
	response.sendRedirect("list.jsp");
	//뒤로 가기 해도 적용이 안된다.	
	//html 코드가 필요없다.
	
%>

