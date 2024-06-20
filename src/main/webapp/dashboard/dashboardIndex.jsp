<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap Demo</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/6564ea6f25.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
body {
	width: 1500px;
	height: 1000px;
	padding: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
}

#main {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

#body {
	display: flex;
	justify-content: center;
	width: 95%;
	height: 95%;
}

#main-top {
	display: flex;
	width: 95%;
	height: 50%;
	justify-content: center;
	align-items: center;
}

#main-bottom {
	display: flex;
	width: 95%;
	height: 40%;
	justify-content: center;
	align-items: center;
}

#profile-div {
	width: 20%;
	height: 95%;
	margin: 5px;
}

#static-div {
	width: 75%;
	height: 95%;
	margin: 5px;
}

#board-div {
	width: 50%;
	height: 95%;
	margin: 3px;
}

#user-div {
	width: 50%;
	height: 95%;
	margin: 3px;
}

div {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

#menu-button-div {
	width: 5%;
	height: 95%;
	border: none;
}

#sidenav-collapse-main {
	display: none;
	width: 20%;
	position: absolute;
	top: 0;
	left: 0;
	height: 100%;
	background-color: white;
	z-index: 1000;
}

.card-img-top {
	object-fit: cover;
}

#profile {
	width: 100%;
	height: 100%;
	overflow: auto;
	justify-content: center;
	align-items: center;
}

#profile-photo-div {
	width: 100%;
	height: 60%;
	justify-content: center;
	align-items: center;
	display: flex;
}

#profile-photo {
	width: 50%;
	height: 50%;
	border-radius: 50%;
}

.card-body {
	text-align: center;
}
</style>
</head>

<body class="border">
	<div id="sidenav-collapse-main" class="card p-4">
		<ul class="navbar-nav">
			<div style="border: none; padding: 5px;">
				<i id="menu-closing-button" class="fa-solid fa-xmark"
					onclick="menuClosing()"></i>
			</div>
			<li class="nav-item"><a class="nav-link active" href="#">
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
						<i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
					</div> <span class="nav-link-text ms-1">Dashboard</span>
			</a></li>
			<li class="nav-item"><a class="nav-link " href="#">
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
						<i class="ni ni-calendar-grid-58 text-warning text-sm opacity-10"></i>
					</div> <span class="nav-link-text ms-1">Tables</span>
			</a></li>
			<li class="nav-item"><a class="nav-link " href="#">
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
			<li class="nav-item"><a class="nav-link " href="#">
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
						<i class="ni ni-single-02 text-dark text-sm opacity-10"></i>
					</div> <span class="nav-link-text ms-1">Profile</span>
			</a></li>
		</ul>
	</div>
	<div id="main">
		<div id="body" class="row border">
			<div id="main-top" class="card flex-row m-3">
				<div id="menu-button-div"
					style="display: flex; justify-content: center;">
					<div style="display: flex; justify-content: center; border: none;">
						<i id="menu-icon" class="fa-solid fa-bars" onclick="menuEvent()"
							style="width: 100%; font-size: 30px;"></i>
					</div>
				</div>
				<!-- 프로필 들어갈 자리 -->
				<div id="profile-div" style="border: none;">
					<div class="card d-flex" id="profile">
						<div id="profile-photo-div">
							<div id="profile-photo"
								class="justify-content-center d-flex align-items-center">
								<i class="fa-solid fa-user-large"
									style="font-size: 80px; overflow: hidden;"></i>
							</div>
						</div>
						<div class="card-body">
							<h3>profile-name</h3>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
						</div>
					</div>
				</div>
				<!-- chart.js 통계 들어갈 자리 -->
				<div id="static-div"
					class="row card justify-content-center align-items-center d-flex">
					<div class="w-100 h-100 d-flex"
						class="card justify-content-center d-flex"
						style="flex-direction: row !important">
						<!--성별별 통계-->
						<div
							class="w-50 h-80 justify-content-center align-items-center d-flex card m-3">
							<div>
								<h5>성별별 통계</h5>
								<div style="border: none;">
									<canvas id="myChart" class="w-80 h-80"></canvas>
								</div>
							</div>
						</div>
						<!--연령별 통계-->
						<div
							class="w-50 h-80 justify-content-center align-items-center d-flex card m-3">
							<div>
								<h5>연령별 통계</h5>
								<div style="border: none;">
									<canvas id="myChart2" class="w-80 h-80"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="main-bottom" class="d-flex card flex-row m-3">
				<!-- 게시글 관리 들어갈 자리 -->
				<div id="board-div" class=" card col">
					<h5 class="align-self-center p-3">
						<a onclick="location.href = '/showAllBoardList.dashBoard'">게시글
							관리</a>
					</h5>
					<div style="border: none; overflow: auto;" class="p-3">
						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">타이틀</th>
									<th scope="col">내용</th>
									<th scope="col">작성일</th>
									<th scope="col">수정</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="boardList" items="${boardList}">
									<tr>
										<th scope="col">${boardList.freeSeq }</th>
										<td scope="col">${boardList.title }</td>
										<td scope="col">${boardList.content}</td>
										<td scope="col">${boardList.reg_date}</td>
										<td scope="col">수정</td>
									</tr>

								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- 사용자 관리 들어갈 자리 -->
				<div id="user-div" class=" card col">
					<h5 class="align-self-center p-3">
						<a onclick="location.href = '/showAllMemberList.dashBoard'">사용자
							관리 </a>
					</h5>
					<div style="border: none; overflow: auto;" class="m-3">
						<table class="table table-hover p-3">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">이름</th>
									<th scope="col">닉네임</th>
									<th scope="col">상태</th>
									<th scope="col">수정</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="memberList" items="${memberList }">
									<tr>
										<th scope="row">${memberList.userSeq }</th>
										<td>${memberList.userName}</td>
										<td>${memberList.nickName}</td>
										<td>정상</td>
										<td class="h-80 w-80 "><button class="btn btn-primary">편집</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:set var='age' value='${ageList }'></c:set>
	<c:forEach var='ageList' items='${ageList}' varStatus='status'>
		<input type='hidden' value='${ageList}' name='ageList'>
	</c:forEach>
	<c:set var='gender' value='${genderList }'></c:set>
	<c:forEach var='genderList' items='${gender}' varStatus='status'>
		<input type='hidden' value='${genderList}' name='genderList'>
	</c:forEach>
	<script>
	//input name = ageList에서 값 뽑아냄
	let ageList = $("input[name='ageList']");
	let teenagerAndUnder = 0;
	let twenties = 0;
	let thirties = 0;
	let forties = 0;
	let fifites = 0 ;
	let sixties = 0;
	let seventiesAndUpper = 0;
	ageList.each(function(){
		console.log($(this).val());
		//나이대 계산하는 수식
		let ageRange = Math.trunc((2024-($(this).val())+1)/10);
		//10대거나 그 아래라면
		if(ageRange === 1 || 0){
			teenagerAndUnder++;
		}else if(ageRange ===2){
			twenties++;
		}else if(ageRange ===3){
			thirties++;
		}else if(ageRange ===4){
			forties++;
		}else if(ageRange ===5){
			fifites++;
		}else if(ageRange ===6){
			sixties++;
		}else if(ageRange >=7){
			seventiesAndUpper++;
		}
	})
	
	console.log(teenagerAndUnder+":"+twenties+":"+thirties+":"+forties+":"+fifites+":"+sixties+":"+seventiesAndUpper)
	//genderList에서 값뽑아냄
	let genderList =  $("input[name='genderList']");
	let manCount = 0;
	let femaleCount =0;
	genderList.each(function(){
		console.log($(this).val())
		if($(this).val()==='M'){
			manCount++;
		}else if($(this).val() === 'F'){
			femaleCount++;
		}
	})
		function menuEvent() {
			const menu = document.getElementById("sidenav-collapse-main");
			if (menu.style.display === "block") {
				menu.style.display = "none";
			} else {
				menu.style.display = "block";
			}
		}

		function menuClosing() {
			const menu = document.getElementById("sidenav-collapse-main");
			if (menu.style.display === "block") {
				menu.style.display = "none";
			}
		}
		const ctx = document.getElementById('myChart');

		new Chart(ctx,
				{
					type : 'pie',

					data : {
						labels : [ '남성','여성'],
						datasets : [ {
							label : '# of Votes',
							data : [manCount, femaleCount],
							borderWidth : 1
						} ]
					},
					options : {
						scales : {
							y : {
								beginAtZero : true
							}
						}
					}
				});
		
		const ctx1 = document.getElementById('myChart2');
		new Chart(ctx1,
				{
					type : 'doughnut',
					data : {
						//나이 통계
						labels : [ '10대 또는 그 이하', '20대', '30대', '40대', '50대', '60대', '70대 또는 그 이상'],
						datasets : [ {
							label : '# of Votes',
							data : [teenagerAndUnder,twenties,thirties,forties,fifites,sixties,seventiesAndUpper],
							borderWidth : 1
						} ]
					},
					options : {
						scales : {
							y : {
								beginAtZero : true
							}
						}
					}
				});
	</script>
</body>

</html>