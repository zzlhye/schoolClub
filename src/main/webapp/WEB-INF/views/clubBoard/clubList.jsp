<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="/resources/script/member.js"></script>
<title>SCHOOL CLUB</title>
<script>
	$(document).ready(function() {
		new DataTable('#example');
	});
</script>

<!-- Favicon -->
<link href="/resources/css/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/resources/css/css/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="/resources/css/css/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="/resources/css/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/resources/css/css/style.css" rel="stylesheet">

</head>
<body>
	<form action="/clubBoard/clubList" method="get">

		<div class="container-fluid pt-4 px-4">
			<div class="bg-white text-center rounded p-4">
				<div class="d-flex align-items-center justify-content-between mb-4">
					<h4 class="mb-0">동아리</h4>
				</div>
				<div class="table-responsive">
					<table id="example" class="table text-start table-bordered">
						<thead>
							<tr class="text-dark">
								<th class="text-start">번호</th>
								<th class="text-start">동아리명</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="club" items="${clubList}" varStatus="status">
								<tr>
									<td class="text-start">${status.count}</td>
									<td><a href="#" onclick="clubCheck('${club.clubNum}', '${club.clubName}')"> ${club.clubName}</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>


	</form>




	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/css/lib/chart/chart.min.js"></script>
	<script src="/resources/css/lib/easing/easing.min.js"></script>
	<script src="/resources/css/lib/waypoints/waypoints.min.js"></script>
	<script src="/resources/css/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="/resources/css/lib/tempusdominus/js/moment.min.js"></script>
	<script src="/resources/css/lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script src="/resources/css/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

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

