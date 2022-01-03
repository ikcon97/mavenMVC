<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성</title>
<link rel="stylesheet" href="${root}/css/board/boardStyle.css">
</head>
<body>
	<div id="board">
	<form class = "form_style" action="${root}/board/updateOk.do" method="post">
		<input type="hidden" name="boardNumber"value="${boardDto.boardNumber}"/>
		<input type="hidden" name="pageNumber"value="${pageNumber}"/>
		
		<div class = "list">
			<a href="${root}/board/list.do">글목록</a>
		</div>
		
		<div class = "graph">
			<div class = "row">
				<label class="title">작성자</label>
				<span class="contents">
					<input type = "text" name = "writer"size = "15" value="${boardDto.writer}" disabled="disabled"/> 
				</span>
			</div>
			<div class = "row">
				<label class="title">제목</label>
				<span class="contents">
					<input type = "text" name = "subject"size = "30" value="${boardDto.subject}"/> 
				</span>
			</div>
			<div class = "row">
				<label class="title">이메일</label>
				<span class="contents">
					<input type = "email" name = "email"size = "30" value="${boardDto.email}"/> 
				</span>
			</div>
			<div class = "row2">
				<label class="title2">내용</label>
				<span class="contents2">
					<textarea rows="10" cols="40" name="content">${boardDto.content}</textarea>
				</span>
				
			</div>
			
			<div class = "row">
				<label class="title" style="border-bottom-width:2px;">비밀번호</label>
				<span class="contents" style="border-bottom-width:2px;">
					<input type="password" name="password" size="15" value="${boardDto.password}"/>
				</span>
			</div>
			<div class ="row3">
				<input type="submit" value="글수정"/>
				<input type="reset" value="다시작성"/>
				<input type="button" value="목록보기" onclick="location.href='${root}/board/list.do?pageNumber=${pageNumber}'"/>
				
			</div>
		</div>
		</form>
	</div>
</body>
</html>