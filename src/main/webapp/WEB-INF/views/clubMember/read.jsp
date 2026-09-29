<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SCHOOL CLUB</title>

<script src="/resources/script/member.js"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	
	<form action="/clubMember/delete" method="post" name="removefrm">
		<input type="hidden" name="studentId" value="${clubMember.studentId}">
		<input type="hidden" name="clubNum" value="${clubMember.clubNum}">
		
		<div class="container-fluid pt-4 px-4">
			<div class="bg-light text-center rounded p-4">
				<div class="d-flex align-items-center justify-content-between mb-4">
					<h4 class="mb-0">동아리 회원 정보</h4>
				</div>
				

				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="studentId" value="${clubMember.studentId}" readonly> 
					<label for="studentId">학번</label>
				</div>
				
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="major" value="${clubMember.major}" readonly> 
					<label for="major">학과</label>
				</div>
				
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="name" value="${clubMember.name}" readonly> 
					<label for="name">이름</label>
				</div>
				
				
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="phone" value="${clubMember.phone}" readonly> 
					<label for="phone">전화번호</label>
				</div>
				
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="regDate" 
						value="<fmt:formatDate value="${clubMember.regDate}" pattern="yyyy-MM-dd" />" readonly> 
					<label for="regDate">가입일</label>
				</div>


				<br>
				<button type="submit" class="btn btn-outline-danger" onclick="return removeCheck()">삭제</button>
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='/mypage/clubRead?&clubNum=${clubMember.clubNum}'">닫기</button>
			</div>
		</div>


		<br>
		<br>
		
		
	</form>

</body>
</html>