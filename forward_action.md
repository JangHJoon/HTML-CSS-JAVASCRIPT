# `<jsp:forward page="forward.jsp">`


![](img/jspforward.png)

* from.jsp
```jsp
<jsp:forward page="/to/to.jsp" />
```

* from_jsp.java
```java
if (true) {
    _jspx_page_context.forward("/to/to.jsp");
    return;
}
```

|비교|redirect|forward 액션|
|-------|---------|-----------|
|요청 수| 2| 1|
|url 변경 여부|리다이렉트 되는 url| url 변경 안됨|
|response 헤더| Location : url | 
|용도|서버의 데이터 변경시<br />데이터의 오염을 최소화|분기에 따라 기능별로 모듈화|

<br />

|비교|include 액션|forward 액션|
|---|-------|-------|
|처리|해당 파일에 include 코드가 삽입| 기존의 출력퍼버를 지우고<br /> foward를 출력한다.|
|제어권|제어권이 include로 갔다가<br />해당 url로 돌아온다. |제어권이 forward로 넘어간다.|


## param 액션태그 
* from.jsp
```jsp
<jsp:forward page="/to/to.jsp">
	<jsp:param value="first" name="BK"/>
	<jsp:param value="last" name="Choi"/>
</jsp:forward>
```
* from_jsp.java
```java
if (true) {
        _jspx_page_context.forward("/to/to.jsp" + (("/to/to.jsp").indexOf('?')>0? '&': '?') + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("BK", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("first", request.getCharacterEncoding()) + "&" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("Choi", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("last", request.getCharacterEncoding()));
        return;
}
```
get형식으로 param값을 넘기는 것을 알 수 있다.

## forward 액션태그와 출력 버퍼

![](img/forwardbuf.jpg)
> forward 액션태그가 제대로 작동하기 위해서는  
> 출력버퍼가 채워지기 전에 액션태그가 실행되어야 한다. 

