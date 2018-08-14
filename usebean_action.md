# `<jsp:useBean id="" class="" scope="">`

DTO (Data Transform Object)



## 자바빈 규칙
---
* 의무사항
    * 기본 생성자   
    * 멤버변수는 private(읽기/쓰기 프로퍼티)
    * getter, setter

* 선택사항   
    * serializable 구현    
    * toString, equals   

<br />

## useBean 액션 태크로 객체 생성 
* makeObject.jsp
```jsp
<jsp:useBean id="member" scope="request" class="chap08.member.MemberInfo" />
```
* makeObject_jsp.java
```java
chap08.member.MemberInfo member = null;

synchronized (request) {

    member = (chap08.member.MemberInfo) _jspx_page_context.getAttribute("member", PageContext.REQUEST_SCOPE);

    if (member == null){
        member = new chap08.member.MemberInfo();
        _jspx_page_context.setAttribute("member", member, PageContext.REQUEST_SCOPE);
    }
}
```
request(scope)로 동기화 하여 `request(scope)영역`에서 속성 `member(id)`을 꺼낸다. 리턴값이 null값이면 `MemberInfo(class)의 기본생성자`를 호출해 대입한다.   
이후 member객체의 프로퍼티를 사용하여 값을 읽기/쓰기를 할 수 있다.

* makeObject.jsp
```jsp
<%
    member.setId("madvirus");
    member.setName("최범균");
%>
```
* makeObject_jsp.java
```java
member.setId("madvirus");
member.setName("최범균");
```

>PAGE_SCOPE   
>Page scope: (this is the default) the named reference remains >available in this PageContext `until the return from the current Servlet.service() invocation.`  
>REQUEST_SCOPE  
>Request scope: the named reference remains available from the ServletRequest associated with the Servlet `until the current request is completed.`  
>SESSION_SCOPE  
>Session scope (only valid if this page participates in a session): the named reference remains available from the HttpSession (if any) associated with the Servlet `until the HttpSession is invalidated.`  
>APPLICATION_SCOPE  
>public static final int APPLICATION_SCOPE
>Application scope: named reference remains available in the ServletContext `until it is reclaimed.`

<br />

## useBean 액션 태크 type 속성
---
* useObject.jsp
```jsp
<jsp:useBean id="member" scope="request" type="chap08.member.MemberInfo" />
```
* useObject_jsp.java
```java
synchronized (request) {
    
    member = (chap08.member.MemberInfo) _jspx_page_context.getAttribute("member", PageContext.REQUEST_SCOPE);
    
    if (member == null){
        throw new java.lang.InstantiationException("bean member not found within scope");
    }
}
```
type 속성은 member(id)에 대한 속성값이 이미 있다고 가정한다.  
따라서 member(id)에 대한 속성값이 없을 때 에러를 발생시킨다.



<br>


## setProperty, getProperty 액션 태크
---

* processJoining.jsp
```jsp
<jsp:setProperty name="memberInfo" property="*" />
<jsp:setProperty name="memberInfo" property="password" value="<%= memberInfo.getId() %>" />

<%-- ... --%>

<td>이름</td>
<td><jsp:getProperty name="memberInfo" property="name" /></td>
<td>이메일</td>
<td><jsp:getProperty name="memberInfo" property="email" /></td>
```
* processJoining_jsp.java
```java
org.apache.jasper.runtime.JspRuntimeLibrary.introspect(_jspx_page_context.findAttribute("memberInfo"), request);
org.apache.jasper.runtime.JspRuntimeLibrary.handleSetProperty(_jspx_page_context.findAttribute("memberInfo"), "password",
 memberInfo.getId() );

// ...

out.write("    <td>이름</td>\n");
out.write("    <td>");

out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((chap08.member.MemberInfo)_jspx_page_context.findAttribute("memberInfo")).getName())));

out.write("</td>\n");
out.write("    <td>이메일</td>\n");
out.write("    <td>");

out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((chap08.member.MemberInfo)_jspx_page_context.findAttribute("memberInfo")).getEmail())));

out.write("</td>\n");
```

> property 값이 `*` 이면 memberInfo(name)의 자바빈 객체의 각 프로퍼티의 값을 같은 이름(form의 각 사용자 입력 데이터의 name)을 갖는 request의 파라미터의 값으로 설정한다.   
