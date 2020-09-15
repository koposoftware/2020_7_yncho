<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
		<div align = "center">
			<hr>
			<h2>게시판 상세 페이지</h2>
			<hr>
			<br>
			<table border = "1"> 
				<tr>
					<th width = "25%">번호</th>
					<td>${ board.no }</td>
				</tr>
				<tr>
					<th width = "25%">제목</th>
					<td><c:out value ="${ board.title }"/></td>
				</tr>
				<tr>
					<th width = "25%">글쓴이</th>
					<td>${ board.writer }</td>
				</tr>
				<tr>
					<th width = "25%">조회수</th>
					<td>${ board.viewCnt }</td>
				</tr>
				<tr>
					<th width = "25%">등록일</th>
					<td>${ board.regDate }</td>
				</tr>
				<tr>
					<th width = "25%">내용</th>
					<td style = "height : 200px;">${ board.content }</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<c:forEach items="${ fileList }" var="file">
							<a href = "/Mission-WEB/upload/${ file.fileSaveName }">
								${ file.fileOriName }
							</a>
							(${ file.fileSize } bytes)<br>
						</c:forEach>
					</td>
				</tr>
			</table>
			<br>
			<input type=button value ="수정" onclick = "doAction('U')">&nbsp;&nbsp;
			<input type=button value ="삭제" onclick = "doAction('D')">&nbsp;&nbsp;
			<input type=button value ="목록" onclick = "doAction('L')">&nbsp;&nbsp;
		</div>
	</section>
</body>
</html>