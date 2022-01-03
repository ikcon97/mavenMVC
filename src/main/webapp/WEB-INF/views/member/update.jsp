<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
<script type="text/javascript" src="${root}/javascript/member/registerScript.js"></script>
<link rel="stylesheet" href="${root}/css/member/registerStyle.css">
</head>
<body>
	<a href="${root}/index.jsp">시작 페이지</a>

	<div id="title">
		<h4>회원수정</h4>
	</div>
	<form name="memberForm" id = "form_style" 
		action="${root}/member/updateOk.do" method="post"
		onsubmit="return registerForm(this)">
		
		<div id="content">
			<div class="contents" style="border-top-width: 2px;">
				<div class="c1">
					<input type ="hidden" name ="num" value="${memberDto.num}"/>
					<label>아이디</label>
				</div>
				<div class="c2">
					<span>*</span> <input type="text" name="id" size="12" value="${memberDto.id}" disabled="disabled"/> 
				</div>
			</div>
			<div class="contents">
				<div class="c1">
					<label>비밀번호</label>
				</div>
				<div class="c2">
					<span>*</span> <input type="password" name="password" size="12" value="${memberDto.password}"/>
				</div>
			</div>
			<div class="contents">
				<div class="c1">
					<label>비밀번호 확인</label>
				</div>
				<div class="c2">
					<span>*</span> <input type="password" name="passwordCheck"
						size="12" value="${memberDto.password}"/>
				</div>
			</div>
			<div class="contents">
				<div class="c1">
					<label>이름</label>
				</div>
				<div class="c2">
					<span>*</span> <input type="text" name="name" size="12" value="${memberDto.name}" disabled="disabled"/>
				</div>
			</div>
			<div class="contents">
				<div class="c1">
					<label>주민번호</label>
				</div>
				<div class="c2">
					<span>*</span> <input type="text" name="jumin1" size="6" value="${memberDto.jumin1}" disabled="disabled"/> <span>-</span>
					<input type="text" name="jumin2" size="7" value="${memberDto.jumin2}" disabled="disabled"/>
				</div>
			</div>
			<div class="contents">
				<div class="c1">
					<label>이메일</label>
				</div>
				<div class="c2">
					<input type="text" name="email" size="20" value="${memberDto.email}"/>
				</div>
			</div>
			<div class="contents">
				<div class="c1">
					<label>우편번호</label>
				</div>
				<div class="c2">
					<input type="text" name="zipcode" size="10" value="${memberDto.zipcode}"/> 
					<input type="button" value="우편번호검색" onclick="zipcodeRead('${root}')" />
				</div>
			</div>
			<div class="contents">
				<div class="c1">
					<label>주소</label>
				</div>
				<div class="c2">
					<input type="text" name="address" size="40" value="${memberDto.address}"/>
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
					${memberDto.job}
					<script type="text/javascript">
						memberForm.job.value="${memberDto.job}";
					</script>
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
					 ${memberDto.mailing}
					<script type="text/javascript">
						for(var i=0;i<memberForm.mailing.length;i++){
							if(memberForm.mailing[i].value=="${memberDto.mailing}"){
								memberForm.mailing[i].checked=true;
							}
						}
					</script>
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
					${memberDto.interest}
					<c:forTokens var="interest" items="${memberDto.interest}"
						delims=",">
						<script type="text/javascript">
							for (var i = 0; i < memberForm.interestValue.length; i++) {
								if (memberForm.interestValue[i].value == "${interest}") {
									memberForm.interestValue[i].checked = true;
								}
							}
						</script>
					</c:forTokens>
				</div>
			</div>
			<div class="contents" style="text-align: center;">
				<input type="submit" value="수정" /> <input type="reset" value="취소" />
				<!-- clear:left; -->
			</div>

		</div>
	</form>
</body>
</html>