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
				href=" https://demos.creative-tim.com/argon-dashboard/pages/dashboard.html "
				target="_blank"> <img
				src="/dashboard/assets/img/logo-ct-dark.png"
				class="navbar-brand-img h-100" alt="main_logo"> <span
				class="ms-1 font-weight-bold justify-content-center align-items-center">Gamebit</span>
			</a>
		</div>
		<hr class="horizontal dark mt-0">
		<div class="collapse navbar-collapse  w-auto "
			id="sidenav-collapse-main">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link active"
					href="dashboardMain.html">
						<div
							class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
							<i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">Dashboard</span>
				</a></li>
				<li class="nav-item"><a class="nav-link "
					href="dashboardBoardStatic.html">
						<div
							class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
							<i class="ni ni-calendar-grid-58 text-warning text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">Tables</span>
				</a></li>
				<li class="nav-item"><a class="nav-link "
					href="dashboardUserStatic.html">
						<div
							class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
							<i class="ni ni-credit-card text-success text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">Billing</span>
				</a></li>
				<li class="nav-item mt-3">
					<h6
						class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6">Account
						pages</h6>
				</li>
				<li class="nav-item"><a class="nav-link "
					href="../pages/profile.html">
						<div
							class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
							<i class="ni ni-single-02 text-dark text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">Profile</span>
				</a></li>
				<li class="nav-item"><a class="nav-link "
					href="../pages/sign-up.html">
						<div
							class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
							<i class="ni ni-collection text-info text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">Sign Up</span>
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
						<p class="text-xs font-weight-bold mb-0">Please check our docs</p>
					</div>
				</div>
			</div>
			<a
				href="https://www.creative-tim.com/learning-lab/bootstrap/license/argon-dashboard"
				target="_blank" class="btn btn-dark btn-sm w-100 mb-3">Documentation</a>
			<a class="btn btn-primary btn-sm mb-0 w-100"
				href="https://www.creative-tim.com/product/argon-dashboard-pro?ref=sidebarfree"
				type="button">Upgrade to pro</a>
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
							<h5 class="mb-1">Sayo Kravits</h5>
							<p class="mb-0 font-weight-bold text-sm">Public Relations</p>
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
								<c:if test="${not empty blockedReason }">
									<!-- sweet alert로 추가 -->
									<button class="btn btn-primary btn-sm ms-2"
										onclick='deleteBlackList()'>블랙리스트 해제</button>
								</c:if>
								<button class="btn btn-danger btn-sm ms-2"
									data-bs-toggle="modal" data-bs-target="#updateUserInfoModal">유저
									정보 수정</button>
							</div>
						</div>
						<div class="card-body">
							<p class="text-uppercase text-sm">User Information</p>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="example-text-input" class="username">유저 이름</label>
										<input class="form-control" type="text"
											id = "username" value="${memberInfo.userName }" readonly>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="example-text-input" class="email">이메일 주소</label> <input
											id ="email" class="form-control" type="email"
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
											id="phone" class="form-control" type="text" value="${memberInfo.phone }"
											readonly>
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
							<c:if test="${memberInfo.blacklistSeq != 0 }">
								<hr class="horizontal dark">
								<p class="text-uppercase text-sm">정지 사유</p>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<input class="form-control" type="text"
												value="${blockedReason}">
										</div>
									</div>
								</div>
							</c:if>
							<!-- 블랙리스트 정보 있으면 나타나는 부분 끝-->
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card card-profile">
						<img src="/dashboard/assets/img/bg-profile.jpg"
							alt="Image placeholder" class="card-img-top">
						<div class="row justify-content-center">
							<div class="col-4 col-lg-4 order-lg-2">
								<div class="mt-n4 mt-lg-n6 mb-4 mb-lg-0">
									<a href="javascript:;"> <img
										src="/dashboard/assets/img/team-2.jpg"
										class="rounded-circle img-fluid border border-2 border-white">
									</a>
								</div>
							</div>
						</div>
						<div
							class="card-header text-center border-0 pt-0 pt-lg-2 pb-4 pb-lg-3">
							<div class="d-flex justify-content-between">
								<a href="javascript:;"
									class="btn btn-sm btn-info mb-0 d-none d-lg-block">Connect</a>
								<a href="javascript:;"
									class="btn btn-sm btn-info mb-0 d-block d-lg-none"><i
									class="ni ni-collection"></i></a> <a href="javascript:;"
									class="btn btn-sm btn-dark float-right mb-0 d-none d-lg-block">Message</a>
								<a href="javascript:;"
									class="btn btn-sm btn-dark float-right mb-0 d-block d-lg-none"><i
									class="ni ni-email-83"></i></a>
							</div>
						</div>
						<div class="card-body pt-0">
							<div class="row">
								<div class="col">
									<div class="d-flex justify-content-center">
										<div class="d-grid text-center">
											<span class="text-lg font-weight-bolder">22</span> <span
												class="text-sm opacity-8">Friends</span>
										</div>
										<div class="d-grid text-center mx-4">
											<span class="text-lg font-weight-bolder">10</span> <span
												class="text-sm opacity-8">Photos</span>
										</div>
										<div class="d-grid text-center">
											<span class="text-lg font-weight-bolder">89</span> <span
												class="text-sm opacity-8">Comments</span>
										</div>
									</div>
								</div>
							</div>
							<div class="text-center mt-4">
								<h5>
									Mark Davis<span class="font-weight-light">, 35</span>
								</h5>
								<div class="h6 font-weight-300">
									<i class="ni location_pin mr-2"></i>Bucharest, Romania
								</div>
								<div class="h6 mt-4">
									<i class="ni business_briefcase-24 mr-2"></i>Solution Manager -
									Creative Tim Officer
								</div>
								<div>
									<i class="ni education_hat mr-2"></i>University of Computer
									Science
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
													<p class="text-xs font-weight-bold mb-0"></p>
													<h6 class="text-sm">
														<input type="button" class="btn btn-primary" id="postEdit" value="수정">
														<input type="hidden" value="${post.seq}" id="postSeq">
														<input type="button" class="btn btn-danger" id="postDelete" value="삭제">
													</h6>
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
		<footer class="footer pt-3  ">
			<div class="container-fluid">
				<div class="row align-items-center justify-content-lg-between">
					<div class="col-lg-6 mb-lg-0 mb-4">
						<div
							class="copyright text-center text-sm text-muted text-lg-start">
							©
							<script>
								document.write(new Date().getFullYear())
							</script>
							, made with <i class="fa fa-heart"></i> by <a
								href="https://www.creative-tim.com" class="font-weight-bold"
								target="_blank">Creative Tim</a> for a better web.
						</div>
					</div>
					<div class="col-lg-6">
						<ul
							class="nav nav-footer justify-content-center justify-content-lg-end">
							<li class="nav-item"><a href="https://www.creative-tim.com"
								class="nav-link text-muted" target="_blank">Creative Tim</a></li>
							<li class="nav-item"><a
								href="https://www.creative-tim.com/presentation"
								class="nav-link text-muted" target="_blank">About Us</a></li>
							<li class="nav-item"><a
								href="https://www.creative-tim.com/blog"
								class="nav-link text-muted" target="_blank">Blog</a></li>
							<li class="nav-item"><a
								href="https://www.creative-tim.com/license"
								class="nav-link pe-0 text-muted" target="_blank">License</a></li>
						</ul>
					</div>
				</div>
			</div>
		</footer>
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
						<label for="userSeq" class="userSeq">닉네임</label>
						<input type="hidden" id="userSeq" name="userSeq" value="${memberInfo.userSeq }" >
						<label for="updatedNickname" class="updateNickname">닉네임</label>
						<input id="updatedNickname" class="form-control" name="updateNickname" type="text" value="${memberInfo.nickName }"> 
						<label for="updatedEmail" class="updatedEmail">이메일</label> 
						<input id="updatedEmail" class="form-control" name="updateEmail" type="text" value="${memberInfo.email }"> 
						<label for="updatedPhone" class="updatedPhone">전화번호</label> 
						<input id="updatedPhone" class="form-control" name="updatePhone" type="text" value="${memberInfo.phone}">
					</div>
					<div class="modal-footer col flex-nowrap">
						<input type="submit" value="수정"
							class="form-control submit px-3 rounded-right w-50" id="userInfo-update"> 
						<input type="submit" value="닫기" class="w-50 form-control submit px-3 rounded-right"
							data-bs-dismiss="modal" aria-label="Close">
					</div>
				</div>
			</div>
		</div>
	<div class="modal fade" id="updatePostModal"
			data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content d-flex" id="blocked-reason-modal">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
					</div>
					<div class="modal-body">
						<!-- 닉네임 검사 필요함 (연결) -->
						<label for="boardSeq" class="boardSeq">닉네임</label>
						<input type="hidden" id="boardSeq" name="boardSeq" value="${post.seq }">
						<label for="updatedTitle" class="updatedTitle"></label>
						<input id="updatedTitle" class="form-control" name="updatedTitle" type="text" value="${memberInfo.nickName }">
						<label for="updatedContents" class="updatedContents">닉네임</label>
						<textarea id="updatedContents" class="form-control" name="updatedContents"></textarea> 
					</div>
					<div class="modal-footer col flex-nowrap">
						<input type="submit" value="수정"
							class="form-control submit px-3 rounded-right w-50" id="post-update"> 
						<input type="submit" value="닫기" class="w-50 form-control submit px-3 rounded-right"
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

	function deleteBlackList() {
		$.ajax({
			url : "/deleteBlackList.dashBoard",
			method : "post",
			complete : function(data, status) {
				console.log(data);
			}
		})
	}
	

	$("#userInfo-update").on("click", function() {
	    console.log("유저 정보 관리자가 업데이트하려고 함!!");
	    $.ajax({
	        url : "/updateUser.dashBoard",
	        method : "get",
	        contentType: 'application/json; charset=UTF-8',
	        dataType: 'json',
	        data : {
	            "userSeq": $("#userSeq").val(),
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
	        error: function(error) {
	            console.error("업데이트 실패:", error);
	        }
	    });
	});
	
	let seq =$("#postSeq").val()
	$("#postEdit").on("click", function(){
		location.href="/detail.board?seq="+seq;
	})
	
	$("#postDelete").on("click", function(){
		location.href="/delete.board?seq="+seq;
	})
</script>
</html>