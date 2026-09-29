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


	<!-- 개설한 동아리 정보 상세보기 -->
	<div class="container-fluid pt-4 px-4">
		<div class="bg-light text-center rounded p-4">
			<div class="d-flex align-items-center justify-content-between mb-4">
				<h4 class="mb-0">동아리 상세조회</h4>
			</div>

			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="clubName" name="clubName" value="${club.clubName}" readonly> 
				<label for="clubName">동아리명</label>
			</div>

			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="regDate" name="regDate" 
				value="<fmt:formatDate value="${club.regDate}" pattern="yyyy-MM-dd" />" readonly> 
				<label for="regDate">개설일</label>
			</div>


			<div class="form-floating">
				<textarea class="form-control" id="clubInfo" name="clubInfo" style="height: 250px;" readonly>${club.clubInfo}</textarea>
				<label for="clubInfo">동아리 소개글</label>
			</div>

			<br>
			<button type="button" class="btn btn-outline-info" onclick="location.href='/club/read?clubNum=${club.clubNum}'">상세보기</button>

		</div>
	</div>



	<!-- 동아리 회원 목록 -->
	<div class="container-fluid pt-4 px-4">
		<div class="bg-light text-center rounded p-4">
			<div class="d-flex align-items-center justify-content-between mb-4">
				<h4 class="mb-0">동아리 회원</h4>
			</div>


			<div class="table-responsive">
				<table class="table text-start align-middle table-bordered mb-0">
					<colgroup>
						<col style="width: 10%;">
						<col style="width: 25%;">
						<col style="width: 35%;">
						<col style="width: 30%;">
					</colgroup>
					<thead>
						<tr class="text-dark">
							<th>번호</th>
							<th>학과</th>
							<th>이름</th>
							<th>가입일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="clubMember" items="${clubMemberList}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${clubMember.major}</td>
								<td><a href="/clubMember/read?clubNum=${clubMember.clubNum}&studentId=${clubMember.studentId}">${clubMember.name}</a></td>
								<td><fmt:formatDate value="${clubMember.regDate}" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>





	<!-- 가입 신청 현황 목록 -->
	<div class="container-fluid pt-4 px-4">
		<div class="bg-light text-center rounded p-4">
			<div class="d-flex align-items-center justify-content-between mb-4">
				<h4 class="mb-0">가입 신청 현황</h4>
			</div>


			<div class="table-responsive">
				<table class="table text-start align-middle table-bordered mb-0">
					<colgroup>
						<col style="width: 10%;">
						<col style="width: 25%;">
						<col style="width: 35%;">
						<col style="width: 30%;">
					</colgroup>
					<thead>
						<tr class="text-dark">
							<th>번호</th>
							<th>이름</th>
							<th>가입신청일</th>
							<th>승인상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="clubForm" items="${clubFormList}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td><a href="/clubForm/formRead?formNum=${clubForm.formNum}">${clubForm.name}</a></td>
								<td><fmt:formatDate value="${clubForm.regDate}" pattern="yyyy-MM-dd" /></td>
								<td>
									<c:choose>
										<c:when test="${clubForm.status eq 1}">승인대기</c:when>
										<c:when test="${clubForm.status eq 2}">승인</c:when>
										<c:when test="${clubForm.status eq 3}">거절</c:when>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<br>
	<br>
</body>
</html>