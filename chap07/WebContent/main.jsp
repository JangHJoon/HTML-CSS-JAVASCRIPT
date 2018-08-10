<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<head><title>main</title></head>
<body>

main.jsp에서 생성한 내용.

<jsp:include page="sub.jsp" flush="false" >
	<jsp:param value="value1" name="A"/>
	<jsp:param value="value2" name="B"/>
</jsp:include>

include 이후의 내용.

</body>
</html>
