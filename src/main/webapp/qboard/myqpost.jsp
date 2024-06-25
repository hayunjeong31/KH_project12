<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/css/header_styles.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/header_styles.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-pen.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/galmuri/dist/galmuri.css">
<<<<<<< HEAD:src/main/webapp/board/myqpost.jsp
=======
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
>>>>>>> 07569663bf800ac0c061fb073e5fe4da73153a1f:src/main/webapp/qboard/myqpost.jsp

    <style>
        

.header-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 20px;
    height: 100%;
}

.logo {
    height: 40px;
}

nav {
    flex: 1;
}

nav ul {
    list-style: none;
    display: flex;
    justify-content: center;
    margin: 0;
    padding: 0;
}

nav ul li {
    position: relative;
    margin: 0 15px;
}

nav ul li a {
    color: white;
    text-decoration: none;
    font-weight: bold;
    padding: 10px 15px;
    display: block;
}

nav ul li:hover>.dropdown {
    visibility: visible;
    opacity: 1;
    transform: translateY(0);
    transition: opacity 0.5s ease, transform 0.5s ease;
}

.dropdown {
    visibility: hidden;
    opacity: 0;
    position: absolute;
    background-color: rgba(39, 48, 88, 0.801);
    box-shadow: 0 8px 16px rgba(224, 224, 224, 0.267);
    z-index: 1500;
    min-width: 100px;
    transform: translateY(-20px);
    transition: opacity 0.5s ease, transform 0.5s ease, visibility 0s 0.5s;
}

.dropdown a {
    display: block;
    padding: 10px 20px;
    color: rgb(207, 211, 211);
    text-decoration: none;
    white-space: nowrap;
}

.dropdown a:hover {
    background-color:rgba(8, 15, 84, 0.217);
}

.header-buttons {
    display: flex;
    align-items: center;
}

.login-button {
    padding: 5px 10px;
    background-color: white;
    border: none;
    border-radius: 5px;
    color: rgb(249, 63, 76);
    cursor: pointer;
    font-weight: bold;
}

.hamburger-menu {
    display: none;
    flex-direction: column;
    cursor: pointer;
    padding: 10px;
}

.hamburger-menu div {
    width: 25px;
    height: 3px;
    background-color: white;
    margin: 4px 0;
}

@media (max-width: 768px) {
    .hamburger-menu {
        display: flex;
    }

    .header-buttons input {
        display: none;
    }

    .header-buttons {
        justify-content: flex-end;
    }

    nav ul {
        display: none;
        flex-direction: column;
        width: 100%;
        background-color: black;
        position: absolute;
        top: 60px;
        left: 0;
    }

    nav ul.show {
        display: flex;
    }

    nav ul li {
        margin: 10px 0;
        text-align: center;
    }
}
/* Inline styles for specific to this HTML file */

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body,
        html {
            height: 100%;
            
        }

        body {
            font-family: "GalmuriMono9", monospace;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            background-image: url('../image/5033917.jpg');
        }

        .main {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 80px);
            background-color: #f4f4f43c;
            width: 80%;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
        }

        .board-section {
            display: flex;
            width: 100%;
            height: 100%;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0);
            border-radius: 10px;
            overflow: hidden;
            background-color: rgba(255, 255, 255, 0.054);
        }

        .board-left {
            flex: 1;
            background-color: rgba(45, 19, 112, 0.684);
            color: rgb(255, 255, 255);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .board-left h1 {
            font-size: 36px;
        }

        .board-area {
            flex: 2;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .new-button {
            padding: 8px 16px;
            background-color: rgb(64, 64, 116);
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-left: 850px;
            /* This might need adjustment based on your layout */
            font-family: "GalmuriMono9", monospace;
            
        }

        .board-area h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: black;
            text-align: center;
            
        }

        .board-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .board-table th,
        .board-table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
            color: black;
        }
        
        .board-table td {
        font-family: 'Open Sans', sans-serif;
        }

        .board-table th {
            background-color: #f9f9f9b9;
        }

        .board-table tbody tr {
            background-color: #f9f9f9b9;
        }

        .board-table tbody tr:nth-child(even) {
            background-color: #f9f9f9b9;
        }

        .board-table a {
            color: black;
            text-decoration: none;
        }

        .board-table a:hover {
            text-decoration: underline;
        }

        .pagination {
        	margin-top:3%;
            margin-bottom: 20px;
        }
        .pagination a{
        	text-decoration: none;
        	margin: 0 5px;
            padding: 5px 10px;
            border: 1px solid #ddd;
            background-color: rgba(255, 255, 255, 0.855);
            cursor: pointer;
            color: black;
<<<<<<< HEAD:src/main/webapp/board/myqpost.jsp
            font-family: "GalmuriMono9", monospace;
=======
            text-align:center;
>>>>>>> 07569663bf800ac0c061fb073e5fe4da73153a1f:src/main/webapp/qboard/myqpost.jsp
        }
        .pagination a.active{
        	font-weight: bold;
        	color: rgb(237, 98, 237);
        }
        .pagination a:hover{
        	 background-color: rgba(231, 231, 232, 0.004);
            color: white;
<<<<<<< HEAD:src/main/webapp/board/myqpost.jsp
            
=======
            font-weight: bold;
           
>>>>>>> 07569663bf800ac0c061fb073e5fe4da73153a1f:src/main/webapp/qboard/myqpost.jsp
        }

        .board-buttons {
            display: flex;
            justify-content: space-between;
            width: 100%;
            max-width: 800px;
            
        }

        
        .board-buttons .home-button {
            padding: 10px 20px;
            border: none;
            background-color: rgb(64, 64, 116);
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            width: 48%;
            font-family: "GalmuriMono9", monospace;
        }

        
        .board-buttons .home-button:hover {
            background-color: rgb(64, 64, 116);
            
        }
        header {
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 1000;
            background-color: black;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            height: 60px;
            background-image: url('image/9.png');
        }
<<<<<<< HEAD:src/main/webapp/board/myqpost.jsp
=======
        .welcome-text {
  font-weight: bold;
  color: #fff;
  margin-right: 20px;
}
        .welcome-text-button {
    color: #fff;
    font-weight: bold;
    cursor: pointer;
    margin-right: 10px;
    padding: 5px 10px 5px 30px; /* 왼쪽 패딩 추가 */
    background: rgba(0, 0, 0, 0.5);
    border-radius: 5px;
    transition: background 0.3s;
    position: relative; /* position 속성 추가 */
}

.welcome-text-button i {
    position: absolute;
    left: 10px; /* 아이콘 위치 조정 */
    top: 50%;
    transform: translateY(-50%);
}

.welcome-text-button:hover {
    background: rgba(0, 0, 0, 0.7);
}
.board-table .title_max {
			white-space: nowrap !important;
	        overflow: hidden !important;
	        text-overflow: ellipsis !important;
	        max-width: 300px !important; /* 적절한 너비로 설정 */
	       	padding: 0 30px !important;
	       	text-align: left;
		}
		.title_max a{
			white-space: nowrap !important;
	        overflow: hidden !important;
	        text-overflow: ellipsis !important;
	        max-width: 300px !important; /* 적절한 너비로 설정 */
	       	padding: 0 30px !important;
	       	text-align: left;
		}
>>>>>>> 07569663bf800ac0c061fb073e5fe4da73153a1f:src/main/webapp/qboard/myqpost.jsp
    </style>
    <title>게시판</title>
</head>

<body>
    <header>
        <div class="header-container">
        <a href="/index.jsp">
            <img src="image/GamebitLogo.png" alt="Nintendo Logo" class="logo"></a>
            <nav>
                <ul>
                    <li>
                        <a href="index.jsp">홈</a>
                        <div class="dropdown"></div>
                    </li>
                    <li>
                        <a href="#">게임</a>
                        <div class="dropdown">
                            <a href="win.html">명예의 전당</a>
                            <a href="#">Subitem 2</a>
                            <a href="#">랭킹</a>
                        </div>
                    </li>
                    <li>
                        <a href="/list.board">게시판</a>
                        <div class="dropdown">
                            <a href="/list.board">게시판</a>
                            <a href="/list.qboard">Q&A</a>
                            <a href="#">공지사항</a>
                        </div>
                    </li>
                    <li>
                        <a href="#">마이페이지</a>
                        <div class="dropdown">
                            <a href="/mypage.members">내 정보 보기</a>
                            <a href="/myfreepostlist.board">내가 작성한 게시글</a>
                            <a href="/myqpostlist.qboard">내가 작성한 Q&A</a>
                        </div>
                    </li>
                    <li>
                        <a href="#">관리자 페이지</a>
                        <div class="dropdown">
                            <a href="#">대시보드</a>
                            <a href="#">통계</a>
                        </div>
                    </li>
                </ul>
            </nav>
            <div class="header-buttons">
               <c:choose>
                    <c:when test="${not empty sessionScope.loginID}">
                        <span class="welcome-text-button" onclick="location.href='mypage.members'">
                            <i class="fa-solid fa-user"></i>${sessionScope.userName}님 환영합니다
                        </span>
                        <div class="btn-container">
                            <button class="logout-button" onclick="location.href='/logout.members'">Logout</button>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <button class="login-button" onclick="location.href='members/login.jsp'">Login</button>
                    </c:otherwise>
                </c:choose>
                <div class="hamburger-menu" onclick="toggleMenu()">
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
        </div>
    </header>


    <main class="main">
        <section class="board-section">
            <article class="board-left">
                <h1>내가 작성한 Q&A게시글</h1>
                <div class="wc_message"></div>
            </article>
            <article class="board-area">
                <div class="top-right-button">
                    <button class="new-button" onclick="location.href='bookmark.html'"> 북마크 </button>
                </div>
                <h2></h2>
                <table class="board-table">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>글쓴이</th>
                            <th>등록일</th>
                            <th>조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${list}">
                        <tr>
                            <td>${dto.seq}</td>
                            <td class="title_max"><a href="/myqdetail.qboard?seq=${dto.seq}">${dto.title}</a></td>
                            <td>${dto.writer}</td>
                            <td><fmt:formatDate value="${dto.write_date}" pattern="yyyy.MM.dd" /></td>
                            <td>${dto.view_count}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="pagination">
                    ${pageNavi}
                </div>
                <div class="board-buttons">
                    <button class="home-button" onclick="location.href='/index.jsp'">홈으로</button>
                </div>
            </article>
        </section>
    </main>
    <script>
        let cpage = ${cpage};
let record_total_count = ${record_total_count};
let record_count_per_page = ${record_count_per_page};
let navi_count_per_page = ${navi_count_per_page};
let page_total_count=0;


if(record_total_count % record_count_per_page > 0) {
	page_total_count = Math.trunc(record_total_count / record_count_per_page) + 1;
}else {
	page_total_count = Math.trunc(record_total_count / record_count_per_page);
}

// 네비게이터의 시작 값
let startNavi = (Math.trunc((cpage - 1) / navi_count_per_page) * navi_count_per_page + 1);
let endNavi = startNavi + navi_count_per_page - 1;

if(endNavi > page_total_count) {
	endNavi = page_total_count;
}

let needNext = true;
let needPrev = true;

if(startNavi == 1) {needPrev = false;}
if(endNavi == page_total_count) {needNext = false;}

// 전 내비 이동
if(needPrev==true){
$(".pagination").append("<a href='/myqpostlist.qboard?cpage="+(startNavi-1)+"'><</a>");
}


for(let i = startNavi;i <= endNavi;i++) {
	$(".pagination").append("<a href='/myqpostlist.qboard?cpage="+i+"'>"+i+"</a> ");
}

// 후 내비 이동
if(needNext==true){
$(".pagination").append("<a href='/myqpostlist.qboard?cpage="+(endNavi+1)+"'>></a>");
}
    </script>
</body>
</html>