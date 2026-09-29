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
	<form action="/clubForm/formWrite" method="post" name="frm">
		<input type="hidden" name="clubNum" value="${clubNum}">
		<input type="hidden" name="studentId" value="${loginUser.studentId}">

		<div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h4 class="mb-0">동아리 가입 신청하기</h4>
                     </div>
                     
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="formTitle" name="formTitle">
                                <label for="formTitle">제목</label>
                            </div>
                            
                            
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="name" value="${loginUser.name}" readonly="readonly">
                                <label for="name">가입자</label>
                            </div>
                            
  
                            <div class="form-floating">
                                <textarea class="form-control" id="formContent" name="formContent" style="height: 250px;"></textarea>
                                <label for="formContent">가입 신청 이유</label>
                            </div>
                            
                            <br>
                            <button type="submit" class="btn btn-outline-primary" onclick="return formCheck()">신청</button>
                            <button type="button" class="btn btn-outline-secondary" onclick="return editCheck()">닫기</button>
                        </div>
                    </div>
                    <br><br>
	</form>
</body>
</html>