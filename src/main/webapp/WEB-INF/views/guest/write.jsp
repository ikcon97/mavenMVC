<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<link rel="stylesheet" href="${root}/css/guest/guestStyle.css"/>
<script type="text/javascript" src="${root}/javascript/guest/write.js"></script>
</head>
<body>
	<%-- guestList, count, boardSize, currentPage --%>
	<div align="center">
		<c:if test="${count == 0 || currentPage == 1}">
			<form class="form_style" action="${root}/guest/writeOk.do"
				method="post">
				<div class="title" >
					<label>이름</label> 
					<input type="text" name="name" size="12" /> 
					<label style="margin-left: 15px;">비밀번호</label>
					<input type="password" name="password" size="12" />
				</div>
				<div class="content">
					<textarea rows="9" cols="53" name="message"></textarea>
				</div>
				<div class="title" style="text-align: right;">
					<input type="submit" value="확인" /> 
					<input type="reset" value="취소" />
				</div>
			</form>
		</c:if>
		
		<c:if test="${guestList.size() > 0 }">
			<c:forEach var="guestDto" items="${guestList}">
				<div class="form_style"  style="height: 130px; border:1px solid black;">
					<div class="disp" style="border-width: 1px;">
						${guestDto.name}
						<fmt:formatDate value="${guestDto.writeDate}" pattern="yyyy-MM-DD HH:mm:ss"/>
						<a href="javascript:updateCheck('${guestDto.num}', '${root}')">수정</a>
						<a href="javascript:deleteCheck('${guestDto.num}', '${root}')">삭제</a>
					</div>
					
					<div class="disp-content">${guestDto.message}</div>
				</div>
			</c:forEach>
		</c:if>
	</div><br/><br/>
	
	<!-- 페이지 번호 -->
	<%-- 1. 총  페이지 수  = 전체레코드 / 한페이지당 게시물 수.. 200/10=10, 201/10=21
		 2. 페이지 블럭 정하기 : 10
		 	2-1) 블럭 start 번호, end 번호 구하기
		 	2-2) 계산방법
		 		- 요청페이지 : 5p, 총페이지수 : 200/10 = 20p, 페이지블럭: 10
		 		
		 		int startPage = (int) ((currentPage-1)/pageBlock) * pageBlock+1
		 		int endPage = startPage + pageBlock -1
		 		
		 3. [이전],[다음]
		 	3-1) [이전] : startPage 11 > pageBlock 10 / startPage 11 - pageBlock 10 = 1page
		 	3-2) [다음] : endPage 10 < pageCount 200 / startPage  + pageBlock 10 = 11
	--%>
	<div align="center">
		<c:if test="${count>0}">
			<%-- 총  페이지 수  --%>
			<fmt:parseNumber var="pageCount"
				value="${count/boardSize +  (count%boardSize == 0 ? 0:1)}"
				integerOnly="true" />
		</c:if>
		<%-- 페이지 블럭 --%>
		<c:set var="pageBlock" value="${2}" />
		
		<%-- 블럭의 시작번호, 끝번호 --%>
		<fmt:parseNumber var="rs" value="${(currentPage - 1)/pageBlock}" integerOnly="true"/> 
		<c:set var="startPage" value="${rs * pageBlock + 1}"/>
		<c:set var="endPage" value="${startPage + pageBlock - 1}"/>
		
		<c:if test="${endPage > pageCount}">
			<c:set var="endPage" value="${pageCount}"/>
		</c:if>
		
		<c:if test="${startPage > pageBlock}">
			<a href="${root}/guest/write.do?pageNumber=${startPage-pageBlock}">[이전]</a>
		</c:if>
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="${root}/guest/write.do?pageNumber=${i}">[${i}]</a>
		</c:forEach>
		
		<c:if test="${endPage < pageCount}">
			<a href="${root}/guest/write.do?pageNumber=${startPage+pageBlock}">[다음]</a>
		</c:if>
		
		<div> 
			pageCount : ${pageCount}
			startPage : ${startPage}
			endPage : ${endPage} 
		</div>
	</div>
</body>
</html>