<%@page import="java.util.Vector"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list.jsp</title>
</head>
<body>
	<%
		String srcPath = "/data/data.txt";
	//srcPath = application.getInitParameter("filePath");
	// web.xml
	// ������Ƽ ���� ��� �ؼ� �� �����ϰ� ��� ����
	
	
	// �ӽ� ���� ����� �Ǵ� ���� ����(�켱�� ����)
	application.log("test"); // �����ϱ� ������ �ֿܼ� ������.
	
	
	String realPath = application.getRealPath(srcPath);
	out.println(realPath);
	InputStream is = null;
	InputStreamReader isr = null;
	BufferedReader br = null;
	Vector<String> vec = null;
	try{
		is = application.getResourceAsStream(srcPath);
		isr = new InputStreamReader(is);
		br = new BufferedReader(isr);
		
		String line = null;
		vec = new Vector<String>();
		while((line = br.readLine())!= null){
			vec.add(line);
		}
		
		
		
	} catch (IOException e){
		application.log("���ܹ߻� ", e);
		
	} finally {
		br.close();
		isr.close();
		is.close();
	}
	
	%>
	
	<table border="1">
		<tr>
			<th>��ȣ</th>
			<th>����</th>
		</tr>
		
		<% 
		for(int i=0; i<vec.size() ; i++){
		%>
		<tr>
			<td><%= i+1 %></td>
			<td><%= vec.get(i) %></td>
		</tr>
		<% 
		}
		%>
		
	</table>
	
	
</body>
</html>