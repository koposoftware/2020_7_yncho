<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>


	<a href = "${ pageContext.request.contextPath }/board">게시판</a><br>
	<c:choose>
		<c:when test="${ empty loginVO }">
			<a href = "${ pageContext.request.contextPath }/login">로그인</a><br>
		</c:when>
		<c:otherwise>
			<a href = "${ pageContext.request.contextPath }/logout">로그아웃</a><br>
		</c:otherwise>
	</c:choose>
	
	
</body>
</html>