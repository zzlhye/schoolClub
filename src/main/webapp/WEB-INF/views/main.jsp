<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SCHOOL CLUB</title>

</head>
<body>
	<jsp:include page="include/header.jsp" />


			<!-- 동아리, 동아리 회원 수 -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-6 col-xl-6">
                        <div class="bg-light rounded d-flex align-items-center justify-content-start gap-4 p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">개설된 동아리 수</p>
                                <h6 class="mb-0">${countClub}</h6>
                            </div>
                        </div>
                    </div>


                    <div class="col-sm-6 col-xl-6">
                        <div class="bg-light rounded d-flex align-items-center justify-content-start gap-4 p-4">
                            <i class="fa fa-chart-area fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">동아리 가입 회원 수</p>
                                <h6 class="mb-0">${countClubMember}</h6>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            
            <br>
            
            
            <!-- 공지사항 5개 -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h5 class="mb-0">공지사항</h5>
                        <a href="/notice/list">더보기</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered mb-0">
                        	<colgroup>
								<col style="width: 11%;">
								<col style="width: 61%;">
								<col style="width: 29%;">
							</colgroup>
                            <thead>
                                <tr class="text-dark">
                                    <th>번호</th>
									<th>제목</th>
									<th>작성일</th>
                                </tr>
                            </thead>
                            <tbody>
                         <c:forEach var="notice" items="${mainNoticeList}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td><a href="/notice/read?&noticeNum=${notice.noticeNum}">${notice.title}</a></td>
								<td><fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <br>
            
             
            <!-- 동아리 목록 5개 -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h5 class="mb-0">동아리</h5>
                        <a href="/club/list">더보기</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered mb-0">
                        	<colgroup>
								<col style="width: 11%;">
								<col style="width: 61%;">
								<col style="width: 29%;">
							</colgroup>
                            <thead>
                                <tr class="text-dark">
                                    <th>번호</th>
									<th>동아리명</th>
									<th>개설일</th>
                                </tr>
                            </thead>
                            <tbody>
                         <c:forEach var="club" items="${mainClubList}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td><a href="/club/read?&clubNum=${club.clubNum}">${club.clubName}</a></td>
								<td><fmt:formatDate value="${club.regDate}" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <br>
            
            <!-- 동아리 게시글 목록 5개 -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h5 class="mb-0">동아리 게시판</h5>
                        <a href="/clubBoard/list">더보기</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered mb-0">
                        	<colgroup>
								<col style="width: 10%;">
								<col style="width: 20%;">
								<col style="width: 35%;">
								<col style="width: 25%;">
							</colgroup>
                            <thead>
                                <tr class="text-dark">
                                    <th>번호</th>
									<th>동아리명</th>
									<th>제목</th>
									<th>작성일</th>
                                </tr>
                            </thead>
                            <tbody>
                         <c:forEach var="board" items="${mainBoardList}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${board.clubName}</td>
								<td><a href="/clubBoard/read?&boardNum=${board.boardNum}">${board.title}</a></td>
								<td><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <br><br>
</body>
</html>