<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	th{
		text-align: "center"
	}
</style>
<script>

	function goWriteForm() {
		//location.href = "writeForm.jsp";
		location.href = "/TotalManagement/writeForm.do";
	}
	
	function doAction(boardNO){
		//location.href = "${ pageContext.request.contextPath }/board/detail?no=" + boardNO;   ==> 이전 형태다.
		location.href = "${ pageContext.request.contextPath }/board/" + boardNO; // 이런 방식으로 해보고싶다. 근데 왜 pageContext.request.contextPath로 가져오는거지?
	}
	
</script>
</head>
<body>
		<div align="center">
			<!-- <hr width="100%"> -->
			<!-- <h2>게시판 목록</h2> -->
			<!-- <hr width="100%"> -->
			<br>
			<table class="table">
			<!-- <table border="1" style="width: 100%"> -->
				<tr style = "text-align: center">
					<th width="8%">번호</th>
					<th>제목</th>
					<th width="16%">글쓴이</th>
					<th width="20%">등록일</th>
				</tr>
				<c:forEach items="${ boardList }" var="board" varStatus="loop">
					<tr <c:if test ="${ loop.count mod 2 == 0 }">class="even"</c:if>>
						<td style = "text-align: center">${ board.no }</td>
						<td>
							<a href = "javascript:doAction(${ board.no })">
								<%-- <c:out value = "${ board.title }"/> --%>
								
								<c:choose>
									<c:when test = "${ board.no == board.originid }">
										${ board.title }
									</c:when>
									<c:otherwise>
										<img src ="/TotalManagement/images/reply.png" width = 30px height = 20px>&nbsp;${ board.title }
									</c:otherwise>
								</c:choose>
							</a>
							<%-- 
							<a href="detail.jsp?no=${ board.no }"> 
								<c:out value="${ board.title }" />
							</a> 
							--%>
						</td>
						<td style = "text-align: center">${ board.writer }</td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<c:if test="${ not empty userVO }">
				<button class="btn btn-primary btn-lg px-3" onclick="goWriteForm()">새글등록</button>
			</c:if>
				<br>
				<br>
		</div>

</body>
</html>