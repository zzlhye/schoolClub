<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SCHOOL CLUB</title>

<script src="/resources/script/member.js"></script>
</head>

<body>
	<jsp:include page="../include/header.jsp" />

	<form action="/clubBoard/delete" method="post" name="removefrm">
		<input type="hidden" name="boardNum" value="${board.boardNum}">
		<input type="hidden" name="studentId" value="${board.studentId}">

		<div class="container-fluid pt-4 px-4">
			<div class="bg-light text-center rounded p-4">
				<div class="row">

					<div class="d-flex align-items-center justify-content-between mb-4">
						<h4 class="mb-0">게시글 상세조회</h4>
					</div>

					<c:set var="imageCount" value="0" />
					<c:set var="normalFileCount" value="0" />

					<c:forEach var="file" items="${files}">
						<c:set var="lowerTitle" value="${fn:toLowerCase(file.title)}" />

						<c:choose>
							<c:when
								test="${fn:endsWith(lowerTitle, '.jpg')
										or fn:endsWith(lowerTitle, '.jpeg')
										or fn:endsWith(lowerTitle, '.png')
										or fn:endsWith(lowerTitle, '.gif')}">
								<c:set var="imageCount" value="${imageCount + 1}" />
							</c:when>

							<c:otherwise>
								<c:set var="normalFileCount" value="${normalFileCount + 1}" />
							</c:otherwise>
						</c:choose>
					</c:forEach>


					<!-- 이미지 파일이 있을 때만 왼쪽 영역 출력 -->
					<c:if test="${imageCount > 0}">
						<div class="col-md-5">
							<br>

							<div id="boardImageCarousel" class="carousel slide"
								data-bs-ride="carousel">
								<div class="carousel-inner">

									<c:set var="idx" value="0" />

									<c:forEach var="file" items="${files}">
										<c:set var="lowerTitle" value="${fn:toLowerCase(file.title)}" />

										<c:if
											test="${fn:endsWith(lowerTitle, '.jpg')
													or fn:endsWith(lowerTitle, '.jpeg')
													or fn:endsWith(lowerTitle, '.png')
													or fn:endsWith(lowerTitle, '.gif')}">

											<div class="carousel-item ${idx == 0 ? 'active' : ''}">
												<img
													src="<c:url value='/displayFile'>
															<c:param name='fileName' value='${file.files}' />
														</c:url>"
													class="d-block w-100"
													style="max-width: 100%; height: auto; max-height: 400px; object-fit: contain;">
											</div>

											<c:set var="idx" value="${idx + 1}" />
										</c:if>
									</c:forEach>

								</div>

								<c:if test="${imageCount > 1}">
									<button class="carousel-control-prev" type="button"
										data-bs-target="#boardImageCarousel" data-bs-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Previous</span>
									</button>

									<button class="carousel-control-next" type="button"
										data-bs-target="#boardImageCarousel" data-bs-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Next</span>
									</button>
								</c:if>
							</div>

							<!-- 이미지와 일반 파일이 같이 있을 때: 이미지 아래 첨부파일 출력 -->
							<c:if test="${normalFileCount > 0}">
								<div style="text-align: left; margin-top: 15px;">

									<c:forEach var="file" items="${files}">
										<c:set var="lowerTitle" value="${fn:toLowerCase(file.title)}" />

										<c:if
											test="${not (fn:endsWith(lowerTitle, '.jpg')
														or fn:endsWith(lowerTitle, '.jpeg')
														or fn:endsWith(lowerTitle, '.png')
														or fn:endsWith(lowerTitle, '.gif'))}">
											<div style="margin-top: 8px;">
												<a
													href="<c:url value='/displayFile'>
															<c:param name='fileName' value='${file.files}' />
														</c:url>">
													${file.title} </a>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</c:if>

						</div>
					</c:if>


					<!-- 게시글 내용 -->
					<div class="${imageCount > 0 ? 'col-md-7' : 'col-md-12'}">

						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="title" name="title"
								value="${board.title}" readonly> <label for="title">제목</label>
						</div>

						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="clubName"
								name="clubName" value="${board.clubName}" readonly> <label
								for="clubName">동아리명</label>
						</div>

						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="name" name="name"
								value="${board.name}" readonly> <label for="name">작성자</label>
						</div>

						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="regDate"
								name="regDate"
								value="<fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd" />"
								readonly> <label for="regDate">작성일</label>
						</div>


						<!-- 일반 파일만 있을 때: 작성일과 내용 사이에 첨부파일 출력 -->
						<c:if test="${imageCount == 0 and normalFileCount > 0}">
							<div style="text-align: left; margin-bottom: 15px;">
								<div class="text-start">
									<label for="files" style="padding-left: 10px; font-size: 15px;">첨부파일</label>
								</div>
								<c:forEach var="file" items="${files}">
									<c:set var="lowerTitle" value="${fn:toLowerCase(file.title)}" />

									<c:if
										test="${not (fn:endsWith(lowerTitle, '.jpg')
													or fn:endsWith(lowerTitle, '.jpeg')
													or fn:endsWith(lowerTitle, '.png')
													or fn:endsWith(lowerTitle, '.gif'))}">
										<div style="margin-top: 8px;">
											<a
												href="<c:url value='/displayFile'>
														<c:param name='fileName' value='${file.files}' />
													</c:url>">
												${file.title} </a>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</c:if>


						<div class="form-floating">
							<textarea class="form-control" id="content" name="content"
								style="height: 250px;" readonly>${board.content}</textarea>
							<label for="content">내용</label>
						</div>

					</div>


					<div class="col-md-12">
						<br>

						<c:if
							test="${loginUser.studentId eq board.studentId or loginUser.authority eq 3}">
							<button type="submit" class="btn btn-outline-danger"
								onclick="return removeCheck()">삭제</button>
						</c:if>

						<c:if test="${loginUser.studentId eq board.studentId}">
							<button type="button" class="btn btn-outline-warning"
								onclick="location.href='/clubBoard/update?boardNum=${board.boardNum}'">
								수정</button>
						</c:if>

						<button type="button" class="btn btn-outline-info"
							onclick="location.href='/club/read?clubNum=${board.clubNum}'">
							동아리 상세보기</button>

						<button type="button" class="btn btn-outline-secondary"
							onclick="history.back()">닫기</button>
					</div>

				</div>
			</div>
		</div>

		<br>
		<br>
	</form>
</body>
</html>