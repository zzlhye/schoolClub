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
	<form action="/club/register" method="post" name="frm">
	<input type ="hidden" name="studentId" value="${loginUser.studentId}">
		
		<div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h4 class="mb-0">동아리 개설하기</h4>
                     </div>
                     
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="clubName"  name="clubName">
                                <label for="clubName">동아리명</label>
                            </div>
                            
                            
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="name" value="${loginUser.name}" readonly="readonly">
                                <label for="name">회장명</label>
                            </div>
                            

                            
                            <div class="form-floating">
                                <textarea class="form-control" id="clubInfo" name="clubInfo" style="height: 250px;"></textarea>
                                <label for="clubInfo">동아리 소개글</label>
                            </div>
                            
                            <br>
		                            <button type="submit" class="btn btn-outline-primary" onclick="return clubTestCheck()">개설</button>
		                            <button type="button" class="btn btn-outline-secondary" onclick="return editCheck()">닫기</button>
                        </div>
                    </div>
		
		<br><br>
		
	</form>


</body>
</html>