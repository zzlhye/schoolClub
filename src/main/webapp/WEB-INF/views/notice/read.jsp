<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SCHOOL CLUB</title>

<script src="/resources/script/member.js"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<form action="/notice/delete" method="post" name="removefrm">
		<input type="hidden" name="noticeNum" value="${notice.noticeNum}">
		<input type="hidden" name="studentId" value="${notice.studentId}"> 
		
		
		<div class="container-fluid pt-4 px-4">
			<div class="bg-light text-center rounded p-4">
				<div class="d-flex align-items-center justify-content-between mb-4">
					<h4 class="mb-0">공지사항 상세조회 </h4>
				</div>

				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="title" name="title" value="${notice.title}" readonly> 
						<label for="title">제목</label>
				</div>


				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="regDate" name="regDate" value="<fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd" />" readonly> 
					<label for="regDate">작성일</label>
				</div>
				
				
				<!-- 첨부파일 -->
                <c:if test="${!empty files}">
                     <div class="text-start">
                          <label for="files" style="padding-left: 10px; font-size: 15px;">첨부파일</label>
                     </div>
                     
 	                 <c:forEach items="${files}" var="file">  
                     		<div class="p-1 text-start"> 
                     			<a href="javascript:void(0);" 
                     			onclick="location.href='/displayFile?fileName=' + encodeURIComponent('${file.files}')" style="padding-left: 5px;">${file.title}</a> 
                     		</div> 
                     </c:forEach>  
                     <br>  
                </c:if>
                           
                <c:if test="${empty files}"></c:if> 

 
				<div class="form-floating">
					<textarea class="form-control" id="content" name="content" style="height: 250px;" readonly>${notice.content}</textarea>
					<label for="content">내용</label>
				</div>


				<br>

				<!-- 관리자로 로그인 시 삭제, 수정 버튼 노출 -->
				<c:if test="${loginUser.authority eq 3}">
					<button type="submit" class="btn btn-outline-danger" onclick="return removeCheck()">삭제</button>
					<button type="button" class="btn btn-outline-warning" onclick="location.href='/notice/update?noticeNum=${notice.noticeNum}'">수정</button>
				</c:if>

				
				<!-- 공통 노출 -->
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='/notice/list'">닫기</button>
			</div>
		</div>
		<br>
		<br>

	</form>

</body>
</html>