<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--
=========================================================
* Argon Dashboard 2 - v2.0.4
=========================================================

* Product Page: https://www.creative-tim.com/product/argon-dashboard
* Copyright 2022 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://www.creative-tim.com/license)
* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<!DOCTYPE html>
<html lang="en">
<style>
.swal2-popup {
	font-size: 1.0rem !important;
	font-family: 'NucleoIcons';
}

#figure {
	background: rgba(55, 55, 55, 0.2);
	position: relative;
}

#figcaption {
	color: white;
	padding: 1em;
	top: 0;
	position: absolute;
}

img {
	display: block;
}
</style>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="/dashboard/assets/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="/dashboard/assets/img/favicon.png">
<title>Argon Dashboard 2 by Creative Tim</title>
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet" />
<!-- Nucleo Icons -->
<link href="/dashboard/assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="/dashboard/assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>
<link href="/dashboard/assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- CSS Files -->
<link id="pagestyle"
	href="/dashboard/assets/css/argon-dashboard.css?v=2.0.4"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
</head>

<body id="main" class="g-sidenav-show   bg-gray-100">
	<div class="min-height-300 bg-primary position-absolute w-100"></div>
		<aside id="side-nav-color"
		class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 "
		id="sidenav-main">
		<div class="sidenav-header">
			<i
				class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
				aria-hidden="true" id="iconSidenav"></i> <a class="navbar-brand m-0"
				href=" /index.jsp "
				target="_blank"> <img
				src="/dashboard/assets/img/gamebit-logo.png"
				class="navbar-brand-img h-100" alt="main_logo"> <span
				class="ms-1 font-weight-bold justify-content-center align-items-center" style="font-size: 1.5rem">Gamebit</span>
			</a>
		</div>
		<hr class="horizontal dark mt-0">
		<div class="collapse navbar-collapse  w-auto "
			id="sidenav-collapse-main">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="/dashboard/dashboardIndex.jsp">
						<div
							class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
							<i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">메인</span>
				</a></li>
				<li class="nav-item"><a class="nav-link active" 
					href="/showDetail.dashBoard">
						<div
							class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
							<i class="ni ni-credit-card text-success text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">모아보기</span>
				</a></li>
				<li class="nav-item mt-3">
					<h6
						class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6">Account
						pages</h6>
				</li>
				<li class="nav-item"><a class="nav-link "
					href="/showUser.dashBoard?userSeq=${userSeq}">
						<div
							class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
							<i class="ni ni-single-02 text-dark text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">프로필</span> <!-- 관리자 프로필(로그인 기능 연계) -->
				</a></li>
				<li class="nav-item"><a class="nav-link "
					href="/logout.members">
						<div
							class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
							<i class="ni ni-collection text-info text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">로그아웃</span> <!-- 관리자 로그아웃 (로그인 기능 연계)-->
				</a></li>
			</ul>
		</div>
		<div class="sidenav-footer mx-3 ">
			<div class="card card-plain shadow-none" id="sidenavCard">
				<img class="w-50 mx-auto"
					src="/dashboard/assets/img/illustrations/icon-documentation.svg"
					alt="sidebar_illustration">
				<div class="card-body text-center p-3 w-100 pt-0">
					<div class="docs-info">
						<h6 class="mb-0">Need help?</h6>
						<p class="text-xs font-weight-bold mb-0">Please leave us Question</p>
					</div>
				</div>
			</div>
			<a class="btn btn-primary btn-sm mb-0 w-100"
				href="/list.qboard"
				type="button">QnA 게시판</a>
		</div>
	</aside>
	<main class="main-content position-relative border-radius-lg ">
		<!-- Navbar -->
		<!-- End Navbar -->
		<div class="card shadow-lg mx-4 card-profile-bottom">
			<div class="card-body p-3">
				<div class="row gx-4">
					<div class="col-auto"></div>
					<div class="col-auto my-auto">
						<div class="h-100">
							<h5 class="mb-1">${memberInfo.userName }</h5>

							<c:choose>
								<c:when test="${memberInfo.adminKey eq 0}">
									<p class="mb-0 font-weight-bold text-sm" id="userAuth">일반
										사용자</p>
								</c:when>
								<c:when test="${memberInfo.adminKey eq 1}">
									<p class="mb-0 font-weight-bold text-sm" id="userAuth">중간
										관리자</p>
								</c:when>
								<c:when test="${memberInfo.adminKey eq 2}">
									<p class="mb-0 font-weight-bold text-sm" id="userAuth">최고
										관리자</p>
								</c:when>
							</c:choose>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="container-fluid py-4">
			<div class="row">
				<div class="col-md-8">
					<div class="card">
						<div class="card-header pb-0">
							<p class="mb-0">유저 기본 정보</p>
							<div class="d-flex flex-row-reverse align-items-center">

								<!-- blocked 된 이유가 없으면 블랙리스트로 추가할 수 있도록 -->
								<c:if test="${empty blockedReason}">
									<button class="btn btn-primary btn-sm ms-2"
										data-bs-toggle="modal" data-bs-target="#addBlacklistModal">블랙리스트
										등록</button>
								</c:if>
								<!-- swal.fire 추가 -->
								<c:if test="${not empty blockedReason }">
									<button class="btn btn-primary btn-sm ms-2"
										onclick='deleteBlackList()'>블랙리스트 해제</button>
								</c:if>
								<c:if test="${adminKey eq 2}">
									<button class="btn btn-danger btn-sm ms-2"
										data-bs-toggle="modal" data-bs-target="#updateUserInfoModal">유저
										정보 수정</button>
								</c:if>
								<c:if test="${adminKey eq 2 && userAdminKey eq 0}">
									<button class="btn btn-info btn-sm ms-2"
										onclick='adminPromotion()'>관리자 승격</button>
								</c:if>

							</div>
						</div>

						<div class="card-body">
							<p class="text-uppercase text-sm">User Information</p>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="example-text-input" class="username">유저 이름</label>
										<input class="form-control" type="text" id="username"
											value="${memberInfo.userName }" readonly>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="example-text-input" class="email">이메일 주소</label> <input
											id="email" class="form-control" type="email"
											value="${memberInfo.email }" readonly>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="example-text-input" class="nickname">닉네임</label> <input
											id="nickname" class="form-control" type="text"
											value="${memberInfo.nickName }" readonly>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="example-text-input" class="phone">전화번호</label> <input
											id="phone" class="form-control" type="text"
											value="${memberInfo.phone }" readonly>
									</div>
								</div>
							</div>
							<hr class="horizontal dark">
							<p class="text-uppercase text-sm">상세 정보</p>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="example-text-input" class="form-control-label">유저
											상태</label>
										<c:choose>
											<c:when test="${memberInfo.blacklistSeq == 0}">
												<span class="badge badge-sm bg-gradient-success">활성상태</span>
											</c:when>
											<c:otherwise>
												<span class="badge badge-sm bg-gradient-secondary">비활성상태</span>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								<c:if test="${memberInfo.blacklistSeq == 0 }">
									<div class="col-md-6">
										<div class="form-group">
											<label for="example-text-input" class="form-control-label">생년월일</label>
											<input class="form-control" type="text"
												value="${memberInfo.birth_date }" readonly>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="example-text-input" class="form-control-label">성별</label>
											<c:choose>
												<c:when test="${memberInfo.gender == 'F'}">
													<input class="form-control" type="text" value="여" readonly>
												</c:when>
												<c:otherwise>
													<input class="form-control" type="text" value="남" readonly>
												</c:otherwise>
											</c:choose>

										</div>
									</div>
								</c:if>
								<c:if test="${memberInfo.blacklistSeq != 0 }">
									<div class="col-md-4">
										<div class="form-group">
											<label for="example-text-input" class="form-control-label">생년월일</label>
											<input class="form-control" type="text"
												value="${memberInfo.birth_date }" readonly>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label for="example-text-input" class="form-control-label">성별</label>
											<c:choose>
												<c:when test="${memberInfo.gender == 'F'}">
													<input class="form-control" type="text" value="여" readonly>
												</c:when>
												<c:otherwise>
													<input class="form-control" type="text" value="남" readonly>
												</c:otherwise>
											</c:choose>

										</div>
									</div>


									<div class="col-md-4">
										<div class="form-group">
											<label for="example-text-input" class="form-control-label">정지
												코드</label> <input class="form-control" type="text"
												value="${memberInfo.blacklistSeq }" readonly>
										</div>
									</div>
								</c:if>
							</div>

							<hr class="horizontal dark">
							<p class="text-uppercase text-sm">정지 사유</p>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<c:if test="${memberInfo.blacklistSeq != 0 }">
											<input class="form-control" type="text"
												value="${blockedReason}">
										</c:if>
									</div>
								</div>
							</div>

							<!-- 블랙리스트 정보 있으면 나타나는 부분 끝-->
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card card-profile">
						<div id="figure">
							<img src="/dashboard/assets/img/bg-profile.jpg"
								alt="Image placeholder" class="card-img-top"
								style="position: relative; opacity: 50%" id="">
							<h5 style="position: absolute" id="figcaption">사용자 통계</h5>
						</div>
						<div class="row justify-content-center">
							<div class="card-body">
								<div class="row">
									<div class="col">
										<div class="card">
											<div class="card-body p-3">
												<div class="row">
													<div class="col-8">
														<div class="numbers">
															<p class="text-lg mb-0 text-uppercase font-weight-bold">이
																유저가 등록한 게시물 갯수</p>
															<h5 class="font-weight-bolder">${postCountPerUser}</h5>
														</div>
													</div>
													<div class="col-4 text-end">
														<div
															class="icon icon-shape bg-gradient-primary shadow-primary text-center rounded-circle">
															<i class="fa-regular fa-paste text-lg" style="font-family: 'FontAwesome';"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="card-body pt-0">
								<div class="row">
									<div class="col">
										<div class="card">
											<div class="card-body p-3">
												<div class="row">
													<div class="col-8">
														<div class="numbers">
															<p class="text-lg mb-0 text-uppercase font-weight-bold">이
																유저가 등록한 댓글 갯수</p>
															<h5 class="font-weight-bolder">${replyCountPerUser }</h5>
														</div>
													</div>
													<div class="col-4 text-end">
														<div
															class="icon icon-shape bg-gradient-primary shadow-primary text-center rounded-circle">
															<i class="fa-solid fa-reply text-lg" style="font-family: 'FontAwesome'"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>


					</div>
				</div>
			</div>

		</div>
		<div class="container-fluid py-4">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header pb-0">
							<div class="d-flex align-items-center">
								<p class="mb-0">게시글 목록</p>
								<!-- blocked 된 이유가 없으면 블랙리스트로 추가할 수 있도록 -->
							</div>
						</div>
						<div class="card-body">
							<table class="table align-items-center ">
								<tbody>
									<c:forEach var="post" items="${userBoard }">
										<tr>
											<td class="w-30">
												<div class="d-flex px-2 py-1 align-items-center">
													<div class="ms-4">
														<p class="d-block text-xs font-weight-bold mb-0">타이틀</p>
														<h6 class="text-sm mb-0"
															style="width: 200px; /* 원하는 너비 설정 */ white-space: nowrap; /* 한 줄로 표시 */ overflow: hidden; /* 넘치는 부분 숨기기 */ text-overflow: ellipsis;">${post.title}</h6>
													</div>
												</div>
											</td>
											<td>
												<div class="text-center">
													<p class="text-xs font-weight-bold mb-0">작성자:</p>
													<h6 class="text-sm mb-0">${post.writer}</h6>
												</div>
											</td>
											<td>
												<div class="text-center">
													<p class="text-xs font-weight-bold mb-0">작성 일자:</p>
													<h6 class="text-sm mb-0">${post.write_date }</h6>
												</div>
											</td>
											<td class="align-middle text-sm">
												<div class="col text-center">
													<p class="text-xs font-weight-bold mb-0">조회수</p>
													<h6 class="text-sm mb-0">${post.view_count }</h6>
												</div>
											</td>
											<td class="align-middle text-sm">
												<div class="col text-center">
													<c:if test="${adminKey eq 2}">
														<p class="text-xs font-weight-bold mb-0"></p>
														<h6 class="text-sm">
															<input type="button" class="btn btn-primary"
																id="postEdit" value="수정"> <input type="hidden"
																value="${post.seq}" id="postSeq"> <input
																type="button" class="btn btn-danger" id="postDelete"
																value="삭제">
														</h6>
													</c:if>
												</div>
											</td>
										</tr>

									</c:forEach>
								</tbody>
							</table>

						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<div class="fixed-plugin">
			<a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
				<i class="fa fa-cog py-2"> </i>
			</a>
			<div class="card shadow-lg">
				<div class="card-header pb-0 pt-3 ">
					<div class="float-start">
						<h5 class="mt-3 mb-0">Argon Configurator</h5>
						<p>See our dashboard options.</p>
					</div>
					<div class="float-end mt-4">
						<button
							class="btn btn-link text-dark p-0 fixed-plugin-close-button">
							<i class="fa fa-close"></i>
						</button>
					</div>
					<!-- End Toggle Button -->
				</div>
				<hr class="horizontal dark my-1">
				<div class="card-body pt-sm-3 pt-0 overflow-auto">
					<!-- Sidebar Backgrounds -->
					<div>
						<h6 class="mb-0">Sidebar Colors</h6>
					</div>
					<a href="javascript:void(0)"
						class="switch-trigger background-color">
						<div class="badge-colors my-2 text-start">
							<span class="badge filter bg-gradient-primary active"
								data-color="primary" onclick="sidebarColor(this)"></span> <span
								class="badge filter bg-gradient-dark" data-color="dark"
								onclick="sidebarColor(this)"></span> <span
								class="badge filter bg-gradient-info" data-color="info"
								onclick="sidebarColor(this)"></span> <span
								class="badge filter bg-gradient-success" data-color="success"
								onclick="sidebarColor(this)"></span> <span
								class="badge filter bg-gradient-warning" data-color="warning"
								onclick="sidebarColor(this)"></span> <span
								class="badge filter bg-gradient-danger" data-color="danger"
								onclick="sidebarColor(this)"></span>
						</div>
					</a>
					<!-- Sidenav Type -->
					<div class="mt-3">
						<h6 class="mb-0">Sidenav Type</h6>
						<p class="text-sm">Choose between 2 different sidenav types.</p>
					</div>
					<div class="d-flex">
						<button
							class="btn bg-gradient-primary w-100 px-3 mb-2 active me-2"
							data-class="bg-white" onclick="sidebarType(this)">White</button>
						<button class="btn bg-gradient-primary w-100 px-3 mb-2"
							data-class="bg-default" onclick="sidebarType(this)">Dark</button>
					</div>
					<p class="text-sm d-xl-none d-block mt-2">You can change the
						sidenav type just on desktop view.</p>
					<!-- Navbar Fixed -->
					<hr class="horizontal dark my-sm-4">
					<div class="mt-2 mb-5 d-flex">
						<h6 class="mb-0">Light / Dark</h6>
						<div class="form-check form-switch ps-0 ms-auto my-auto">
							<input class="form-check-input mt-1 ms-auto" type="checkbox"
								id="dark-version" onclick="darkMode(this)">
						</div>
					</div>
					<a class="btn bg-gradient-dark w-100"
						href="https://www.creative-tim.com/product/argon-dashboard">Free
						Download</a> <a class="btn btn-outline-dark w-100"
						href="https://www.creative-tim.com/learning-lab/bootstrap/license/argon-dashboard">View
						documentation</a>
					<div class="w-100 text-center">
						<a class="github-button"
							href="https://github.com/creativetimofficial/argon-dashboard"
							data-icon="octicon-star" data-size="large" data-show-count="true"
							aria-label="Star creativetimofficial/argon-dashboard on GitHub">Star</a>
						<h6 class="mt-3">Thank you for sharing!</h6>
						<a
							href="https://twitter.com/intent/tweet?text=Check%20Argon%20Dashboard%20made%20by%20%40CreativeTim%20%23webdesign%20%23dashboard%20%23bootstrap5&amp;url=https%3A%2F%2Fwww.creative-tim.com%2Fproduct%2Fargon-dashboard"
							class="btn btn-dark mb-0 me-2" target="_blank"> <i
							class="fab fa-twitter me-1" aria-hidden="true"></i> Tweet
						</a> <a
							href="https://www.facebook.com/sharer/sharer.php?u=https://www.creative-tim.com/product/argon-dashboard"
							class="btn btn-dark mb-0 me-2" target="_blank"> <i
							class="fab fa-facebook-square me-1" aria-hidden="true"></i> Share
						</a>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="addBlacklistModal"
			data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content" id="blocked-reason-modal">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
						<button type="button" class="bg-primary btn-close"
							data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body pt-md-3 pb-5 px-4 px-md-5 text-center">
						<h4>블랙리스트 추가</h4>
						<h5 class="m-2">블랙리스트 추가 사유를 선택해주세요.</h5>
						<form action="#" class="subscribe-form">
							<div class="formgroup d-flex">
								<select class="form-select" aria-label="Default select example">
									<option selected>Open this select menu</option>
									<option value="1">욕설 또는 악의적인 비방</option>
									<option value="2">광고성 계정</option>
									<option value="3">음란성 게시글</option>
								</select> <input type="submit" value="Subscribe"
									class="form-control submit px-3 rounded-right"
									id="blacklist-reason-submit">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="updateUserInfoModal"
			data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content d-flex" id="blocked-reason-modal">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
					</div>
					<div class="modal-body">
						<!-- 닉네임 검사 필요함 (연결) -->
						<label for="userSeq" class="userSeq">닉네임</label> <input
							type="hidden" id="userSeq" name="userSeq"
							value="${memberInfo.userSeq }"> <label
							for="updatedNickname" class="updateNickname">닉네임</label> <input
							id="updatedNickname" class="form-control" name="updateNickname"
							type="text" value="${memberInfo.nickName }"> <label
							for="updatedEmail" class="updatedEmail">이메일</label> <input
							id="updatedEmail" class="form-control" name="updateEmail"
							type="text" value="${memberInfo.email }"> <label
							for="updatedPhone" class="updatedPhone">전화번호</label> <input
							id="updatedPhone" class="form-control" name="updatePhone"
							type="text" value="${memberInfo.phone}">
					</div>
					<div class="modal-footer col flex-nowrap">
						<input type="submit" value="수정"
							class="form-control submit px-3 rounded-right w-50"
							id="userInfo-update"> <input type="submit" value="닫기"
							class="w-50 form-control submit px-3 rounded-right"
							data-bs-dismiss="modal" aria-label="Close">
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="updatePostModal" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content d-flex" id="blocked-reason-modal">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
					</div>
					<div class="modal-body">
						<!-- 닉네임 검사 필요함 (연결) -->
						<label for="boardSeq" class="boardSeq">닉네임</label> <input
							type="hidden" id="boardSeq" name="boardSeq" value="${post.seq }">
						<label for="updatedTitle" class="updatedTitle"></label> <input
							id="updatedTitle" class="form-control" name="updatedTitle"
							type="text" value="${memberInfo.nickName }"> <label
							for="updatedContents" class="updatedContents">닉네임</label>
						<textarea id="updatedContents" class="form-control"
							name="updatedContents"></textarea>
					</div>
					<div class="modal-footer col flex-nowrap">
						<input type="submit" value="수정"
							class="form-control submit px-3 rounded-right w-50"
							id="post-update"> <input type="submit" value="닫기"
							class="w-50 form-control submit px-3 rounded-right"
							data-bs-dismiss="modal" aria-label="Close">
					</div>
				</div>
			</div>
		</div>
		<!--   Core JS Files   -->
		<script src="/dashboard/assets/js/core/popper.js"></script>
		<script src="/dashboard/assets/js/core/bootstrap.min.js"></script>
		<script src="/dashboard/assets/js/plugins/perfect-scrollbar.min.js"></script>
		<script src="/dashboard/assets/js/plugins/smooth-scrollbar.min.js"></script>
		<script src="/dashboard/assets/js/core/popper.js"></script>
		<script src="/dashboard/assets/js/core/bootstrap.min.js"></script>
		<script src="/dashboard/assets/js/core/main.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<script>
			var win = navigator.platform.indexOf('Win') > -1;
			if (win && document.querySelector('#sidenav-scrollbar')) {
				var options = {
					damping : '0.5'
				}
				Scrollbar.init(document.querySelector('#sidenav-scrollbar'),
						options);
			}
		</script>
		<!-- Github buttons -->
		<script async defer src="https://buttons.github.io/buttons.js"></script>
		<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
		<script src="/dashboard/assets/js/argon-dashboard.min.js?v=2.0.4"></script>
</body>
<script>
	$("#blacklist-reason-submit").click(function() {
		$.ajax({
			url : "/addBlackList.dashBoard",
			data : {
				reason : $(".form-select").val()
			},
			method : "post",
			complete : function(data, status) {
				$("#staticBackdrop").modal('hide');
				$('body').removeClass('modal-open');
				$('.modal-backdrop').remove();
			}
		})
	});

	function adminPromotion(){
		Swal.fire({
			  title: "중간 관리자로 추가하시겠습니까?",
			  showDenyButton: true,
			  showCancelButton: true,
			  confirmButtonText: "추가",
			  denyButtonText: `취소`
			}).then((result) => {
			  /* Read more about isConfirmed, isDenied below */
			  if (result.isConfirmed) {
			    Swal.fire("저장되었습니다.", "", "success");
			    $.ajax({
					url : "/addAsAdmin.dashBoard",
					method : "post",
					data:{"userSeq":$("#userSeq").val()},
					success : function(data, status) {
						console.log(data.promotionResult);
						if(data.updateResult === 1){
							console.log($("#userAuth").text())
							$("#userAuth").text('중간 관리자')
							}
					}
				})
			  } else if (result.isDenied) {
			    Swal.fire("저장되지 않았습니다.", "", "info");
			  }
			});
	}
	function deleteBlackList() {
		Swal.fire({
			  title: "블랙리스트에서 삭제하시겠습니까?",
			  showDenyButton: true,
			  showCancelButton: true,
			  confirmButtonText: "추가",
			  denyButtonText: `취소`
			}).then((result) => {
			  /* Read more about isConfirmed, isDenied below */
			  if (result.isConfirmed) {
				  $.ajax({
						url : "/deleteBlackList.dashBoard",
						method : "post",
						complete : function(data, status) {
							console.log(data);
						}
					})
			    Swal.fire("저장되었습니다.", "", "success");
			  } else if (result.isDenied) {
			    Swal.fire("저장되지 않았습니다.", "", "info");
			  }
			});
		
	}

	$("#userInfo-update").on("click", function() {
		console.log("유저 정보 관리자가 업데이트하려고 함!!");
		$.ajax({
			url : "/updateUser.dashBoard",
			method : "get",
			contentType : 'application/json; charset=UTF-8',
			dataType : 'json',
			data : {
				"userSeq" : $("#userSeq").val(),
				"updatedNickname" : $("#updatedNickname").val(),
				"updatedEmail" : $("#updatedEmail").val(),
				"updatedPhone" : $("#updatedPhone").val()
			},
			success : function(response) {
				console.log(response);

				$("#updateUserInfoModal").modal('hide');
				$('body').removeClass('modal-open');
				$('.modal-backdrop').remove();

				$("#email").val(response.email);
				$("#nickname").val(response.nickname);
				$("#phone").val(response.phone);
			},
			error : function(error) {
				console.error("업데이트 실패:", error);
			}
		});
	});

	let seq = $("#postSeq").val()
	$("#postEdit").on("click", function() {
		location.href = "/detail.board?seq=" + seq;
	})

	$("#postDelete").on("click", function() {
		location.href = "/delete.board?seq=" + seq;
	})
</script>
</html>