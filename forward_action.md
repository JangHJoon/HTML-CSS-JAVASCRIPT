# <jsp:forward page="forward.jsp">


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
|용도|서버의 데이터 변경시<br />데이터의 오염을 최소화|분기에 따라 기능별로 모듈화|

<br />

|비교|include 액션|forward 액션|
|---|-------|-------|
|처리|해당 url에 코드가 삽입된다.|url는 유지한채<br /> 처리되는 내부 jsp파일이 바뀐다.|
|제어권|해당 url로 제어권이 돌아온다.|제어권이 forward page로 넘어간다.|
| 공통 <td colspan="3"> `<jsp:param name="name" value="value"> `로 인수를 넘길 수 있다. 


## forward 액션태그와 출력 버퍼

![](img/forwardbuf.jpg)
> forward 액션태그가 제대로 작동하기 위해서는  
> 출력버퍼가 채워지기 전에 액션태그가 실행되어야 한다. 

> WEB_INF 폴더안의 jsp파일은   
> 사용자가 직접 접근이 불가능하다.
>  