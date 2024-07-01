<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
    integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
    crossorigin="anonymous"></script>
<script
    src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/css/header_styles.css"
    rel="stylesheet">
<link
    href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-pen.css"
    rel="stylesheet">
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/galmuri/dist/galmuri.css">
<link
    href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900&display=swap"
    rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet"
    href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link
    href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap"
    rel="stylesheet">
<style>
body, html {
    height: 100%;
    font-family: "GalmuriMono9", monospace;
    margin: 0;
    padding: 0;
    background-image: url('../image/5033917.jpg');
}

.main {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 80%;
    height: 80%;
    margin: 80px auto;
    /* 헤더 고정으로 인한 상단 마진 추가 */
    border-radius: 10px;
    box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
    background-color: rgba(255, 255, 255, 0.104);
}

.board-section, .edit-post-section {
    display: flex;
    width: 100%;
    height: 100%;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    overflow: hidden;
}

.board-left {
    flex: 1;
    background-color: rgba(4, 206, 241, 0.684);
    color: white;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

.board-left h1 {
    font-size: 36px;
}

.edit-post-area {
    flex: 2;
    padding: 40px;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: center;
    overflow-y: auto;
}

.edit-post-area h2 {
    font-size: 2em;
    margin-bottom: 20px;
    color: black;
    text-align: center;
}

.bookmark-list {
    width: 100%;
    max-width: 800px;
    margin-top: 0;
}

.post-form {
    width: 100%;
    max-width: 800px;
}

.form-field {
    margin-bottom: 20px;
    display: flex;
    flex-direction: column;
}

.form-field label {
    margin-bottom: 5px;
    font-weight: bold;
    font-size: 1em;
}

.form-field input[type="text"], .form-field textarea, .form-field input[type="file"]
    {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1em;
}

.form-field input[type="file"] {
    border: none;
}

.form-buttons {
    display: flex;
    justify-content: space-between;
    width: 100%;
}

.form-buttons button {
    padding: 10px 20px;
    border: none;
    background-color: blue;
    color: white;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1em;
    width: 48%;
}

.form-buttons button:hover {
    background-color: #0000cc;
}

.bookmark_items {
    display: none;
}

.bookmark-list {
    list-style-type: none;
    padding: 0;
}

.bookmark-item {
    background-color: rgba(255, 255, 255, 0.943);
    padding: 10px;
    margin-bottom: 10px;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0);
    display: flex;
    align-items: center;
}

.bookmark-content {
    flex-grow: 1;
}

.bookmark-title {
    margin: 0;
    font-size: 16px;
    font-weight: bold;
}

.bookmark-description {
    margin: 5px 0 0;
    font-size: 14px;
    color: #666;
}

.bookmark-link {
    color: #007bff;
    text-decoration: none;
    font-size: 14px;
}

.bookmark-link:hover {
    text-decoration: underline;
}

.bookmark-actions {
    display: flex;
    gap: 10px;
}

.bookmark-actions button {
    background: none;
    border: none;
    font-size: 1.2em;
    cursor: pointer;
    color: #999;
    transition: color 0.3s;
}

.bookmark-actions .btn-edit:hover {
    color: rgb(249, 63, 76);
}

.bookmark-actions .btn-delete:hover {
    color: #ff0000;
}

.bookmark-item p {
    margin-right: 10px; /* 위쪽 마진을 추가하여 각 <p> 요소 사이에 공간을 만듭니다 */
    margin-left: 10px; /* 아래쪽 마진을 추가하여 각 <p> 요소 사이에 공간을 만듭니다 */
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
}

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
    background-color: rgba(8, 15, 84, 0.217);
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

.welcome-text-button {
    color: #fff;
    font-weight: bold;
    cursor: pointer;
    margin-right: 10px;
    padding: 5px 10px;
    background: rgba(0, 0, 0, 0.5);
    border-radius: 5px;
    transition: background 0.3s;
}

.welcome-text-button:hover {
    background: rgba(0, 0, 0, 0.7);
}

@media ( max-width : 768px) {
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

</style>
</head>

<body>
       <header>
        <div class="header-container">
            <img src="../image/gamebitlogo2.png" alt="Nintendo Logo" class="logo">
            <nav>
                <ul>
                    <li>
                        <a href="/index.jsp">홈</a>
                        <div class="dropdown"></div>
                    </li>
                    <li>
                        <a href="#">게임</a>
                        <div class="dropdown">
                            <a href="/games/win.jsp">명예의 전당</a>
                            <a href="/games/Favorite.jsp">즐겨찾기</a>
                        </div>
                    </li>
                    <li>
                        <a href="/list.board">게시판</a>
                        <div class="dropdown">
                            <a href="/list.board">게시판</a>
                            <a href="/list.qboard">Q&A</a>
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
                                        <c:if test="${adminKey eq 2}">
                    <li>
                        <a href="/showMain.dashBoard">관리자 페이지</a>
                    </li>
                    </c:if>
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



<div class="main">
   <div class="board-section">
      <div class="board-left">
         <h1>내 북마크</h1>
      </div>
      <div class="edit-post-area">
         <h2>북마크 목록</h2>
         <ul class="bookmark-list"></ul>
      </div>
   </div>
</div>

<script>
$(document).ready(function() {
    var userId = "${sessionScope.loginID}";
    $.ajax({
        url: '${pageContext.request.contextPath}/bookmarks',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            var bookmarkList = $('.bookmark-list');

            if (data.length === 0) {
                bookmarkList.append('<li>북마크 목록이 없습니다.</li>');
            } else {
                $.each(data, function(index, bookmark) {
                    var bookmarkItem = $('<li class="bookmark-item"></li>');

                    var bookmarkTitle = $('<p class="bookmark-title"></p>').text('게시글 번호: ' + bookmark.postSeq);
                    var bookmarkDescription = $('<p class="bookmark-description"></p>').text('번호: ' + bookmark.seq);
                    var bookmarkLink = $('<p class="bookmark-link"></p>').text('아이디: ' + bookmark.userId);

                    bookmarkItem.append(bookmarkTitle);
                    bookmarkItem.append(bookmarkDescription);
                    bookmarkItem.append(bookmarkLink);

                    bookmarkList.append(bookmarkItem);
                });
            }
        },
        error: function() {
            $('.bookmark-list').append('<li>북마크 목록을 불러오는 중 오류가 발생했습니다.</li>');
        }
    });
});
</script>
</script>
</body>
</html>
