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

	<div class="container-fluid pt-4 px-4">
		<div class="bg-light text-center rounded p-4">
			<div class="d-flex align-items-center justify-content-between mb-4">
				<h4 class="mb-0">가입 신청서</h4>
			</div>

			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="formTitle" name="formTitle" value="${form.formTitle}" readonly> 
				<label for="formTitle">제목</label>
			</div>


			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="studentId" name="studentId" value="${form.studentId}" readonly> 
				<label for="studentId">학번</label>
			</div>


			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="major" name="major" value="${form.major}" readonly> 
				<label for="major">학과</label>
			</div>


			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="name" name="name" value="${form.name}" readonly> 
				<label for="name">이름</label>
			</div>

			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="phone" name="phone" value="${form.phone}" readonly> 
				<label for="phone">전화번호</label>
			</div>

			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="regDate" name="regDate" value="<fmt:formatDate value="${form.regDate}" pattern="yyyy-MM-dd" />" readonly> 
				<label for="regDate">가입 신청일</label>
			</div>
			

			<div class="form-floating">
				<textarea class="form-control" id="formContent" name="formContent" style="height: 250px;" readonly>${form.formContent}</textarea>
				<label for="formContent">가입 신청 이유</label>
			</div> 
			
			<br>

			<div style="display: flex; gap: 5px; justify-content: center;"> 
			
				<!-- 승인 대기 상태인 신청 폼에게만 승인, 거절 버튼 노출 -->
				<c:if test="${form.status == 1}">
				
					<!-- 동아리 회장한테만 버튼 노출 -->
					<c:if test="${loginUser.studentId eq club.studentId}">
						<form action="/clubForm/approve" method="post" name="approveFrm">
							<input type="hidden" name="formNum" value="${form.formNum}">
							<input type="hidden" name="clubNum" value="${form.clubNum}">
							<input type="hidden" name="studentId" value="${form.studentId}">
							<button type="submit" class="btn btn-outline-primary" onclick="return approveCheck()">승인</button>
						</form>

						<form action="/clubForm/reject" method="post" name="rejectFrm">
							<input type="hidden" name="formNum" value="${form.formNum}">
							<input type="hidden" name="clubNum" value="${form.clubNum}">
							<input type="hidden" name="studentId" value="${form.studentId}">
							<button type="submit" class="btn btn-outline-danger" onclick="return rejectCheck()">거절</button>
						</form>
					</c:if>
				</c:if>

				<!-- 공통 노출 -->
				<button type="button" class="btn btn-outline-secondary" onclick="history.back()">닫기</button>
			</div>

		</div>
	</div>
	<br>
	<br>
</body>
</html>