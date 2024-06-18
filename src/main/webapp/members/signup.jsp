<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="${pageContext.request.contextPath}/css/header_styles.css" rel="stylesheet" type="text/css">
<style>
@import url("https://fonts.googleapis.com/css?family=Abril+Fatface|Open+Sans:400,700&display=swap");

* {
  margin: 0;
  padding: 0;
  outline: none;
  box-sizing: border-box;
  line-height: 1.5em;
  color: #747474;
  font-family: "Open Sans", sans-serif;
  font-size: 12px;
}

body {
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background-image: url('${pageContext.request.contextPath}/image/5033917.jpg');
  background-size: cover;
  background-repeat: no-repeat;
}

.container {
  position: relative;
  width: 100%;
  max-width: 1200px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.sign-up {
  display: flex;
  width: 100%;
  height: 100%;
  justify-content: center;
  align-items: center;
}

.signup-left {
  width: 40%;
  display: flex;
  flex-flow: column wrap;
  justify-content: center;
  font-size: 14px;
  background: rgba(249, 63, 75, 0.704);
  border-radius: 10px 0 0 10px;
  height: 70vh;
}

.signup-right {
  width: 40%;
  padding: 20px;
  background: rgba(255, 255, 255, 0.591);
  border-radius: 0 10px 10px 0;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 70vh;
}

.card {
  background-color: rgba(255, 255, 255, 1);
  border-radius: 15px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  padding: 20px;
  width: 450px;
  max-width: 100%;
  position: absolute;
  left: 32%;
}

.card-header, .btn {
  background-color: #ff4d4d;
  color: white;
}

.invalid-feedback {
  color: red;
  display: block;
}

#termsModal .modal-body {
  max-height: 400px;
  overflow-y: auto;
}

.term-item {
  border: 1px solid #ccc;
  padding: 10px;
  border-radius: 5px;
  margin-bottom: 10px;
}

.form-area {
  width: 100%;
}

.organize-form {
  width: 100%;
  height: 100%;
  display: flex;
  flex-flow: column wrap;
  justify-content: space-around;
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

.hidden {
  display: none;
}

@media (max-width: 768px) {
  .btn-check {
    padding: 8px 15px;
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
</style>
</head>
<body>
<header>
    <div class="header-container">
        <img src="${pageContext.request.contextPath}/image/GamebitLogo.png" alt="Logo" class="logo">
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
            <button class="login-button" onclick="location.href='/members/signup.jsp'">Login</button>
            <div class="hamburger-menu" onclick="toggleMenu()">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
    </div>
</header>
<div class="container">
    <div class="sign-up">
        <div class="signup-left">
        </div>
        <div class="signup-right">
            <div class="card">
                <div class="card-header text-center">회원가입</div>
                <form id="joinform">
                    <div class="card-body">
                        <div class="mb-3">
                            <label class="form-label" for="userId">아이디</label>
                            <div class="input-group">
                                <input class="form-control" type="text" name="userId" id="userId" placeholder="아이디" />
                                <button class="btn" type="button" id="idcheck">중복체크</button>
                            </div>
                            <div id="result" class="invalid-feedback"></div>
                        </div>
                        <div class="mb-3">
                            <label for="inputPassword4" class="form-label">패스워드</label> 
                            <input type="password" class="form-control" id="inputPassword4" name="userPwd" placeholder="패스워드" oninput="checkPassword()">
                            <div id="passwordFeedback" class="invalid-feedback"></div>
                        </div>
                        <div class="mb-3">
                            <label for="inputPassword4Check" class="form-label">패스워드 확인</label> 
                            <input type="password" class="form-control" id="inputPassword4Check" placeholder="패스워드 재입력" oninput="checkPassword()">
                            <div id="passwordMatch" class="invalid-feedback"></div>
                        </div>
                        <div class="mb-3">
                            <label for="userName" class="form-label">이름</label> 
                            <input type="text" class="form-control" id="userName" name="userName" placeholder="이름">
                            <div id="nameFeedback" class="invalid-feedback"></div>
                        </div>
                        <div class="mb-3">
                            <label for="nickName" class="form-label">닉네임</label> 
                            <div class="input-group">
                                <input type="text" class="form-control" id="nickName" name="nickName" placeholder="닉네임">
                                <button class="btn" type="button" id="nicknameCheck">중복체크</button>
                            </div>
                            <div id="nicknameResult" class="invalid-feedback"></div>
                        </div>
                        <div class="mb-3">
                            <label for="vcMobile1" class="form-label">휴대전화</label>
                            <div class="input-group">
                                <select class="form-select" name="vcMobile1" id="vcMobile1">
                                    <option value="">선택</option>
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="012">012</option>
                                    <option value="013">013</option>
                                    <option value="014">014</option>
                                    <option value="015">015</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="070">070</option>
                                </select>
                                <input type="text" class="form-control" maxlength="4" id="vcMobile2" name="vcMobile2" style="width: 20%;" placeholder="1234">
                                <input type="text" class="form-control" maxlength="4" id="vcMobile3" name="vcMobile3" style="width: 20%;" placeholder="5678">
                            </div>
                            <div id="phoneFeedback" class="invalid-feedback">휴대전화를 입력해주세요.</div>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">이메일</label> 
                            <input type="email" class="form-control" id="email" name="email" placeholder="이메일">
                            <div id="emailFeedback" class="invalid-feedback">이메일을 입력해주세요.</div>
                        </div>
                        <div class="mb-3">
                            <label for="birth_date" class="form-label">생년월일</label> 
                            <input type="text" class="form-control" id="birth_date" name="birth_date" placeholder="YYYYMMDD">
                        </div>
                        <div class="mb-3">
                            <label for="gender" class="form-label">성별</label> 
                            <select class="form-select" name="gender" id="gender">
                                <option value="M">남성</option>
                                <option value="F">여성</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="signout" class="form-label">회원 상태</label> 
                            <select class="form-select" name="signout" id="signout">
                                <option value="n">활성</option>
                                <option value="y">비활성</option>
                            </select>
                        </div>
                        <div class="mb-3 form-check">
                            <input class="form-check-input" type="checkbox" id="gridCheck" data-bs-toggle="modal" data-bs-target="#termsModal">
                            <label class="form-check-label" for="gridCheck"> 약관에 동의합니다. </label>
                            <div id="agreementFeedback" class="invalid-feedback"></div>
                        </div>
                        <button id="join" type="button" class="btn">가입하기</button>
                        <button id="back" type="button" class="btn">돌아가기</button>
                    </div>
                    <input type="hidden" id="phone" name="phone"> 
                    <input type="hidden" id="adminKey" name="adminKey" value="0">
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 약관 동의 모달 -->
<div class="modal fade" id="termsModal" tabindex="-1" aria-labelledby="termsModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="termsModalLabel">약관 동의</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="term-item">
                    <h5>회원가입 약관에 모두 동의합니다</h5>
                    <input type="checkbox" id="agreeAll"> 모두 동의합니다
                </div>
                <div class="term-item">
                    <h5>이용약관 동의 (필수)</h5>
                    <textarea readonly rows="10" style="width: 100%;">
                                       제1조(목적) 이 약관은 업체 회사(전자상거래 사업자)가 운영하는 업체 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.
                    </textarea>
                    <input type="checkbox" class="agree-term"> 이용약관에 동의합니다
                </div>
                <div class="term-item">
                    <h5>개인정보 수집 및 이용 동의 (필수)</h5>
                    <textarea readonly rows="5" style="width: 100%;">
                   개인정보처리방침
                   [차례]
                    </textarea>
                    <input type="checkbox" class="agree-term"> 개인정보 수집 및 이용에 동의합니다
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="termsAgreeButton">동의</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<script>
    let didIdCheck = false;
    let didNicknameCheck = false;

    $("#back").on("click", function() {
        location.href = "/index.jsp";
    });

    $("#idcheck").on("click", function() {
        let userId = $("#userId").val();
        let idRegex = /^[a-z0-9_]{8,}$/;

        if (userId == "") {
            alert("ID를 먼저 입력해주세요");
            return;
        }

        if (!idRegex.test(userId)) {
            $("#result").text("ID는 8자 이상의 알파벳 소문자, 숫자, _ 로만 구성되어야 합니다.").css("color", "red");
            return;
        }

        $.ajax({
            type: "GET",
            url: "/idcheck.members",
            data: { userId: userId },
            success: function(response) {
                if (response.trim() === "true") {
                    $("#result").text("사용 가능한 ID 입니다.").css("color", "green");
                    didIdCheck = true;
                } else {
                    $("#result").text("이미 사용 중인 ID 입니다.").css("color", "red");
                    didIdCheck = false;
                }
            },
            error: function(error) {
                alert("ID 중복 체크 중 오류가 발생했습니다.");
                console.error(error);
            }
        });
    });

    $("#nicknameCheck").on("click", function() {
        let nickname = $("#nickName").val();

        if (nickname == "") {
            alert("닉네임을 먼저 입력해주세요");
            return;
        }

        $.ajax({
            type: "GET",
            url: "/nicknameCheck.members",
            data: { nickname: nickname },
            success: function(response) {
                if (response.trim() === "true") {
                    $("#nicknameResult").text("사용 가능한 닉네임 입니다.").css("color", "green");
                    didNicknameCheck = true;
                } else {
                    $("#nicknameResult").text("이미 사용 중인 닉네임 입니다.").css("color", "red");
                    didNicknameCheck = false;
                }
            },
            error: function(error) {
                alert("닉네임 중복 체크 중 오류가 발생했습니다.");
                console.error(error);
            }
        });
    });

    $("#gridCheck").on("click", function() {
        if (!$(this).is(":checked")) {
            $("#termsModal").modal('show');
        }
    });

    $("#agreeAll").on("change", function() {
        $(".agree-term").prop("checked", $(this).is(":checked"));
    });

    $(".agree-term").on("change", function() {
        if ($(".agree-term:checked").length === $(".agree-term").length) {
            $("#agreeAll").prop("checked", true);
        } else {
            $("#agreeAll").prop("checked", false);
        }
    });

    $("#termsAgreeButton").on("click", function() {
        if ($(".agree-term:checked").length === $(".agree-term").length) {
            $("#gridCheck").prop("checked", true);
            $("#agreementFeedback").text("");
            $("#termsModal").modal('hide');
        } else {
            $("#agreementFeedback").text("모든 약관에 동의해주세요.").css("color", "red");
        }
    });

    $("#join").on("click", function() {
        let userId = $("#userId").val();
        let password = $("#inputPassword4").val();
        let passwordCheck = $("#inputPassword4Check").val();
        let userName = $("#userName").val();
        let gridCheck = $("#gridCheck").is(":checked");
        let email = $("#email").val();

        let isValid = true;

        // ID 유효성 검사
        let idRegex = /^[a-z0-9_]{8,}$/;
        if (!idRegex.test(userId)) {
            $("#result").text("ID는 8자 이상의 알파벳 소문자, 숫자, _ 로만 구성되어야 합니다.").css("color", "red");
            isValid = false;
        } else {
            $("#result").text("");
        }

        // 패스워드 유효성 검사
        let passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$/;
        if (!passwordRegex.test(password)) {
            $("#passwordFeedback").text("패스워드는 알파벳 대문자, 소문자, 숫자를 각 하나 이상 포함해야 하며, 최소 8자 이상이어야 합니다.");
            isValid = false;
        } else {
            $("#passwordFeedback").text("");
        }

        // 패스워드 일치 검사
        if (password !== passwordCheck) {
            $("#passwordMatch").text("패스워드가 일치하지 않습니다.").css("color", "red");
            isValid = false;
        } else {
            $("#passwordMatch").text("패스워드가 일치합니다.").css("color", "green");
        }

        // 이름 유효성 검사
        let nameRegex = /^[가-힣]{2,5}$/;
        if (!nameRegex.test(userName)) {
            $("#nameFeedback").text("이름은 한글로 2 ~ 5자만 가능합니다.");
            isValid = false;
        } else {
            $("#nameFeedback").text("");
        }

        // 이메일 유효성 검사
        if (email === "") {
            $("#emailFeedback").text("이메일을 입력해주세요.").show();
            isValid = false;
        } else {
            $("#emailFeedback").hide();
        }

        // 약관 동의 체크
        if (!gridCheck) {
            $("#agreementFeedback").text("약관에 동의해주세요.");
            isValid = false;
        } else {
            $("#agreementFeedback").text("");
        }

        // 휴대전화 번호 유효성 검사
        let mobile1 = $("#vcMobile1").val();
        let mobile2 = $("#vcMobile2").val();
        let mobile3 = $("#vcMobile3").val();
        if (mobile1 === "" || mobile2 === "" || mobile3 === "") {
            $("#phoneFeedback").text("휴대전화 번호를 올바르게 입력해주세요.");
            isValid = false;
        } else {
            let phone = mobile1 + mobile2 + mobile3;
            if (phone.length !== 11) {
                $("#phoneFeedback").text("휴대전화 번호는 11자리여야 합니다.");
                isValid = false;
            } else {
                $("#phone").val(phone);
                $("#phoneFeedback").text("휴대전화 입력 완료").css("color", "green");
            }
        }

        if (!didIdCheck) {
            $("#result").text("ID 중복체크를 해주세요.").css("color", "red");
            isValid = false;
        }

        if (!didNicknameCheck) {
            $("#nicknameResult").text("닉네임 중복체크를 해주세요.").css("color", "red");
            isValid = false;
        }

        if (isValid) {
            let formData = $("#joinform").serialize();
            console.log(formData); // 폼 데이터 확인
            $.ajax({
                type: "POST",
                url: "/signup.members", // URL 경로 수정
                data: formData,
                success: function(response) {
                    alert("회원가입이 완료되었습니다.");
                    location.href = "/index.jsp";
                },
                error: function(xhr, status, error) {
                    alert("회원가입 중 오류가 발생했습니다.");
                    console.error("Error Status: ", status);
                    console.error("Error: ", error);
                    console.error("Response: ", xhr.responseText);
                }
            });
        }
    });

    function checkPassword() {
        let inputPassword4 = document.getElementById("inputPassword4").value;
        let inputPassword4Check = document.getElementById("inputPassword4Check").value;
        let matchText = document.getElementById("passwordMatch");

        let passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$/;

        if (!passwordRegex.test(inputPassword4)) {
            matchText.textContent = "패스워드는 알파벳 대문자, 소문자, 숫자를 각 하나 이상 포함해야 하며, 최소 8자 이상이어야 합니다.";
            matchText.style.color = "red";
            return;
        }

        if (inputPassword4 === inputPassword4Check) {
            matchText.textContent = "패스워드가 일치합니다!";
            matchText.style.color = "green";
        } else {
            matchText.textContent = "패스워드가 일치하지 않습니다.";
            matchText.style.color = "red";
        }
    }
</script>
</body>
</html>
