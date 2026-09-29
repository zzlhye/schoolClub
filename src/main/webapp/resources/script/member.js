/**
 * 
 */
/* 로그인 유효성 체크 */
function loginCheck() {
	if (document.frm.studentId.value.length == 0) {
		alert("아이디를 입력해주세요.");
		document.frm.studentId.focus();
		return false;
	}
	if (document.frm.pwd.value.length == 0) {
		alert("비밀번호를 입력해주세요.");
		document.frm.pwd.focus();
		return false;
	}
	return true;
}

/* 아이디 중복 체크 */
function idCheck() {
	
	// 학번 입력 여부 확인
	if(document.frm.studentId.value.length == 0) {
		alert("학번을 입력해주세요.")
		document.frm.studentId.focus();
		return false;
	}
	
    $.ajax({
        url: "/member/idcheck", //요청 주소
        type: "post",
        dataType: "json",
        data: {
            "studentId": $("#studentId").val() // 서버로 보낼 데이터 (studentId)
        },
        success: function(data) { 
            if (data == 1) {
                $('#reid').val(1);
                alert("이미 존재하는 학번입니다. 다시 확인해주세요.");
                
            } else if (data == 0) {
                $('#reid').val(0);
                alert("사용 가능한 학번입니다.");
            }
        }
    });
}

/* 회원 가입 유효성 체크 */
function joinCheck() {
	if (document.frm.studentId.value == "") {
		alert("학번을 입력해주세요.");
		document.frm.studentId.focus();
		return false;
	}
	if (document.frm.studentId.value.length != 8) {
		alert("학번은 8자리로 입력해 주세요.");
		document.frm.studentId.focus();
		return false;
	}
	if (document.frm.pwd.value == "") {
		alert("비밀번호를 입력해주세요.");
		document.frm.pwd.focus();
		return false;
	}
	if (document.frm.pwd.value != document.frm.pwd_check.value) {
		alert("암호가 일치하지 않습니다.");
		document.frm.pwd.focus();
		return false;
	}
	if (document.frm.major.value == "") {
		alert("학과를 입력해주세요");
		document.frm.major.focus();
		return false;
	}
	if (document.frm.name.value == "") {
		alert("이름을 입력해주세요");
		document.frm.name.focus();
		return false;
	}
	if (document.frm.email.value == "") {
		alert("이메일을 입력해주세요");
		document.frm.email.focus();
		return false;
	}
	if (document.frm.phone.value == "") {
		alert("전화번호를 입력해주세요");
		document.frm.phone.focus();
		return false;
	}

	if (document.frm.reid.value.length == 0) {
		alert("중복 체크를 하지 않았습니다.");
		document.frm.studentId.focus();
		return false;
	}
	
	if (confirm("회원가입 하시겠습니까?") == true) {
		document.frm.submit();
	} else {
		return false;
	}
}

/* 동아리 등록 유효성 체크 */
function clubTestCheck() {	
	if (document.frm.clubName.value == "") {
		alert("동아리명을 입력해주세요.");
		document.frm.clubName.focus();
		return false;
	}
	if (document.frm.clubInfo.value == "") {
		alert("동아리 소개글을 입력해주세요.");
		document.frm.clubInfo.focus();
		return false;
	}

	if (confirm("개설 하시겠습니까?") == true) {
		document.frm.submit();
		
	} else {
		return false;
	}
}

/* 동아리 게시판 등록 유효성 체크 */
function boardCheck() {
	
	if (document.frm.title.value == "") {
		alert("제목을 입력해주세요.");
		document.frm.title.focus();
		return false;
	}

	if (document.frm.clubNum.value == "") {
		alert("동아리를 선택해주세요.");
		document.frm.clubNum.focus();
		return false;
	}

	if (document.frm.content.value == "") {
		alert("내용을 입력해주세요.");
		document.frm.content.focus();
		return false;
	}

	if (confirm("등록 하시겠습니까?") == true) {
		document.frm.submit();
	} else {
		return false;
	}
}

/* 관리자 동아리 회장 수정 시 회원 선택 팝업창  */
function memberCheck(studentId, name) {
	opener.document.getElementById("studentId").value = studentId;
	opener.document.getElementById("name").value = name;
	window.close();
}

/* 게시글 작성 시 동아리 선택 팝업창  */
function clubCheck(clubNum, clubName) {
	opener.document.getElementById("clubNum").value = clubNum;
	opener.document.getElementById("clubName").value = clubName;
	window.close();
}

/* 동아리 신청 폼 유효성 체크 */
function formCheck() {
	if (document.frm.formTitle.value == "") {
		alert("제목을 입력해주세요.");
		document.frm.formTitle.focus();
		return false;
	}
	if (document.frm.formContent.value == "") {
		alert("내용을 입력해주세요.");
		document.frm.formContent.focus();
		return false;
	}

	if (confirm("신청 하시겠습니까?") == true) {
		document.frm.submit();
	} else {
		return false;
	}
}

/* 문의 게시판 등록 유효성 체크 */
function qnaCheck() { 
	if (document.frm.title.value == "") {
		alert("제목을 입력해주세요.");
		document.frm.title.focus();
		return false;
	}
	
	if (checkbox.checked && document.frm.pwd.value == "") {
		alert("비밀번호를 입력해주세요.");
		document.frm.pwd.focus();
		return false;
	}

	if (document.frm.content.value == "") {
		alert("내용을 입력해주세요.");
		document.frm.content.focus();
		return false;
	}

	if (confirm("등록 하시겠습니까?") == true) {
		document.frm.submit();
	} else {
		return false;
	}
}


// 수정 시 얼럿 창
function updateCheck() {
	if (confirm("수정 하시겠습니까?") == true) {
		document.updatefrm.submit();

	} else {
		return false;
	}
}

// 등록, 수정화면에서 닫기 버튼 얼럿 창
function editCheck() {
	if (confirm("이 페이지를 나가시겠습니까? 작성한 내용은 저장되지 않습니다.") == true) {
		history.back();

	} else {
		return false;
	}
}

// 삭제 시 얼럿 창
function removeCheck() {
	if (confirm("정말 삭제하시겠습니까?") == true) {
		document.removefrm.submit();

	} else {
		return false;
	}
}

// 동아리 가입 승인, 거절 시 얼럿 창
function approveCheck() {
	if (confirm("승인 하시겠습니까?") == true) {
		document.approveFrm.submit();

	} else {
		return false;
	}
}

function rejectCheck() {
	if (confirm("거절 하시겠습니까?") == true) {
		document.rejectFrm.submit();

	} else {
		return false;
	}
}
