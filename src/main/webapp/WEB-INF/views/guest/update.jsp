<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>방명록 수정</title>
<link rel="stylesheet" href="${root}/css/guest/guestStyle.css" />
</head>
<body>
	<div align="center">
		<form class ="form_style" action="${root}/guest/updateOk.do" method="post">
			<div class="title">
				<input type="hidden" name="num" value="${guestDto.num}"/>
				
				<label>이름</label>
				<input type="text" name="name" size="12" value="${guestDto.name}" disabled="disabled"/>
				
				<label style="margin-left: 15px;">비밀번호</label>
				<input type="password" name="password" size="12" value="${guestDto.password}" disabled="disabled"/>
			</div>
			<div class="content">
				<textarea rows="9" cols="53" name="message">${guestDto.message}</textarea>
			</div>
			<div class="title" style="text-align: right;">
				<input type="submit" value="수정"/>
				<input type="reset" value="취소"/> 		
			</div>
		</form>
	</div>
</body>
</html>