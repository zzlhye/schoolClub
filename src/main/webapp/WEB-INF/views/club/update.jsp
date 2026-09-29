<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SCHOOL CLUB</title>

<script src="/resources/script/member.js"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />

	<form action="/club/update" method="post" name="updatefrm">
		<input type="hidden" name="clubNum" value="${club.clubNum}">
		<input type="hidden" name="studentId" value="${club.studentId}">
		<div class="container-fluid pt-4 px-4">
			<div class="bg-light text-center rounded p-4">
				<div class="d-flex align-items-center justify-content-between mb-4">
					<h4 class="mb-0">동아리 수정</h4>
				</div>
				
				
							<div class="form-floating mb-3">
                                <input type="text" class="form-control" id="clubName"  name="clubName" value="${club.clubName}">
                                <label for="clubName">동아리명</label>
                            </div>
                            
                            
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="name" value="${club.name}" readonly="readonly">
                                <label for="name">회장명</label>
                            </div>
                            

                            
                            <div class="form-floating">
                                <textarea class="form-control" id="clubInfo" name="clubInfo" style="height: 250px;">${club.clubInfo}</textarea>
                                <label for="clubInfo">동아리 소개글</label>
                            </div>
				
							<br>
							<button type="submit" class="btn btn-outline-primary" onclick="return updateCheck()">수정</button>
                            <button type="button" class="btn btn-outline-secondary" onclick="return editCheck()">닫기</button>
			</div>
		</div>
		
		<br><br>
	</form>
</body>
</html>