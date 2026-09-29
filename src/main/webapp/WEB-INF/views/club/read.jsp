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
	<form action="/club/delete" method="post" name="removefrm">
		<input type="hidden" name="clubNum" value="${club.clubNum}"> 
		<input type="hidden" name="studentId" value="${club.studentId}">


		<div class="container-fluid pt-4 px-4">
			<div class="bg-light text-center rounded p-4">
				<div class="d-flex align-items-center justify-content-between mb-4">
					<h4 class="mb-0">동아리 상세조회 </h4>
				</div>

				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="clubName" name="clubName" value="${club.clubName}" readonly> 
						<label for="clubName">동아리명</label>
				</div>


				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="name" name="name" value="${club.name}" readonly> 
					<label for="name">회장명</label>
				</div>



				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="regDate" name="regDate" value="<fmt:formatDate value="${club.regDate}" pattern="yyyy-MM-dd" />" readonly> 
					<label for="regDate">개설일</label>
				</div>


				<div class="form-floating">
					<textarea class="form-control" id="clubInfo" name="clubInfo" style="height: 250px;" readonly>${club.clubInfo}</textarea>
					<label for="clubInfo">동아리 소개글</label>
				</div>
				

				
				<br>

				<!-- 동아리 회장, 관리자로 로그인 시 삭제 버튼 노출 -->
				<c:if test="${loginUser.studentId eq club.studentId or loginUser.authority eq 3}">
					<button type="submit" class="btn btn-outline-danger" onclick="return removeCheck()">삭제</button>
				</c:if>


				<!-- 동아리 회장으로 로그인 시 수정 버튼 노출 -->
				<c:if test="${loginUser.studentId eq club.studentId}">
					<button type="button" class="btn btn-outline-warning" onclick="location.href='/club/update?clubNum=${club.clubNum}'">수정</button>
				</c:if>
				
				<!-- 관리자용 수정 버튼 -->
				<c:if test="${loginUser.authority eq 3}">
					<button type="button" class="btn btn-outline-warning" onclick="location.href='/admin/clubUpdate?clubNum=${club.clubNum}'">수정</button>
				</c:if>


				<c:choose>
				
					<%-- 동아리 회장, 해당 동아리 부원, 관리자 제외 버튼 노출 --%>
					<c:when test="${(loginUser.studentId ne club.studentId) and (clubMember eq null and clubForm eq null) and (loginUser.authority ne 3)}">
						<button type="button" class="btn btn-outline-info"
							onclick="location.href='/clubForm/formWrite?clubNum=${club.clubNum}'">가입신청하기</button>
					</c:when>
					
					<%-- 가입 신청서 승인 상태가 1.승인대기 상태인 경우 노출 --%>
					<c:when test="${clubForm.status eq 1}">
						<button type="button" class="btn btn-outline-info">승인 대기 중</button>
					</c:when>
				
				</c:choose>

				
				<!-- 공통 노출 -->
				<button type="button" class="btn btn-outline-secondary" onclick="history.back()">닫기</button>
			</div>
		</div>
		<br>
		<br>
	</form>
</body>
</html>