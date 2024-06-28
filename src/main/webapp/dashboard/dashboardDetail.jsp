<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
i {
	font-face: 'Nucleo'
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
<link href="/dashboard./assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>
<link href="/dashboard/assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- CSS Files -->
<link id="pagestyle"
	href="/dashboard/assets/css/argon-dashboard.css?v=2.0.4"
	rel="stylesheet" />
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
				href="/index.jsp" target="_blank"> <img
				src="/dashboard/assets/img/logo-ct-dark.png"
				class="navbar-brand-img h-100" alt="main_logo"> <span
				class="ms-1 font-weight-bold justify-content-center align-items-center">Gamebit</span>
			</a>
		</div>
		<hr class="horizontal dark mt-0">
		<div class="collapse navbar-collapse  w-auto "
			id="sidenav-collapse-main">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="/showMain.dashBoard">
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
					href="../pages/profile.html">
						<div
							class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
							<i class="ni ni-single-02 text-dark text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">관리자 프로필</span> <!-- 관리자 프로필(로그인 기능 연계) -->
				</a></li>
				<li class="nav-item"><a class="nav-link "
					href="../pages/sign-up.html">
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
		<nav
			class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl "
			id="navbarBlur" data-scroll="false">
			<div class="container-fluid py-1 px-3">
				<nav aria-label="breadcrumb">
					<ol
						class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
						<li class="breadcrumb-item text-sm"><a
							class="opacity-5 text-white" href="javascript:;">Pages</a></li>
						<li class="breadcrumb-item text-sm text-white active"
							aria-current="page">Dashboard</li>
					</ol>
					<h6 class="font-weight-bolder text-white mb-0">Dashboard</h6>
				</nav>
			</div>
		</nav>
		<!-- End Navbar -->
		<div class="container-fluid py-4">
			<div class="row">
				<div class="col-12">
					<div class="card mb-4">
						<div class="card-header pb-0">
							<h6>유저</h6>
						</div>
						<div class="card-body px-0 pt-0 pb-2">
							<div class="table-responsive p-0">
								<table class="table align-items-center mb-0">
									<thead>
										<tr>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">이름/닉네임</th>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">전화번호/이메일</th>
											<th
												class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">상태</th>
											<th
												class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">가입일</th>
											<th class="text-secondary opacity-7"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="allUserList" items="${allUserList}">
											<tr>
												<td>
													<div class="d-flex px-2 py-1">
														<div class="d-flex flex-column justify-content-center">
															<h6 class="mb-0 text-sm">${allUserList.userName}</h6>
															<p class="text-xs text-secondary mb-0">${allUserList.nickName}</p>
														</div>
													</div>
												</td>
												<td>
													<p class="text-xs font-weight-bold mb-0">${allUserList.phone}</p>
													<p class="text-xs text-secondary mb-0">${allUserList.email}</p>
												</td>
												<td class="align-middle text-center text-sm"><c:choose>
														<c:when test="${allUserList.blacklistSeq == 0}">
															<span class="badge badge-sm bg-gradient-success">활성상태</span>
														</c:when>
														<c:otherwise>
															<span class="badge badge-sm bg-gradient-secondary">비활성상태</span>
														</c:otherwise>
													</c:choose></td>
												<td class="align-middle text-center"><span
													class="text-secondary text-xs font-weight-bold">${allUserList.join_date}</span>
												</td>
												<td class="align-middle"><a
													href="/showUser.dashBoard?userSeq=${allUserList.userSeq}"
													class="text-secondary font-weight-bold text-xs"
													data-toggle="tooltip" data-original-title="Edit user">
														<!-- 유저 수정 버튼 --> Edit
												</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card mb-4">
						<div class="card-header pb-0">
							<h6>게시글</h6>
						</div>
						<div class="card-body px-0 pt-0 pb-2">
							<div class="table-responsive p-0">
								<table
									class="table align-items-center justify-content-center mb-0">
									<thead>
										<tr>
											<th class="text-uppercase text-secondary font-weight-bolder">타이틀</th>
											<th
												class="text-uppercase text-secondary font-weight-bolder ps-2">내용</th>
											<th
												class="text-uppercase text-secondary font-weight-bolder ps-2">작성자</th>
											<th
												class="text-uppercase text-secondary font-weight-bolder text-center ps-2">작성시간</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="allPostList" items="${allPostList }">
											<tr>
												<td>
													<div class="d-flex px-2">
														<div class="my-auto">
															<h6 class="mb-0 text-sm">${allPostList.title}</h6>
														</div>
													</div>
												</td>
												<td>
													<p class="text-sm font-weight-bold mb-0"
														style="width: 200px; /* 원하는 너비 설정 */ white-space: nowrap; /* 한 줄로 표시 */ overflow: hidden; /* 넘치는 부분 숨기기 */ text-overflow: ellipsis;">${allPostList.contents}</p>
												</td>
												<td><span class="text-xs font-weight-bold">${allPostList.writer}</span>
												</td>
												<td class="align-middle text-center">
													<div
														class="d-flex align-items-center justify-content-center">
														<span class="me-2 text-xs font-weight-bold">${allPostList.write_date }</span>
													</div>
												</td>
												<td class="align-middle">
													<button class="btn btn-link text-secondary mb-0">
														<i class="fa fa-ellipsis-v text-xs"
															onclick="location.href='/detail.board?seq=${allPostList.seq}'"></i>
														<!-- 포스트 수정 링크 -->
													</button>
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
	</main>
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
				<a href="javascript:void(0)" class="switch-trigger background-color">
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
					<button class="btn bg-gradient-primary w-100 px-3 mb-2 active me-2"
						data-class="bg-white" onclick="sidebarType(this)">White</button>
					<button class="btn bg-gradient-primary w-100 px-3 mb-2"
						data-class="bg-default" onclick="sidebarType(this)">Dark</button>
				</div>
				<p class="text-sm d-xl-none d-block mt-2">You can change the
					sidenav type just on desktop view.</p>
				<!-- Navbar Fixed -->
				<div class="d-flex my-3">
					<h6 class="mb-0">Navbar Fixed</h6>
					<div class="form-check form-switch ps-0 ms-auto my-auto">
						<input class="form-check-input mt-1 ms-auto" type="checkbox"
							id="navbarFixed" onclick="navbarFixed(this)">
					</div>
				</div>
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
	<!--   Core JS Files   -->
	<script src="/dashboard/assets/js/core/popper.min.js"></script>
	<script src="/dashboard/assets/js/core/bootstrap.min.js"></script>
	<script src="/dashboard/assets/js/plugins/perfect-scrollbar.min.js"></script>
	<script src="/dashboard/assets/js/plugins/smooth-scrollbar.min.js"></script>
	<script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="/dashboard/assets/js/argon-dashboard.min.js?v=2.0.4"></script>
</body>

</html>