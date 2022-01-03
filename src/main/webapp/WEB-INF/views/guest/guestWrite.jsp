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
		</div>
		
		
</body>
</html>