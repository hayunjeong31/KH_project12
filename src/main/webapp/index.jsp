<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Team_Project</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/header_styles.css">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-pen.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/galmuri/dist/galmuri.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<style>
    body {
    margin: 0;
    padding: 0;
    background-image: url('image/5033917.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    font-family: "GalmuriMono9", monospace;
    background-attachment: fixed;
    overflow-x: hidden;
    font-weight: 200;
}

header {
    position: fixed;
    width: 100%;
    top: 0;
    z-index: 1000;
    background-color: black;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    height: 60px;
    background-image: url('image/9.png');
}

.load-more {
    display: block;
    margin: 20px auto;
    padding: 10px 20px;
    background-color: rgb(249, 63, 76);
    color: white;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
}

.best-sellers,
.new-releases {
    padding: 2rem;
    background-color: white;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    margin: 20px auto;
    max-width: 100%;
}

.best-sellers h2,
.new-releases h2 {
    border-bottom: 2px solid rgb(249, 63, 76);
    padding-bottom: 0.5rem;
}

.zigzag-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
    max-width: 100%;
    margin: 0 auto;
}

.zigzag-grid .item img {
    width: 100%;
    height: auto;
    border-radius: 20px;
}

.characters1,
.characters2 {
    padding: 2rem;
    margin: 20px auto;
    max-width: 85%;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    background-attachment: fixed;
}

.characters1 {
    margin-top: 90px;
}

.characters2 {
    margin-top: 100px;
}

.characters1 h1,
.characters2 h2 {
    font-family: "Roboto", sans-serif;
    font-weight: 300;
    font-size: 35px;
    color: white;
    text-align: center;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

.characters1 p {
    font-family: "Roboto", sans-serif;
    font-weight: 400;
    font-size: 25px;
    color: #2196e4;
}

.characters2 h2 {
    border-bottom: 2px solid rgb(249, 63, 76);
    padding-bottom: 0.5rem;
    color: rgba(222, 69, 69, 0.774);
}

.zigzag-grid .item p {
    background-color: rgba(255, 255, 255, 0.8);
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    padding: 10px;
    margin: 0;
    color: #333;
    height: 80px;
}

.item {
    opacity: 0;
    transition: opacity 1s ease-out, transform 1s ease-out;
    transform: translateY(20px);
}

.item.visible {
    opacity: 1;
    transform: translateY(0);
}

@media (max-width: 768px) {
    .zigzag-grid {
        display: flex;
        flex-direction: column;
    }

    .zigzag-grid .game-image {
        width: 100%;
        margin-bottom: 20px;
    }

    .zigzag-grid .game-description {
        display: none;
    }

    .header-buttons {
        justify-content: flex-end;
    }

    .hamburger-menu {
        display: flex;
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

footer {
    background-color: black;
    color: white;
    text-align: center;
    padding: 1rem;
    margin-top: 2rem;
}

.footer-content {
    margin: 0 auto;
    max-width: 1200px;
}

.footer-icons {
    display: flex;
    justify-content: center;
    margin-bottom: 1rem;
}

.footer-icons a {
    color: white;
    text-decoration: none;
    font-size: 24px;
    margin: 0 15px;
}

.footer-icons a img {
    width: 32px;
    height: 32px;
}

.footer-icons a:hover {
    color: #f1f1f1;
}

.footer-links {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    margin-bottom: 1rem;
}

.footer-links a {
    color: white;
    text-decoration: none;
    margin: 0 10px;
}

.footer-links a:hover {
    text-decoration: underline;
}

.banner {
    position: relative;
    width: 85%;
    height: 700px;
    align-items: center;
    overflow: hidden;
    justify-content: center;
    margin: 0 auto;
}

.slides img {
    width: 100%;
    height: 100%;
    display: none;
    position: absolute;
    margin-top: 150px;
}

.slides img.active {
    display: block;
}

@media (max-width: 768px) {
    .banner {
        height: 400px;
        border-radius: 13px;
        margin-bottom: 50px;
    }

    .slides img {
        border-radius: 13px;
    }
}

.text-overlay {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: white;
    text-align: center;
}

.thumbnails {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.thumbnails img {
    width: 100px;
    margin: 0 10px;
    cursor: pointer;
    transition: transform 0.3s;
    border-radius: 10px;
}

.thumbnails img:hover {
    transform: scale(1.1);
}

@media (max-width: 768px) {
    .thumbnails {
        display: none;
    }
}

@media (min-width: 769px) {
    .thumbnails img:hover {
        transform: scale(1.4);
    }
}

.splash-screen {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-image: url('image/5033917.jpg');
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    z-index: 2000;
    transition: opacity 1s ease-out;
    font-family: 'Playfair Display', serif;
    text-align: center;
}

.intro-text {
    color: rgb(152, 135, 135);
    font-size: 70px;
    text-align: center;
    margin-bottom: 10px;
}

.highlight {
    color: rgba(180, 185, 195, 0.769);
    font-size: 70px;
    margin-bottom: 220px;
    margin-left: 230px;
    text-align: center;
}

.splash-screen.hidden {
    opacity: 0;
    pointer-events: none;
}

@media (max-width: 768px) {
    .splash-screen {
        font-size: 25px;
    }

    .intro-text {
        width: 80%;
        margin-bottom: 120px;
    }
}

.game-container {
    display: flex;
    justify-content: center;
    gap: 20px;
}

.game {
    background-color: rgba(15, 7, 57, 0.527);
    border: 1px solid rgb(15, 7, 57);
    border-radius: 10px;
    padding: 20px;
    width: 45%;
    text-align: center;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.game img {
    width: 100%;
    height: auto;
    border-bottom: 1px solid #ddd;
    padding-bottom: 10px;
}

@media (max-width: 768px) {
    .game-container {
        flex-direction: column;
        align-items: center;
    }

    .game {
        width: 100%;
    }
}

.welcome-text-button {
    color: #fff !important; /* 텍스트 색상을 하얀색으로 설정 */
    font-weight: bold !important;
    cursor: pointer;
    margin-right: 10px;
    padding: 5px 10px; /* 패딩 수정 */
    background: rgba(0, 0, 0, 0.5) !important;
    border-radius: 5px;
    transition: background 0.3s;
    position: relative; /* position 속성 추가 */
    display: flex; /* 플렉스박스로 아이콘과 텍스트를 한 줄에 표시 */
    align-items: center; /* 아이템을 중앙 정렬 */
    font-family: "GalmuriMono9", monospace !important; /* 폰트 설정 */
}

.welcome-text-button i {
    margin-right: 5px; /* 아이콘과 텍스트 간격 조정 */
    color: #fff !important; /* 아이콘 색상을 하얀색으로 설정 */
}

.welcome-text-button:hover {
    background: rgba(0, 0, 0, 0.7) !important;
}
</style>
<body>

	<div class="splash-screen">
        <h2 class="intro-text">welcome to the</h2>
        <h1 class="highlight">Gambit</h1>
    </div>

    <header>
        <div class="header-container">
            <img src="image/GamebitLogo.png" alt="Nintendo Logo" class="logo">
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
                            <a href="#">즐겨찾기</a>
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
                        <a href="/showMain.dashBoard">관리자 페이지</a>
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

    <main>
        <div class="banner">
            <div class="slides">
                <img src="image/background3.jpg" alt="Banner 1" class="active">
                <img src="image/teraria.jpg" alt="Banner 2">
                <img src="image/ded.png" alt="Banner 3">
                <img src="image/skull.png" alt="Banner 4">
                <img src="image/poke.png" alt="Banner 4">
            </div>
        </div>

        <div class="thumbnails">
            <img src="image/background3.jpg" alt="Thumbnail 1" onclick="showSlide(0)">
            <img src="image/teraria.jpg" alt="Thumbnail 2" onclick="showSlide(1)">
            <img src="image/ded.png" alt="Thumbnail 3" onclick="showSlide(2)">
            <img src="image/skull.png" alt="Thumbnail 2" onclick="showSlide(3)">
            <img src="image/poke.png" alt="Thumbnail 3" onclick="showSlide(4)">
        </div>
    </main>
    <sub>
        <section class="characters1">
		    <h1> 인기 게임!</h1>
		    <div class="game-container">
		        <div class="game">
		            <img src="image/background3.jpg" alt="Game 1">
		            <h1>마리오</h1>
		            <p>플레이 횟수: <span class="play-count" data-game-id="1"></span></p>
		            <p>게임 순위: <span class="rank" data-game-id="1"></span></p>
		        </div>
		        
		        <div class="game">
		            <img src="image/teraria.jpg" alt="Game 2">
		            <h1>게임 2</h1>
		            <p>플레이 횟수: <span class="play-count" data-game-id="2"></span></p>
		            <p>게임 순위: <span class="rank" data-game-id="2"></span></p>
		        </div>
		        
		        <div class="game">
		            <img src="image/ded.png" alt="Game 3">
		            <h1>게임 3</h1>
		            <p>플레이 횟수: <span class="play-count" data-game-id="3"></span></p>
		            <p>게임 순위: <span class="rank" data-game-id="3"></span></p>
		        </div>
		        
		        <div class="game">
		            <img src="image/skull2.png" alt="Game 4">
		            <h1>게임 4</h1>
		            <p>플레이 횟수: <span class="play-count" data-game-id="4"></span></p>
		            <p>게임 순위: <span class="rank" data-game-id="4"></span></p>
		        </div>
		        
		        <div class="game">
		            <img src="image/teraria.jpg" alt="Game 5">
		            <h1>게임 5</h1>
		            <p>플레이 횟수: <span class="play-count" data-game-id="5"></span></p>
		            <p>게임 순위: <span class="rank" data-game-id="5"></span></p>
		        </div>
		    </div>
		</section>
    </sub>

    <section class="characters2">
        <h2>게임 카테고리</h2>
        <div class="zigzag-grid">
            <div class="item game-image">
                <a href="games/gamePage01.jsp">
                    <img src="image/background3.jpg" alt="게임 이미지" class="img-fluid">
                </a>
            </div>
            <div class="item game-description">
                <p>               
                    제목: 마리오<br>
                    장르: 회피<br>
                    게임설명: 방향키를 움직여 플레이어 이동하는 게임<br>
                </p>
            </div>
            <div class="item game-description">
                <p>
                    제목: Mission<br>
                    장르:<br>
                    게임설명:<br>
                </p>
            </div>
            <div class="item game-image">
                <a href="games/gamePage02.jsp">
                    <img src="image/skull2.png" alt="게임 이미지" class="img-fluid">
                </a>
            </div>
            <div class="item game-image">
                <a href="gamepage3.html">
                    <img src="image/dung.png" alt="게임 이미지" class="img-fluid">
                </a>
            </div>
            <div class="item game-description">
                <p>
                    제목:<br>
                    장르:<br>
                    게임설명:<br>
                </p>
            </div>
            <div class="item game-description">
                <p>
                    제목:<br>
                    장르:<br>
                    게임설명:<br>
                </p>
            </div>
            <div class="item game-image">
                <a href="gamepage4.html">
                    <img src="image/teraria.jpg" alt="게임 이미지" class="img-fluid">
                </a>
            </div>
            <div class="item game-image">
                <a href="gamepage5.html">
                    <img src="image/poke2.png" alt="게임 이미지" class="img-fluid">
                </a>
            </div>
            <div class="item game-description">
                <p>
                    제목:<br>
                    장르:<br>
                    게임설명:<br>
                </p>
            </div>
        </div>
    </section>

    <footer>
        <div class="footer-content">
            <div class="footer-icons">
                <a href="https://www.facebook.com"><img src="image/face.png" alt="Facebook"></a>
                <a href="https://www.instagram.com"><img src="image/insta.png" alt="Instagram"></a>
                <a href="https://www.youtube.com"><img src="image/youtube.png" alt="YouTube"></a>
            </div>
            <div class="footer-links">
                <a href="#">Info</a>
                <a href="#">Support</a>
                <a href="#">Marketing</a>
                <a href="#">Terms of Use</a>
                <a href="#">Privacy Policy</a>
            </div>
            <p>&copy; 2024 Team Project</p>
        </div>
    </footer>

    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script>
    window.addEventListener('load', () => {
        $.ajax({
            url: '/games/gamesServlet.games?action=checkServerRestart',
            method: 'GET',
            success: function(response) {
                if (response === true) {
                    // 서버가 초기화되었으므로 세션 스토리지를 초기화합니다.
                    sessionStorage.removeItem('splashScreenShown');
                }

                if (!sessionStorage.getItem('splashScreenShown')) {
                    setTimeout(() => {
                        const splashScreen = document.querySelector('.splash-screen');
                        if (splashScreen) {
                            splashScreen.classList.add('hidden');
                            sessionStorage.setItem('splashScreenShown', 'true');
                        }
                    }, 1700);
                } else {
                    const splashScreen = document.querySelector('.splash-screen');
                    if (splashScreen) {
                        splashScreen.style.display = 'none';
                    }
                }
            },
            error: function(error) {
                console.error("Server restart check failed:", error);
            }
        });
    });

    function toggleMenu() {
        const navMenu = document.querySelector('nav ul');
        if (navMenu) { // null 체크 추가
            navMenu.classList.toggle('show');
        }
    }

    let slideIndex = 0;
    let slides = document.querySelectorAll('.slides img');
    let totalSlides = slides.length;

    function showSlides() {
        slides.forEach((slide, index) => {
            slide.style.display = 'none';
            slide.classList.remove('active');
        });

        slideIndex++;
        if (slideIndex > totalSlides) {
            slideIndex = 1;
        }

        slides[slideIndex - 1].style.display = 'block';
        slides[slideIndex - 1].classList.add('active');
        setTimeout(showSlides, 3000); // Change image every 3 seconds
    }

    function showSlide(index) {
        slides.forEach((slide, idx) => {
            slide.style.display = 'none';
            slide.classList.remove('active');
        });
        slides[index].style.display = 'block';
        slides[index].classList.add('active');
        slideIndex = index;
    }

    document.addEventListener('DOMContentLoaded', () => {
        showSlides();
    });

    document.addEventListener('DOMContentLoaded', () => {
        const observerOptions = {
            root: null,
            rootMargin: '0px',
            threshold: 0.1
        };

        const observer = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                    observer.unobserve(entry.target);
                }
            });
        }, observerOptions);

        const items = document.querySelectorAll('.item');
        items.forEach(item => {
            observer.observe(item);
        });
    });

    $(document).ready(function() {
        $.ajax({
            url: '/games/gamesServlet.games',
            method: 'GET',
            data: { action: 'getPlayCounts' },
            success: function(response) {
                console.log("Response: ", response); // 응답 데이터 로깅
                if (response && typeof response === 'object' && response.hasOwnProperty("1")) {
                    let playCount = response["1"];
                    console.log("Setting play count for gameSeq 1: ", playCount);
                    let playCountElement = $(`.play-count[data-game-id="1"]`);
                    let rankElement = $(`.rank[data-game-id="1"]`);

                    console.log("playCountElement: ", playCountElement);
                    console.log("rankElement: ", rankElement);

                    if (playCountElement.length > 0) {
                        playCountElement.text(playCount);
                    } else {
                        console.error("No element found for gameSeq: 1");
                    }

                    if (rankElement.length > 0) {
                        rankElement.text(1); // 순위를 1로 설정
                    } else {
                        console.error("No element found for gameSeq: 1");
                    }
                } else {
                    console.error("Invalid response format or empty response");
                }
            },
            error: function(error) {
                console.error("플레이 횟수를 가져오는 중 오류 발생:", error);
            }
        });
    });

    </script>
</body>
</html>
