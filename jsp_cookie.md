# 쿠기(Cookie)

![](img/cookie.png)

1. 쿠키 생성 단계 
2. 쿠키 저장 단계(클라이언트측에 저장)
3. 쿠키 전송 단계(요청마다 저장된 쿠키를 같이 전송)

## 쿠키 생성하기

```jsp
<%
    Cookie cookie = new Cookie("key", URLEncoder.encode("value", "utf-8"));
    response.addCookie(cookie);
%>
```

## 저장된 쿠키 읽기
```jsp
<%
	Cookie[] cookies = request.getCookies();
	if (cookies != null && cookies.length > 0) {
		for (int i = 0 ; i < cookies.length ; i++) {
%>
	<%= cookies[i].getName() %> = 
	<%= URLDecoder.decode(cookies[i].getValue(), "utf-8") %><br>
<%
		}
	} else {
%>
쿠키가 존재하지 않습니다.
<%
	}
%>
```