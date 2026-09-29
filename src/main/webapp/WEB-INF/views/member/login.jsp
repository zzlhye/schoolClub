<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>SCHOOL CLUB</title>


<script src="/resources/script/member.js"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />

	<form action="/member/loginPost" method="post" name="frm">
	
	<div class="container-fluid">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-8 col-md-6">
                    <div class="bg-light rounded p-5 p-lg-6 my-5 mx-auto">
                        <div class="d-flex align-items-center justify-content-between mb-6">
                            <h3>로그인</h3>
                        </div>
                       
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="studentId" id="studentId">
                            <label for="studentId">학번</label>
                        </div>
                        
                        <div class="form-floating mb-4">
                            <input type="password" class="form-control" name="pwd" id="pwd">
                            <label for="pwd">비밀번호</label>
                        </div>
                
                        <button type="submit" class="btn btn-outline-primary py-3 w-100 mb-4" onclick="return loginCheck()">로그인</button>
                        <p class="text-center mb-0"><a href="/member/join">회원가입</a></p>
                    </div>
                </div>
            </div>
        </div>
	
	</form>

</body>


<c:if test="${not empty msg}">
    <script>
        alert("${msg}");
    </script>
</c:if>

</html>