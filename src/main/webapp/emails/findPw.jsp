<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
    integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
    crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/css/header_styles.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/galmuri/dist/galmuri.css">
<style>
@import url("https://fonts.googleapis.com/css?family=Abril+Fatface|Open+Sans:400,700&display=swap");



body {
  height: 100vh;
  display: flex;
  background-image: url('${pageContext.request.contextPath}/image/5033917.jpg');
  font-family: "GalmuriMono9", monospace;
}

.main {
  width: 70%;
  height: 75%;
  margin: auto;
  border-radius: 10px;
  box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
  transition: all 0.1s ease-in 0.1s;
}

.sign-up {
  display: flex;
  opacity: 1;
  width: 100%;
  height: 100%;
}

.signup-left {
  width: 50%;
  opacity: 1;
  display: flex;
  flex-flow: column wrap;
  justify-content: space-between;
  font-size: 14px;
  background: rgba(249, 63, 75, 0.704);
  border-radius: 10px 0 0 10px;
  transition: all 0.5s ease-in 0.2s;
}

.signup-left h1 {
  font-size: 21px;
  font-family: "Abril Fatface", cursive;
  letter-spacing: 2px;
}

.signup-left h1,
.signup-left div,
.signup-left h3,
.signup-left p {
  color: rgb(255, 255, 255);
}

.signup-left h3 {
  font-size: 2.2em;
}

.signup-right {
  width: 50%;
  padding: 20px;
  background: rgba(255, 255, 255, 0.591);
  border-radius: 0 10px 10px 0;
  display: flex;
  flex-flow: column wrap;
  justify-content: space-between;
  align-items: flex-end;
  background-size: 70%;
  background-repeat: no-repeat;
  background-position: 235% 50%;
  opacity: 1;
}

.btn-back {
  align-self: flex-start;
  display: flex;
  align-items: center;
  font-weight: bold;
  cursor: pointer;
}

.angle-left-color {
  color: rgb(255, 255, 255);
  margin-right: 5px;
}

.form-area {
  position: absolute;
  top: 20%;
  left: 40%;
  width: 20%;
  height: 60%;
  padding: 20px 0;
  background: rgb(255, 255, 255);
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  border-radius: 10px;
  z-index: 2;
  opacity: 1;
}

.organize-form {
  width: 100%;
  height: 100%;
  display: flex;
  flex-flow: column wrap;
  justify-content: space-around;
  align-items: center;
}

.organize-form h2 {
  font-size: 1.4em;
  font-weight: normal;
}

.organize-form h2::after {
  content: "";
  display: block;
  width: 50%;
  height: 2px;
  background: rgb(249, 63, 76);
  margin: 0 auto;
}

.organize-form p a {
  color: rgb(249, 63, 76);
  text-decoration: none;
  font-weight: bold;
}

.form {
  width: 85%;
}

.form-field {
  display: flex;
  flex-flow: column wrap;
  width: 100%;
  margin-bottom: 10px;
}

.input-group {
  display: flex;
  align-items: center;
}

.input-group input {
  flex: 1;
}

.form-field input {
  border: none;
  padding: 5px;
  border-bottom: 1px solid rgba(116, 116, 116, 0.44);
  height: 30px;
  transition: border-bottom 0.1s ease-in-out 0.1s;
}

.form-field input:focus {
  border-bottom: 1px solid rgb(249, 63, 76);
}

.form-field label {
  position: relative;
  top: 25px;
  left: 5px;
  cursor: text;
  transition: all 0.2s ease-in-out 0.1s;
  color: rgba(116, 116, 116, 0.44);
  user-select: none;
}

input:placeholder-shown + label {
  opacity: 0;
  visibility: hidden;
}

.btn-sign {
  border: none;
  background: rgb(249, 63, 76);
  color: white;
  font-weight: bold;
  width: 100%;
  padding: 10px;
  margin-top: 20px;
  border-radius: 50px;
  cursor: pointer;
  transition: background 0.1s ease 0.1s;
}

.btn-sign:hover {
  background: rgb(230, 57, 69);
}

.btn-check {
  border: none;
  background: rgb(249, 63, 76);
  color: white;
  font-weight: bold;
  padding: 8px 15px;
  margin-top: 20px;
  border-radius: 50px;
  cursor: pointer;
  transition: background 0.1s ease 0.1s;
}

.btn-check:hover {
  background: rgb(230, 57, 69);
}

.signup-right {
  width: 50%;
  padding: 20px;
  background: rgba(255, 255, 255, 0.591);
  border-radius: 0 10px 10px 0;
  display: flex;
  flex-flow: column wrap;
  justify-content: space-between;
  align-items: flex-end;
  background-size: 70%;
  background-repeat: no-repeat;
  background-position: 235% 50%;
  opacity: 1;
}

.bars-style {
  color: rgb(249, 63, 76);
  cursor: pointer;
  font-size: 16px;
}

.link-up {
  color: rgb(249, 63, 76);
  text-decoration: none;
  font-weight: bold;
  transition: color 0.2s ease;
}

.link-up:hover {
  color: rgb(230, 57, 69);
}

.form-field a {
  font-size: 0.9em;
}

.links-container {
  display: flex;
  justify-content: space-between;
  width: 100%;
}

.hidden {
  display: none;
}

@media (max-width: 768px) {
  .btn-check {
    padding: 8px 15px; 
  }
}

@media (max-width: 1023px) {
  .main {
    width: 100%;
    height: 100%;
  }
  .home, .signup-left { border-radius: 0; }
  .form-area {
    left: 35%;
    width: 30%;
    height: 70%;
  }
}

@media (max-width: 768px) {
  .form-area {
    left: 20%;
    width: 60%;
  }
  .wc_message {
    opacity: 0;
    transition: opacity .1s;
  }
}

@media (max-width: 375px) {
  .form-area {
    left: 10%;
    width: 80%;
  }
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
  background-image: url('${pageContext.request.contextPath}/image/9.png');
}

.btn-full-width {
  width: 110px; /* 인증 코드 버튼과 동일한 너비로 조정합니다 */
  margin-top: 20px;
  margin-left: 10px;
  border-radius: 50px;
}
</style>
</head>
<body>
<header>
    <div class="header-container">
        <img src="${pageContext.request.contextPath}/image/gamebitlogo2.png" alt="Nintendo Logo" class="logo">
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
            <button class="login-button" onclick="location.href='/members/signup.jsp'">Login</button>
            <div class="hamburger-menu" onclick="toggleMenu()">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
    </div>
</header>
<main class="main">
    <section class="sign-up">
        <article class="signup-left">
            <div class="wc_message"></div>
        </article>
        <article class="form-area">
            <div class="organize-form form-area-signin">
                <h2>비밀번호 찾기</h2>
                <form id="pwResetForm" method="post">
                    <div class="form-field">
                        <label for="email"></label>
                        <input type="email" id="email" name="email" placeholder="이메일을 입력하세요" required />
                    </div>
                    <div class="form-field">
                        <input type="text" class="mail-check-input" id="authCode" placeholder="인증 코드를 입력하세요" disabled>
                    </div>
                    <button type="button" class="btn-sign btn-inline" id="auth_btn">인증 코드 받기</button>
                    <div id="mail-check-input-info" class="form-field"></div>
                    <button type="button" class="btn-sign btn-in" id="find_pw_btn" disabled>임시 비밀번호로 재설정</button>
                </form>
                <button onclick="location.href='${pageContext.request.contextPath}/index.jsp'" class="btn-sign btn-full-width">돌아가기</button>
            </div>
        </article>
        <article class="signup-right">
            <i class="fas fa-2x fa-bars bars-style"></i>
        </article>
    </section>
</main>
<script>
    $('#email').on('input', function() {
        if ($(this).val() === '') {
            $('#auth_btn').attr('disabled', true);
        } else {
            $('#auth_btn').attr('disabled', false);
        }
    });

    $('#auth_btn').click(function() {
        var email = $('#email').val();
        var checkInput = $('.mail-check-input');

        $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/sendAuthCode.members?email=' + email,
            success: function(data) {
                alert(data);
                checkInput.attr('disabled', false);
                $('#find_pw_btn').attr('disabled', false);
            },
        });
    });

    $('.mail-check-input').on('input', function() {
        var email = $('#email').val();
        var inputCode = $(".mail-check-input").val();
        var checkResult = $("#mail-check-input-info");

        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/verifyAuthCode.members',
            data: { email: email, authCode: inputCode },
            success: function(data) {
                checkResult.html(data);
                if (data.indexOf('유효') !== -1) {
                    $('#newPassword').attr('disabled', false);
                    $('#reset_btn').attr('disabled', false);
                }
            },
            error: function(err) {
                checkResult.html("오류 발생: " + JSON.stringify(err));
            }
        });
    });

    $('#pwResetForm').on('submit', function(event) {
        event.preventDefault();
        var email = $('#email').val();
        var newPassword = $('#newPassword').val();

        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/resetPassword.members',
            data: { email: email, newPassword: newPassword },
            success: function(response) {
                alert("비밀번호가 성공적으로 변경되었습니다.");
                location.href = "${pageContext.request.contextPath}/index.jsp";
            },
            error: function(error) {
                alert("비밀번호 변경 중 오류가 발생했습니다.");
            }
        });
    });

    $('#find_pw_btn').click(function() {
        var email = $('#email').val();

        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/resetPassword.members',
            data: { email: email },
            success: function(data) {
                if (data.indexOf('성공') !== -1) {
                    alert(data);
                    location.href = "${pageContext.request.contextPath}/index.jsp";
                } else {
                    alert("오류 발생: " + data);
                }
            },
            error: function(err) {
                alert("오류 발생: " + JSON.stringify(err));
            }
        });
    });
</script>
</body>
</html>
