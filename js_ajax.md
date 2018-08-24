# AJAX XMLHttpRequest


## Methods

|메소드|설명|
|-----|----|
|`new XMLHttpRequest()`|XMLHttpRequest 객체를 생성|
|`abort()`|현재 request를 취소|
|`getAllResponseHeaders()`|모든 헤더 정보들를 리턴|
|`getResponseHeader()`| 특정 헤더 정보를 리턴|
|`open(method, url, async, user, psw)`| request를 명세화<br>user, psw : optional|
|`send()`|서버로 request를 보낸다.(GET)|
|`send(String)`|서버로 request를 보낸다.(POST)|
|`setRequestHeader()`|헤더에 label/value를 추가한다.|

<br>

## Properties
|프로퍼티|설명|
|------|-----|
|`onreadystatechange`| `readyState` 프로퍼티가 변할때 호출되는 함수를 정의(listener)|
|`readyState`| `XMLHttpRequest`의 상태를 설정 <br> <li>0 : request를 초기화 하지 않음</li><li>1 : 서버와 연결됨</li><li>2 : request를 받음</li><li>3 : request를 처리</li><li>4 : request가 끝나고 response를 준비</li>
|`responseText`|response 데이터를 String으로 리턴|
|`responseXML`|response 데이터를 XML 형태로 리턴|
|`status`|request의 status-num를 리턴 <br><li>200 : OK</li><li>403 : Forbidden</li><li>404 : Not Found</li>
|`statusText`| request status-String을 리턴|



