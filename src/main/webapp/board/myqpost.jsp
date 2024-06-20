<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="${pageContext.request.contextPath}/css/header_styles.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/header_styles.css"> <!-- Linking external CSS file -->
    <style>
        /* Inline styles for specific to this HTML file */

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body,
        html {
            height: 100%;
            font-family: Arial, sans-serif;
            background-image: url('image/5033917.jpg');
        }

        body {
            font-family: 'Open Sans', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
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
            margin-bottom: 20px;
        }

        .pagination button {
            margin: 0 5px;
            padding: 5px 10px;
            border: 1px solid #ddd;
            background-color: rgba(255, 255, 255, 0.855);
            cursor: pointer;
            color: black;
        }

        .pagination button:hover {
            background-color: rgba(231, 231, 232, 0.004);
            color: white;
        }

        .pagination button:active {
            background-color: rgba(25, 25, 173, 0.598);
            color: white;
        }

        .board-buttons {
            display: flex;
            justify-content: space-between;
            width: 100%;
            max-width: 800px;
        }

        .board-buttons .write-button,
        .board-buttons .home-button {
            padding: 10px 20px;
            border: none;
            background-color: rgb(64, 64, 116);
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            width: 48%;
        }

        .board-buttons .write-button:hover,
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
        
        .title{
         white-space: nowrap;
           overflow: hidden;
           text-overflow: ellipsis;
           max-width: 300px; /* 적절한 너비로 설정 */
      }
    </style>
    <title>게시판</title>
</head>

<body>
    <header>
        <div class="header-container">
            <img src="image/GamebitLogo.png" alt="Nintendo Logo" class="logo">
            <nav>
                <ul>
                    <li>
                        <a href="index.html">홈</a>
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
                        <a href="board.html">게시판</a>
                        <div class="dropdown">
                            <a href="board.html">게시판</a>
                            <a href="#">Q&A</a>
                            <a href="#">공지사항</a>
                        </div>
                    </li>
                    <li>
                        <a href="#">마이페이지</a>
                        <div class="dropdown">
                            <a href="#">내 정보 수정</a>
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
                <button class="login-button" onclick="location.href='join.html'">Login</button>
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
                            <td class="title"><a href="/detail.board?seq=${dto.seq}">${dto.title}</a></td>
                            <td>${dto.writer}</td>
                            <td><fmt:formatDate value="${dto.write_date}" pattern="yyyy.MM.dd HH:mm" /></td>
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