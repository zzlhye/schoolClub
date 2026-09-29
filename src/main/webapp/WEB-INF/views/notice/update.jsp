<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SCHOOL CLUB</title>

<script src="/resources/script/member.js"></script>
</head>

<body>
	<jsp:include page="../include/header.jsp" />

	<form method="post"
		  name="frm"
		  enctype="multipart/form-data"
		  role="form"
		  id="noticeUpdate">

		<input type="hidden" name="noticeNum" value="${notice.noticeNum}">
		<input type="hidden" name="studentId" value="${notice.studentId}">
		<input type="hidden" id="deleteFileNum" name="fileNum">

		<div class="container-fluid pt-4 px-4">
			<div class="bg-light text-center rounded p-4">

				<div class="d-flex align-items-center justify-content-between mb-4">
					<h4 class="mb-0">공지사항 수정</h4>
				</div>

				<!-- 제목 -->
				<div class="form-floating mb-3">
					<input type="text"
						   class="form-control"
						   id="title"
						   name="title"
						   value="${notice.title}">
					<label for="title">제목</label>
				</div>


				<!-- 기존 파일 목록 -->
				<div class="form-group col-md-10 mb-2">
					<div class="form-group col-md-12 existingFileList">

						<c:forEach var="file" items="${files}">
							<div class="row align-items-center existingFileItem">

								<div class="col-auto">
									<a href="javascript:void(0);"
									   onclick="location.href='/displayFile?fileName=' + encodeURIComponent('${file.files}')"
									   style="padding-left: 5px;">
										${file.title}
									</a>
								</div>

								<div class="col-auto">
									<button type="button"
											class="btn btn-default btn-xs btn_onlyFileDelete"
											data-file-num="${file.fileNum}">
										<i class="far fa-trash-alt"></i>
									</button>
								</div>

							</div>
						</c:forEach>

					</div>
				</div>


				<!-- 파일 선택 -->
				<div class="mb-3">
					<input type="hidden"
						   id="uploadCount"
						   value="${fn:length(files)}">

					<input class="form-control"
						   type="file"
						   id="fileUpload"
						   name="fileUpload"
						   multiple>
				</div>


				<!-- 새로 업로드한 파일 목록 -->
				<div class="form-group col-md-10 mb-2">
					<ul class="uploadedList"
						style="padding-left: 0; margin-bottom: 0;">
					</ul>
				</div>


				<!-- 내용 -->
				<div class="form-floating">
					<textarea class="form-control"
							  id="content"
							  name="content"
							  style="height: 250px;">${notice.content}</textarea>
					<label for="content">내용</label>
				</div>

				<br>

				<button type="button"
						class="btn btn-outline-primary"
						id="btn_submit">
					수정
				</button>

				<button type="button"
						class="btn btn-outline-secondary"
						onclick="return editCheck()">
					닫기
				</button>

			</div>
		</div>
	</form>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


<!-- 새로 업로드한 파일 템플릿 -->
<script id="template" type="text/x-handlebars-template">

<li style="list-style-type: none;">
	<div class="row align-items-center">

		<div class="col-auto">
			<a href="/displayFile?fileName={{fullName}}"
			   class="text-muted font-weight-bold"
			   style="padding-left: 5px;">
				{{fileName}}
			</a>
		</div>

		<div class="col-auto">
			<a href="{{fullName}}"
			   class="btn btn-default btn-xs delbtn">
				<i class="far fa-trash-alt"></i>
			</a>
		</div>

	</div>
</li>

</script>


<script>
$(document).ready(function() {

	var formObj = $("#noticeUpdate");
	var template = Handlebars.compile($("#template").html());


	/* =========================
	   수정 버튼
	========================= */
	$("#btn_submit").on("click", function(e) {

		e.preventDefault();

		var title = $("#title").val().trim();
		var content = $("#content").val().trim();

		if (title == "") {
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return false;
		}

		if (content == "") {
			alert("내용을 입력해주세요.");
			$("#content").focus();
			return false;
		}

		if (!confirm("수정하시겠습니까?")) {
			return false;
		}


		/* 새로 업로드된 파일만 전송 */
		$(".uploadedList .delbtn").each(function() {

			var filePath = $(this).attr("href");

			formObj.append(
				"<input type='hidden' name='files' value='" +
				filePath +
				"'>"
			);
		});


		$("#deleteFileNum").val("");

		formObj.attr("action", "/notice/update");
		formObj.attr("method", "post");
		formObj.get(0).submit();
	});


	/* =========================
	   기존 파일 삭제
	========================= */
	$(".btn_onlyFileDelete").on("click", function(e) {

		e.preventDefault();

		var fileNum = $(this).data("file-num");

		$("#deleteFileNum").val(fileNum);

		formObj.attr("action", "/notice/onlyFileDelete");
		formObj.attr("method", "post");
		formObj.get(0).submit();
	});


	/* =========================
	   새 파일 업로드
	========================= */
	$("#fileUpload").on("change", function(event) {

		event.preventDefault();

		var uploaded = parseInt(
			$("#uploadCount").val() || "0",
			10
		);

		var files = document.getElementById("fileUpload").files;


		/* 최대 3개 제한 */
		if (uploaded + files.length > 3) {

			alert("첨부파일은 3개 까지 업로드할 수 있습니다.");

			$("#fileUpload").val("");

			return;
		}


		for (var i = 0; i < files.length; i++) {

			var formData = new FormData();

			formData.append("file", files[i]);


			$.ajax({

				url: "/uploadAjax",

				data: formData,

				dataType: "text",

				processData: false,

				contentType: false,

				type: "POST",

				success: function(data) {

					var fileInfo = getFileInfo(data);

					var html = template(fileInfo);

					$(".uploadedList").append(html);

					uploaded++;

					$("#uploadCount").val(uploaded);
				},

				error: function() {

					alert("파일 업로드 중 오류가 발생했습니다.");
				}

			});
		}


		$("#fileUpload").val("");
	});


	/* =========================
	   새로 업로드한 파일 삭제
	========================= */
	$(".uploadedList").on("click", ".delbtn", function(event) {

		event.preventDefault();

		var that = $(this);

		var uploaded = parseInt(
			$("#uploadCount").val() || "0",
			10
		);


		$.ajax({

			url: "/deleteFile",

			type: "post",

			data: {
				fileName: that.attr("href")
			},

			dataType: "text",

			success: function(result) {

				if (result == "deleted") {

					that.closest("li").remove();

					uploaded--;

					$("#uploadCount").val(uploaded);

					$("#fileUpload").val("");
				}
			}

		});
	});

});
</script>

</body>
</html>