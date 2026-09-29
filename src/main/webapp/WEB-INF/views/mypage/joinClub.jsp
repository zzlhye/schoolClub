<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SCHOOL CLUB</title>
</head>
<body>
	<jsp:include page="../include/header.jsp" />

 
	<!-- 동아리 신청 내역 -->
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
								<th>동아리명</th>
								<th>가입신청일</th>
								<th>승인상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="myClubForm" items="${myClubFormList}" varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td><a href="/clubForm/formRead?formNum=${myClubForm.formNum}">${myClubForm.clubName}</a></td>
									<td><fmt:formatDate value="${myClubForm.regDate}" pattern="yyyy-MM-dd" /></td>
									<td>
										<c:choose>
											<c:when test="${myClubForm.status eq 1}">승인대기</c:when>
											<c:when test="${myClubForm.status eq 2}">승인</c:when>
											<c:when test="${myClubForm.status eq 3}">거절</c:when>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>





		<!-- 참여하고 있는 동아리 목록 -->
		<div class="container-fluid pt-4 px-4">
			<div class="bg-light text-center rounded p-4">
				<div class="d-flex align-items-center justify-content-between mb-4">
					<h4 class="mb-0">참여중인 동아리</h4>
				</div>
				<div class="table-responsive">
					<table class="table text-start align-middle table-bordered mb-0">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 55%;">
							<col style="width: 35%;">
						</colgroup>
						<thead>
							<tr class="text-dark">
								<th>번호</th>
								<th>동아리명</th>
								<th>가입일자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="myJoinClub" items="${myJoinClubList}" varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td><a href="/club/read?clubNum=${myJoinClub.clubNum}">${myJoinClub.clubName}</a></td>
									<td><fmt:formatDate value="${myJoinClub.regDate}" pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>