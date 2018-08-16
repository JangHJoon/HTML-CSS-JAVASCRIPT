# 리다이렉트

```jsp
<% 
    //response.setStatus(HttpServletResponse.SC_FOUND);	//http 302
    //response.setHeader("Location", "http://localhost:8080/Study/jsp_filePath.jsp");
    response.sendRedirect("jsp_filePath.jsp"); 
%>
```
```
HTTP/1.1 302 Found
Content-Length: 0
Content-Type: text/html;charset=EUC-KR
Date: Thu, 16 Aug 2018 00:30:19 GMT
Location: http://localhost:8080/Study/jsp_filePath.jsp
Server: Apache-Coyote/1.1
```


||302 리다이렉트|meta tag|
|---|----|---|
|뒤로가기|불가능|가능|
|response 헤더| Location:url|x|
