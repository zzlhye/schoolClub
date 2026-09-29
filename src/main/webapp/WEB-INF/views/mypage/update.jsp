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
	<form action="/mypage/update" method="post" name="updatefrm">
		
		<div class="container-fluid pt-4 px-4">
			<div class="bg-light text-center rounded p-4">
				<div class="d-flex align-items-center justify-content-between mb-4">
					<h4 class="mb-0">내 정보</h4>
				</div>

				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="studentId" name="studentId" value="${member.studentId}" readonly> 
					<label for="studentId">학번</label>
				</div>
				
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="pwd" name="pwd" value="${member.pwd}"> 
					 <label for="pwd">비밀번호</label>
				</div>
				
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="pwd_check" name="pwd_check" value="${member.pwd}"> 
					 <label for="pwd_check">비밀번호 확인</label>
				</div>
				
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="major" name="major" value="${member.major}"> 
					 <label for="major">학과</label>
				</div>
				
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="name" name="name" value="${member.name}"> 
					 <label for="name">이름</label>
				</div>
				
				<div class="form-floating mb-4" style="display: flex; align-items: center; gap: 5px;">
					<input type="text" class="form-control" name="email1" id="email1" style="width: 35%;" value="${member.email1}">
    						<label for="email">이메일</label>
   							<span>@</span>
    						<input type="text" class="form-control" name="email2" id="email2" style="width: 35%;" value="${member.email2}">
   								<select id="domain-list" class="form-select" style="width: 30%; font-size: 14px; padding-top: 5px; padding-bottom: 5px;">
      								<option value="type" >직접입력</option>
      								<option value="daum.net">daum.net</option>
      								<option value="gmail.com">gmail.com</option>
      								<option value="hanmail.net">hanmail.net</option>
      								<option value="naver.com">naver.com</option>
    								<option value="nate.com">nate.com</option>
    							</select>
				</div>
				
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="phone" name="phone" value="${member.phone}"> 
					 <label for="phone">전화번호</label>
				</div>


				<br>
 
				<button type="submit" class="btn btn-outline-warning" onclick="return memUpdateCheck()">수정</button>
				<button type="button" class="btn btn-outline-secondary" onclick="return editCheck()">닫기</button>

			</div>
		</div>
	<br><br>
	</form>

</body>



<script type="text/javascript">
	//도메인 직접 입력 or domain option 선택
	const domainListEl = document.querySelector('#domain-list')
	const domainInputEl = document.querySelector('#email2')
	
	// select 옵션 변경 시 이벤트 실행
	domainListEl.addEventListener('change', (event) => {
  	
	// option에 있는 도메인 선택 시
  	if(event.target.value !== "type") {
    	domainInputEl.value = event.target.value // 선택한 도메인 값을 email2에 자동 입력
    	domainInputEl.readOnly = true // 입력창 비활성화 (수정x)
  	
  	} else { // 직접 입력 시
    	// input 내용 초기화 & 입력 가능하도록 변경
    	domainInputEl.value = ""
    	domainInputEl.readOnly = false // 입력창 활성화
  	}
})
</script>

<script type="text/javascript">
function memUpdateCheck() {
	if (confirm("수정 하시겠습니까?") == true) {
		document.updatefrm.submit();
		alert("수정이 완료되었습니다. 다시 로그인해 주십시오.");

	} else {
		return false;
	}
}
</script>

</html>