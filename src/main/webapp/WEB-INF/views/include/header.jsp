<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SCHOOL CLUB</title>

<!-- Favicon -->
<link href="/resources/css/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">


<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/resources/css/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="/resources/css/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.3/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="https://cdn.datatables.net/2.3.2/css/dataTables.bootstrap5.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="/resources/css/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/resources/css/css/style.css" rel="stylesheet">

</head>
<body>

	<div class="container-xxl position-relative bg-white d-flex p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->


		<!-- 로고 -->
		<div class="sidebar pe-4 pb-3">
			<nav class="navbar bg-light navbar-light"> <a href="/"
				class="navbar-brand mx-4 mb-3">
				<h3 class="text-primary">SCHOOL CLUB</h3>
			</a> <!-- 로그인 후 노출 - 사용자 정보  --> <c:if
				test="${loginUser.authority eq 1 or loginUser.authority eq 3}">
				<div class="d-flex align-items-center ms-4 mb-4">
					<div class="position-relative">
						<img class="rounded-circle" src="/resources/css/img/profile.png"
							alt="" style="width: 40px; height: 40px;">
						<div
							class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
					</div>

					<div class="ms-3">
						<h6 class="mb-0">${loginUser.name}</h6>
					</div>
				</div>
			</c:if>


			<div class="navbar-nav w-100">

				<!-- 관리자로 로그인 시 노출 -->
				<c:if test="${loginUser.authority eq 3}">
					<a href="/admin/memberList" class="nav-item nav-link"> <i
						class="fas fa-users-cog me-2"></i>회원관리
					</a>
				</c:if>



				<!-- 공통 노출 -->
				<a href="/notice/list" class="nav-item nav-link"> <i
					class="fa-solid fa-bullhorn me-2"></i>공지사항
				</a> <a href="/club/list" class="nav-item nav-link"> <i
					class="fas fa-users me-2"></i>동아리
				</a> <a href="/clubBoard/list" class="nav-item nav-link"> <i
					class="fa-solid fa-comments me-2"></i>동아리 게시판
				</a> 



				<!-- 사용자로 로그인 시 노출 - 내 정보 관리 -->
				<c:if test="${loginUser.authority eq 1}">
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"> <i class="fas fa-id-card me-2"></i>내
							정보
						</a>
						<div class="dropdown-menu bg-transparent border-0">
							<a href="/mypage/read" class="dropdown-item">내 정보 관리</a> <a
								href="/mypage/clubList" class="dropdown-item">내 동아리 관리</a> <a
								href="/mypage/joinClub" class="dropdown-item">가입한 동아리 관리</a> 
						</div>
					</div>
				</c:if>


			</div>
			</nav>
		</div>
		<!-- Sidebar End -->

		<!-- 상단 헤더 -->
		<div class="content">
			<!-- Navbar Start -->
			<nav
				class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
			<a href="main.do" class="navbar-brand d-flex d-lg-none me-4">
				<h2 class="text-primary mb-0">
					<i class="fa fa-hashtag"></i>
				</h2>
			</a> <a href="#" class="sidebar-toggler flex-shrink-0"> <i
				class="fa fa-bars"></i>
			</a> <!-- 로그인 전 --> <c:if test="${empty loginUser}">
				<div
					style="position: absolute; right: 10%; display: flex; gap: 10px;">
					<a href="/member/login" class="nav-item nav-link">로그인</a> <a
						href="/member/join" class="nav-item nav-link">회원가입</a>
				</div>
			</c:if> <!-- 로그인 후 노출 --> <c:if
				test="${loginUser.authority eq 1 or loginUser.authority eq 3}">
				<div class="navbar-nav align-items-center ms-auto">

					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"> <img
							class="rounded-circle me-lg-2"
							src="/resources/css/img/profile.png" alt=""
							style="width: 40px; height: 40px;"> <span
							class="d-none d-lg-inline-flex">${loginUser.name}</span>
						</a>

						<div
							class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
							<a href="/member/logout" class="dropdown-item">로그아웃</a>
						</div>
					</div>
				</div>
			</c:if> </nav>
			<!-- Navbar End -->



			<!-- JavaScript Libraries -->
			<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
			<script src="/resources/css/lib/chart/chart.min.js"></script>
			<script src="/resources/css/lib/easing/easing.min.js"></script>
			<script src="/resources/css/lib/waypoints/waypoints.min.js"></script>
			<script src="/resources/css/lib/owlcarousel/owl.carousel.min.js"></script>
			<script src="/resources/css/lib/tempusdominus/js/moment.min.js"></script>
			<script
				src="/resources/css/lib/tempusdominus/js/moment-timezone.min.js"></script>
			<script
				src="/resources/css/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

			<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
			<script
				src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
			<script
				src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>

			<script src="https://cdn.datatables.net/2.3.2/js/dataTables.js"></script>

			<script
				src="https://cdn.datatables.net/2.3.2/js/dataTables.bootstrap5.js"></script>

			<!-- Template Javascript -->
			<script src="/resources/css/js/main.js"></script>
</body>


</html>