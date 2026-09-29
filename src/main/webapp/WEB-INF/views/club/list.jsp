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
<script>
	$(document).ready(function() {
		new DataTable('#example');
	});
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	

	<div class="container-fluid pt-4 px-4">
		<div class="bg-light text-center rounded p-4">
			<div class="d-flex align-items-center justify-content-between mb-4">
				<h4 class="mb-0">동아리</h4>
				<a href="/club/register">개설하기</a>
			</div>


			<div class="table-responsive">
				<table id="example" class="table text-start table-bordered">
					<thead>
						<tr class="text-dark">
							<th class="text-start">번호</th>
							<th class="text-start">동아리명</th>
							<th class="text-start">개설일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="club" items="${clubList}" varStatus="status">
							<tr>
								<td class="text-start">${status.count}</td>
								<td><a href="/club/read?&clubNum=${club.clubNum}">${club.clubName}</a></td>
								<td class="text-start"><fmt:formatDate value="${club.regDate}" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>


		</div>
	</div>
</body>
</html>