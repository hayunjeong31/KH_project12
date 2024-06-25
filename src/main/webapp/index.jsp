<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Team_Project</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/header_styles.css">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-pen.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/galmuri/dist/galmuri.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<style>
/* 스타일은 기존 그대로 유지 */
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
    border-bottom: 2px solid rgba(255, 0, 17, 0.39);
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
    font-family: "GalmuriMono9", monospace;
    font-weight: 300;
    font-size: 35px;
    color: rgb(18, 207, 59);
    text-align: center;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);

}

.characters1 p {
    font-family: "GalmuriMono9", monospace;
    font-weight: 400;
    font-size: 25px;
    color: #2196e4;
}

.characters2 h2 {
    border-bottom: 2px solid rgb(14, 158, 151);
    padding-bottom: 0.5rem;
    color: rgb(14, 158, 151);
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
                            <a href="#">게임 플레이 순위</a>
                            <a href="#">즐겨찾기</a>
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

    <main>
        <div class="banner">
            <div class="slides">
                <img src="image/dung.png" alt="Banner 1" class="active">
                <img src="image/teraria.jpg" alt="Banner 2">
                <img src="image/ded.png" alt="Banner 3">
                <img src="image/skull.png" alt="Banner 4">
                <img src="image/poke.png" alt="Banner 4">
            </div>
        </div>

        <div class="thumbnails">
            <img src="image/dung.png" alt="Thumbnail 1" onclick="showSlide(0)">
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
                    <img src="image/dung.png" alt="Kirby">
                    <h1>게임</h1>
                    <p>게임 설명</p>
                </div>

                <div class="game">
                    <img src="image/teraria.jpg" alt="Animal Crossing">
                    <h1>게임2</h1>
                    <p>게임 설명</p>
                </div>
            </div>
        </section>
    </sub>

    <section class="characters2">
        <h2>게임 카테고리</h2>
        <div class="zigzag-grid">
            <div class="item game-image">
                <a href="games/gamePage01.jsp">
                    <img src="image/ded.png" alt="게임 이미지" class="img-fluid">
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
                <a href="games/gamePage02.jsp">
                    <img src="image/skull2.png" alt="게임 이미지" class="img-fluid">
                </a>
            </div>
            <div class="item game-image">
                <a href="games/gamePage03.jsp">
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
                <a href="games/gamePage04.jsp">
                    <img src="image/teraria.jpg" alt="게임 이미지" class="img-fluid">
                </a>
            </div>
            <div class="item game-image">
                <a href="games/gamePage05.jsp">
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
            if (!sessionStorage.getItem('splashScreenShown')) {
                setTimeout(() => {
                    document.querySelector('.splash-screen').classList.add('hidden');
                    sessionStorage.setItem('splashScreenShown', 'true');
                }, 1700);
            } else {
                document.querySelector('.splash-screen').style.display = 'none';
            }
        });

        function toggleMenu() {
            document.querySelector('nav ul').classList.toggle('show');
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
    </script>
</body>
</html>
