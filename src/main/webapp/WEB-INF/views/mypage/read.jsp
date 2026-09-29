<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>SCHOOL CLUB</title>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	
	<div class="container-fluid pt-4 px-4">
			<div class="bg-light text-center rounded p-4">
				<div class="d-flex align-items-center justify-content-between mb-4">
					<h4 class="mb-0">내 정보</h4>
				</div>

				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="studentId" name="studentId" value="${member.studentId}" readonly> 
					<label for="studentId">학번</label>
				</div>
				
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="major" name="major" value="${member.major}" readonly> 
					<label for="major">학과</label>
				</div>
				
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="name" name="name" value="${member.name}" readonly> 
					<label for="name">이름</label>
				</div>
				
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="email" name="email" value="${member.email1}@${member.email2}" readonly> 
					<label for="email">이메일</label>
				</div>
				
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="phone" name="phone" value="${member.phone}" readonly> 
					<label for="phone">전화번호</label>
				</div>


				<br>

				<button type="button" class="btn btn-outline-warning" onclick="location.href='/mypage/update?studentId=${member.studentId}'">수정</button>
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='/'">닫기</button>

			</div>
		</div>

</body>
</html>