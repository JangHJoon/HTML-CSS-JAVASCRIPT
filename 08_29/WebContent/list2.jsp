<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list.jsp</title>
</head>
<body>
	<a href="goInput.html">go input</a>
	<table>
		<tr>
			<th>number</th>
			<th>first</th>
			<th>second</th>
		</tr>
		<c:choose>
			<c:when test="${ list } == null || ${ list } == 0">
				<tr>
					<td colspan="3">no data</td>
				</tr>
			</c:when>
			<c:otherwise>
			
		
				<c:forEach items="${ list }" varStatus="idx">
					<tr onclick="getDummy(${ list[idx.index].number })">
						<td>${ list[idx.index].number }</td>
						<td>${ list[idx.index].first }</td>
						<td>${ list[idx.index].second }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="3"><c:forEach varStatus="idx" begin="1"
					end="${ pageCount }" step="1">
					<c:when test="${ pageNum }" == ${ idx }>
				${ idx }
			</c:when>
					<c:otherwise>
						<a href="list.html?pageNum=${ idx }">[${ idx }] </a>
					</c:otherwise>
				</c:forEach></td>
		</tr>
	</table>
	<script>
		function getDummy() {
			var number = arguments[0];
			location.href="showDummy.html?number=" + number;
		}
	</script>
</body>
</html>











