<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="/resources/script/member.js"></script>

<title>SCHOOL CLUB</title>

</head>
<body>
	<jsp:include page="../include/header.jsp" />

	<form action="/member/join" method="post" name="frm">

		<div class="container-fluid">
			<div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
				<div class="col-12 col-sm-8 col-md-6">
					<div class="bg-light rounded p-5 p-lg-6 my-5 mx-auto">
						<div class="d-flex align-items-center justify-content-between mb-6">
							<h3>회원가입</h3>
						</div>

						<div class="form-floating mb-3" style="display: flex; gap: 10px;">
							<input type="hidden" name="reid" id="reid"> 
							<input type="text" class="form-control" name="studentId" id="studentId">
							<label for="studentId">학번</label> 
							<input type="button" value="중복 체크" onclick="idCheck()" class="btn btn-primary mb-4" style="margin-top: 10px;">
						</div>

						<div class="form-floating mb-4">
							<input type="password" class="form-control" name="pwd" id="pwd">
							<label for="pwd">비밀번호</label>
						</div>

						<div class="form-floating mb-4">
							<input type="password" class="form-control" name="pwd_check" id="pwd_check"> 
							<label for="pwd_check">비밀번호 확인</label>
						</div>

						<div class="form-floating mb-4">
							<input type="text" class="form-control" name="major" id="major">
							<label for="major">학과</label>
						</div>

						<div class="form-floating mb-4">
							<input type="text" class="form-control" name="name" id="name">
							<label for="name">이름</label>
						</div>

						<div class="form-floating mb-4" style="display: flex; align-items: center; gap: 5px;">
    						<input type="text" class="form-control" name="email1" id="email1" style="width: 35%;">
    						<label for="email1">이메일</label>
   							<span>@</span>
    						<input type="text" class="form-control" name="email2" id="email2" style="width: 35%;">
   								<select id="domain-list" class="form-select" style="width: 30%; font-size: 14px; padding-top: 5px; padding-bottom: 5px;">
      								<option value="type" >직접입력</option>
      								<option value="daum.net">daum.net</option>
      								<option value="gmail.com">gmail.com</option>
      								<option value="hanmail.net">hanmail.net</option>
      								<option value="naver.com">naver.com</option>
    								<option value="nate.com">nate.com</option>
    							</select>
						</div>

						<div class="form-floating mb-4">
							<input type="text" class="form-control" name="phone" id="phone">
							<label for="phone">전화번호</label>
						</div>


						<div style="display: flex; gap: 10px;">
							<button type="submit" class="btn btn-outline-primary py-3 w-50 mb-4" onclick="return joinCheck()">회원가입</button>
							<button type="reset" class="btn btn-outline-danger py-3 w-50 mb-4" onclick="return editCheck()">취소</button>
						</div>


					</div>
				</div>
			</div>
		</div>
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

</html>