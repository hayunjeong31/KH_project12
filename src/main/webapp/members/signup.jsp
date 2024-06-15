<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Signup Form</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
    integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
    crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<style>
.input-group-text {
    background-color: #e9ecef;
}

.invalid-feedback {
    color: red;
    display: block;
}

#warn {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    color: red;
    flex-direction: column;
    margin: auto;
    width: 600px;
}

#idcheck:hover, #postcode:hover, #join:hover, #back:hover {
    background-color: #45a049;
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
</style>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="card">
                    <div class="card-header">회원가입</div>
                    <form id="joinform">
                        <div class="card-body">
                            <!-- 나머지 폼 요소들 -->
                            <div class="mb-3">
                                <label class="form-label" for="userId">아이디</label>
                                <div class="input-group">
                                    <input class="form-control" type="text" name="userId" id="userId" placeholder="아이디" />
                                    <button class="btn btn-primary" type="button" id="idcheck">중복체크</button>
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
                                <input type="text" class="form-control" id="nickName" name="nickName" placeholder="닉네임">
                            </div>
                            <div class="mb-3">
                                <label for="vcMobile1" class="form-label">휴대전화</label>
                                <div class="input-group">
                                    <select class="form-select" name="vcMobile1" id="vcMobile1">
                                        <option value="">선택</option>
                                        <option value="010">010</option>
                                        <option value="010">011</option>
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
                                <input type="text" class="form-control" id="birth_date" name="birth_date" placeholder="YYMMDD">
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
                            <button id="join" type="button" class="btn btn-primary">가입하기</button>
                            <button id="back" type="button" class="btn btn-primary">돌아가기</button>
                        </div>
                        <input type="hidden" id="phone" name="phone"> 
                        <input type="hidden" id="adminKey" name="adminKey" value="0">
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Terms and Conditions Modal -->
    <div class="modal fade" id="termsModal" tabindex="-1" aria-labelledby="termsModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
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
                        <textarea readonly>여기에 이용약관 내용을 입력하세요...</textarea>
                        <input type="checkbox" class="agree-term"> 이용약관에 동의합니다
                    </div>
                    <div class="term-item">
                        <h5>개인정보 수집 및 이용 동의 (필수)</h5>
                        <textarea readonly>여기에 개인정보 수집 및 이용 동의 내용을 입력하세요...</textarea>
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
                $("#passwordMatch").text("패스워드가 일치하지 않습니다.");
                isValid = false;
            } else {
                $("#passwordMatch").text("");
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

            if (isValid) {
                let formData = $("#joinform").serialize();
                console.log(formData); // 폼 데이터 확인
                $.ajax({
                    type: "POST",
                    url: "/signup.members",
                    data: formData,
                    success: function(response) {
                        alert("회원가입이 완료되었습니다.");
                        location.href = "/index.jsp";
                    },
                    error: function(error) {
                        alert("회원가입 중 오류가 발생했습니다.");
                        console.error(error);
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
                return;
            }

            if (inputPassword4 === inputPassword4Check) {
                matchText.textContent = "패스워드가 일치합니다!";
            } else {
                matchText.textContent = "패스워드가 일치하지 않습니다.";
            }
        }
    </script>
</body>
</html>
