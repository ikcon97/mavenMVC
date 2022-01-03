<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록보기</title>
<link rel="stylesheet" href="${root}/css/board/boardStyle.css">
</head>
<body>
	<div align="center">
		<table>
			<tr>
				<td width="530" bgcolor="D1DBDB" align="right" height="30"><a
					href="${root}/board/write.do">글쓰기</a></td>
			</tr>
		</table>

		<c:if test="${count==0}">
			<tr>
				<td width="530" height="30">게시판에 저장된 글이 없습니다.</td>
			</tr>
		</c:if>

		<c:if test="${count > 0}">
			<table border="1">
				<tr>
					<td width="40" height="30" align="center">번호</td>
					<td width="250" height="30" align="center">제목</td>
					<td width="70" height="30" align="center">작성자</td>
					<td width="100" height="30" align="center">작성일</td>
					<td width="50" height="30" align="center">조회수</td>
				</tr>

				<c:forEach var="boardDto" items="${boardList}">
					<tr>
						<td width="40" height="30" align="center">${boardDto.boardNumber}</td>
						<td width="250" height="30" align="left">
							<c:if test="${boardDto.sequenceLevel > 0 }">
								<c:forEach begin="0" end="${boardDto.sequenceLevel}">
									&nbsp;&nbsp;&nbsp;&nbsp;
								</c:forEach>
								[답글]
							</c:if>
							<a href="${root}/board/read.do?boardNumber=${boardDto.boardNumber}&pageNumber=${currentPage}">${boardDto.subject}</a>
						</td>
						<td width="70" height="30" align="center">${boardDto.writer}</td>
						<td width="100" height="30" align="center">
						<fmt:formatDate
								value="${boardDto.writeDate}" pattern="yyyy-MM-DD hh:mm:ss" /></td>
						<td width="50" height="30" align="center">${boardDto.readCount}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<br /> <br />

		<%-- 페이지 번호  
			1. 한 페이지당 게시물 수 : boardSize
			2. 총 페이지 수 : count / boardSize
			3. 페이지 블럭 : 	
						- 시작페이지번호 :(int) ((currentPage-1)/pageBlock)*pageBlock+1
						- 끝페이지 번호 : 시작페이지번호 + pageBlock - 1
						- 다음/이전
		--%>
		<%-- 총 페이지 수 : 모든 jstl은 문자열이니까 정수로 바꿔주는 작업.--%>
		<fmt:parseNumber var="pageCount"
			value="${count/boardSize + (count % boardSize == 0 ? 0:1)}"
			integerOnly="true" />

		<%-- 페이지 블럭 --%>
		<c:set var="pageBlock" value="${3}" />

		<%-- 요청 페이지의 시작페이지 / 끝페이지 번호 --%>
		<fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock}"
			integerOnly="true" />
		<c:set var="startPage" value="${result*pageBlock+1}" />
		<c:set var="endPage" value="${startPage+pageBlock-1}" />


		<c:if test="${endPage > pageCount}">
			<c:set var="endPage" value="${pageCount}" />
		</c:if>

		<c:if test="${startPage > pageBlock}">
			<a href="${root}/board/list.do?pageNumber=${startPage-pageBlock}">[이전]</a>
		</c:if>

		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="${root}/board/list.do?pageNumber=${i}">[${i}]</a>
		</c:forEach>

		<c:if test="${endPage < pageCount}">
			<a href="${root}/board/list.do?pageNumber=${startPage+pageBlock}">[다음]</a>
		</c:if>

		<br />
		<br />
		<div>총페이지 수 :${pageCount} 시작페이지 번호 :${startPage} 끝페이지 번호
			:${endPage}</div>
	</div>
</body>
</html>