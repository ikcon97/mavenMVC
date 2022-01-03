<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<script type="text/javascript" src="${root}/javascript/member/registerScript.js"></script>
<link rel="stylesheet" href="${root}/css/member/registerStyle.css">
</head>
<body>
	<a href="${root}/index.jsp">시작 페이지</a>

	<div id="title">
		<h4>회원가입(*필수입력사항입니다.)</h4>
	</div>
	<form name="memberForm" id = "form_style" action="${root}/member/registerOk.do" method="post" onsubmit="return registerForm(this)">
		<div id="content">
			<div class="contents" style="border-top-width: 2px;">
				<div class="c1">
					<label>아이디</label>
				</div>
				<div class="c2">
					<span>*</span> <input type="text" name="id" size="12" /> 
					<input type="button" value="아이디중복" onclick="idCheck(memberForm,'${root}')" />
				</div>
			</div>
			<div class="contents">
				<div class="c1">
					<label>비밀번호</label>
				</div>
				<div class="c2">
					<span>*</span> <input type="password" name="password" size="12" />
				</div>
			</div>
			<div class="contents">
				<div class="c1">
					<label>비밀번호 확인</label>
				</div>
				<div class="c2">
					<span>*</span> <input type="password" name="passwordCheck"
						size="12" />
				</div>
			</div>
			<div class="contents">
				<div class="c1">
					<label>이름</label>
				</div>
				<div class="c2">
					<span>*</span> <input type="text" name="name" size="12" />
				</div>
			</div>
			<div class="contents">
				<div class="c1">
					<label>주민번호</label>
				</div>
				<div class="c2">
					<span>*</span> <input type="text" name="jumin1" size="6" /> <span>-</span>
					<input type="text" name="jumin2" size="7" />
				</div>
			</div>
			<div class="contents">
				<div class="c1">
					<label>이메일</label>
				</div>
				<div class="c2">
					<input type="text" name="email" size="20" />
				</div>
			</div>
			<div class="contents">
				<div class="c1">
					<label>우편번호</label>
				</div>
				<div class="c2">
					<input type="text" name="zipcode" size="10" /> 
					<input type="button" value="우편번호검색" onclick="zipcodeRead('${root}')" />
				</div>
			</div>
			<div class="contents">
				<div class="c1">
					<label>주소</label>
				</div>
				<div class="c2">
					<input type="text" name="address" size="40" />
				</div>
			</div>
			<div class="contents">
				<div class="c1">
					<label>직업</label>
				</div>
				<div class="c2">
					<select name="job">
						<option value="student">학생</option>
						<option value="no">무직</option>
						<option value="housewife">주부</option>
						<option value="soldier">군인</option>
					</select>
				</div>
			</div>
			<div class="contents">
				<div class="c1">
					<label>메일수신</label>
				</div>
				<div class="c2">
					<input type="radio" id="yes" name="mailing" value="yes">  
					 <label for="yes">yes</label> 
					 <input type="radio" id="no" name="mailing"	value="no">   
					 <label for="no">no</label>
				</div>
			</div>
			<div class="contents">
				<div class="c1">
					<label>관심분야</label>
				</div>
				<div class="c2">
					<label for="like1"> 경제</label>&nbsp; 
					<input type="checkbox" id="like1" name="interestValue" value="경제"> 
					<label for="like2"> IT</label>&nbsp;  
					<input type="checkbox" id="like2" name="interestValue" value="it">
					<label for="like3"> 음악</label>&nbsp;  
					<input type="checkbox" id="like3" name="interestValue" value="음악">
					<label for="like4"> 미술</label>&nbsp; 
					<input type="checkbox" id="like4" name="interestValue" value="미술">
					
					<input type="hidden" name="interest"/>
				</div>
			</div>
			<div class="contents" style="text-align: center;">
				<input type="submit" value="가입" /> <input type="reset" value="취소" />
				<!-- clear:left; -->
			</div>

		</div>
	</form>
</body>
</html>