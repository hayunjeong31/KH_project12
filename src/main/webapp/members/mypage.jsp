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
<link rel="stylesheet" href="Css/header_style.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="${pageContext.request.contextPath}
       /css/header_styles.css" rel="stylesheet" type="text/css">
<style>
* {
   box-sizing: border-box;
   margin: 0;
   padding: 0;
}

body, html {
   height: 100%;
   font-family: Arial, sans-serif;
}

body {
   font-family: 'Open Sans', sans-serif;
   margin: 0;
   padding: 0;
   display: flex;
   justify-content: center;
   align-items: center;
   height: 100vh;
   background-image: url('image/5033917.jpg');
   background-size: cover;
   background-position: center;
}

.main {
   display: flex;
   justify-content: center;
   align-items: center;
   height: 80%;
   width: 80%;
   background-color: rgba(255, 255, 255, 0.298);
   margin: auto;
   border-radius: 10px;
   box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
}

.mypage-section {
   display: flex;
   width: 100%;
   height: 100%;
   border-radius: 10px;
   overflow: hidden;
}

.mypage-left {
   flex: 1;
   background-color: rgba(212, 15, 196, 0.383);
   color: white;
   display: flex;
   flex-direction: column;
   justify-content: center;
   align-items: center;
   padding: 20px;
}

.mypage-left h1 {
   font-size: 36px;
}

.mypage-info-area {
   flex: 2;
   padding: 40px;
   display: flex;
   flex-direction: column;
   justify-content: center;
   align-items: center;
}

.mypage-info-area h2 {
   font-size: 2em;
   margin-bottom: 20px;
   color: black;
   text-align: center;
}

.info-form {
   width: 100%;
   max-width: 800px;
}

.info-field {
   margin-bottom: 20px;
   display: flex;
   flex-direction: column;
}

.info-field label {
   margin-bottom: 5px;
   font-weight: bold;
   font-size: 1em;
}

.info-field [contenteditable="true"] {
   width: 100%;
   padding: 10px;
   border: 1px solid #cccccc77;
   border-radius: 5px;
   font-size: 1em;
   background-color: #f4f4f4;
   color: black;
}

.info-field [contenteditable="false"] {
   width: 100%;
   padding: 10px;
   border: 1px solid #cccccc77;
   border-radius: 5px;
   font-size: 1em;
   background-color: #e9e9e9;
   color: black;
}

.form-buttons {
   display: flex;
   justify-content: center;
   width: 100%;
   margin-bottom: 50px;
}

.form-buttons button {
   padding: 10px 20px;
   border: none;
   background-color: rgba(212, 15, 196, 0.383);
   color: white;
   border-radius: 5px;
   cursor: pointer;
   font-size: 1em;
   width: 30%;
}

.form-buttons button:hover {
   background-color: rgba(212, 15, 196, 0.546);
}

header {
   width: 100%;
   position: fixed;
   top: 0;
   left: 0;
   z-index: 1000;
   background-color: black;
   box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
   height: 60px;
}

.hamburger-menu {
   display: none;
   flex-direction: column;
   cursor: pointer;
   margin-left: 20px;
}

.hamburger-menu div {
   width: 25px;
   height: 3px;
   background-color: white;
   margin: 4px 0;
}
.modal {
      display: none;
      position: fixed;
      z-index: 1;
      padding-top: 100px;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgb(0, 0, 0);
      background-color: rgba(0, 0, 0, 0.4);
   }
   .modal-content {
      background-color: #fefefe;
      margin: auto;
      padding: 25px;
      border: 1px solid #fefefe;
      width: 20%;
   }
   .modal-close {
      color: gray;
      float: right;
      font-size: 25px;
      font-weight: bold;
   }
   .modal-close:hover, .modal-close:focus {
      color: black;
      text-decoration: none;
      cursor: pointer;
   }


@media ( max-width : 768px) {
   nav ul {
      display: none;
      flex-direction: column;
      position: absolute;
      top: 60px;
      left: 0;
      width: 100%;
      background-color: black;
   }
   nav ul li {
      margin: 0;
   }
   nav ul li a {
      padding: 15px;
   }
   .hamburger-menu {
      display: flex;
   }
   .header-buttons {
      margin-left: auto;
   }
   .header-buttons button {
      display: none;
   }
   .header-buttons .hamburger-menu {
      display: flex;
   }
   
}
</style>
</head>

<body>
   <header>
      <div class="header-container">
         <img src="image/GamebitLogo.png" alt="Logo" class="logo">
         <nav>
            <ul>
               <li><a href="index.html">홈</a>
                  <div class="dropdown"></div></li>
               <li><a href="#">게임</a>
                  <div class="dropdown">
                     <a href="win.html">명예의 전당</a> <a href="#">Subitem 2</a> <a
                        href="#">랭킹</a>
                  </div></li>
               <li><a href="board.html">게시판</a>
                  <div class="dropdown">
                     <a href="board.html">게시판</a> <a href="#">Q&A</a> <a href="#">공지사항</a>
                  </div></li>
               <li><a href="#">마이페이지</a>
                  <div class="dropdown">
                     <a href="#">내 정보 수정</a>
                  </div></li>
               <li><a href="#">관리자 페이지</a>
                  <div class="dropdown">
                     <a href="#">대시보드</a> <a href="#">통계</a>
                  </div></li>
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
      <section class="mypage-section">
         <article class="mypage-left">
            <h1>마이페이지</h1>
         </article>
         <article class="mypage-info-area">
            <h2>내 정보</h2>
            <c:choose>
               <c:when test="${dto == null}">에러</c:when>
               <c:otherwise>
                  <form class="info-form" action="/edit.members" id="edit_form"
                     method="post">
                     <div class="info-field">
                        <label for="userId">ID</label>
                        <div class="form-value" id="userId" contenteditable="false">${dto.userId}</div>
                        <input type="hidden" name="userId" id="hiddenUserId"
                           value="${dto.userId}">
                     </div>
                     <div class="info-field">
                        <label for="userName">이름</label>
                        <div class="form-value" id="userName" contenteditable="false">${dto.userName}</div>
                        <input type="hidden" name="userName" id="hiddenUserName"
                           value="${dto.userName}">
                     </div>
                     <div class="info-field">
                        <label for="nickName">닉네임</label>
                        <div class="form-value" id="nickName" contenteditable="false">${dto.nickName}</div>
                        <input type="hidden" name="nickName" id="hiddenNickName"
                           value="${dto.nickName}">
                     </div>
                     <div class="info-field">
                        <label for="phone">전화번호</label>
                        <div class="form-value" id="phone" contenteditable="false">${dto.phone}</div>
                        <input type="hidden" name="phone" id="hiddenPhone"
                           value="${dto.phone}">
                     </div>
                     <div class="info-field">
                        <label for="email">이메일</label>
                        <div class="form-value" id="email" contenteditable="false">${dto.email}</div>
                        <input type="hidden" name="email" id="hiddenEmail"
                           value="${dto.email}">
                     </div>
                     <div class="info-field">
                        <label for="join_date">가입 날짜</label>
                        <fmt:formatDate value="${dto.join_date}" pattern="yyyy.MM.dd" />
                     </div>
                     <div class="form-buttons">
                        <button type="button" id="edit">수정하기</button>
                        <button type="button" id="pwdChange">비밀번호 변경</button>
                        <button type="button" id="back">홈으로</button>
                        <button type="submit" id="ok" style="display: none;">수정완료</button>
                        <button type="button" id="cancel" style="display: none;">취소하기</button>
                        <button type="button" id="memberout">회원탈퇴</button>
                        <button type="button" id="toMyFreePost">내가 작성한 자유</button>
                        <button type="button" id="toMyQPost">내가 작성한 QnA</button>
                     </div>
                  </form>
               </c:otherwise>
            </c:choose>
         </article>
      </section>
      <!-- 회원탈퇴 모달창 -->
      <div id="myModal" class="modal">
         <div class="modal-content" id="myContent">
            <span class="modal-close">&times;</span>
            <p>정말 탈퇴하시겠습니까?</p>
            <button id="confirmMemberOut">예</button>
            <button id="cancelMemberOut">아니오</button>
         </div>
      </div>

      <!-- 비밀번호 변경 모달창 -->
      <div id="pwdModal" class="modal">
         <div class="modal-content" id="pwdContent">
            <span class="modal-close">&times;</span>
            <h2>비밀번호 수정</h2>
            <form id="pwdForm" method="post">
               <div class="form-row">
                  <div class="form-label">현재 비밀번호</div>
                  <div class="form-value">
                     <input type="password" id="currentPwd" name="currentPwd">
                  </div>
               </div>
               <div class="form-row">
                  <div class="form-label">새 비밀번호</div>
                  <div class="form-value">
                     <input type="password" id="newPwd" name="newPwd">
                  </div>
               </div>
               <div class="form-row">
                  <div class="form-label">새 비밀번호 확인</div>
                  <div class="form-value">
                     <input type="password" id="confirmPwd" name="confirmPwd">
                  </div>
               </div>
               <div class="button-container">
                  <button type="button" id="savePwd">저장</button>
                  <button type="button" id="cancelPwd">취소</button>
               </div>
            </form>
         </div>
      </div>
   </main>

   <script>
      function toggleMenu() {
         const navUl = document.querySelector('nav ul');
         navUl.style.display = navUl.style.display === 'flex' ? 'none'
               : 'flex';
      }
      
      // 내가 작성한 눌렀을 시
      $("#toMyFreePost").on("click", function(){
         location.href = "/myfreepostlist.board";
      })
      
      $("#toMyQPost").on("click", function(){
         location.href = "/myqpostlist.qboard";
      })
      
      
      

      // 회원 탈퇴 눌렀을 시
      $("#memberout").on("click", function() {
         $("#myModal").show();
      });

      $(".modal-close, #cancelMemberOut").on("click", function() {
         $("#myModal").hide();
      });

      $("#confirmMemberOut").on("click", function() {
         location.href = "/memberout.members?userId=${dto.userId}";
      });

      // 비밀번호 변경 버튼 눌렀을 시
      $("#pwdChange").on("click", function() {
         $("#pwdModal").show();
      });

      $(".modal-close, #cancelPwd").on("click", function() {
         $("#pwdModal").hide();
      });
      
      // 비밀번호 변경 저장 버튼 눌렀을 시

      $("#savePwd").on("click", function() {
           let currentPwd = $("#currentPwd").val().trim();
           let newPwd = $("#newPwd").val().trim();
           let confirmPwd = $("#confirmPwd").val().trim();

           // 비번 정규 표현식 패턴
           let passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$/;

           // 비밀번호 유효성 검사
           if (!passwordPattern.test(newPwd)) {
               alert("비밀번호는 최소 8자 이상, 대소문자 및 숫자를 포함해야 합니다.");
               return;
           }

           // 새 비밀번호와 확인 비밀번호 일치 여부 확인
           if (newPwd !== confirmPwd) {
               alert("새 비밀번호가 일치하지 않습니다.");
               return;
           }

           // 현재 비밀번호, 새 비밀번호 모두 입력 여부 확인
           if (currentPwd === "" || newPwd === "" || confirmPwd === "") {
               alert("모든 필드를 입력해주세요.");
               return;
           }

           // AJAX 요청을 사용하여 비밀번호 변경
           $.ajax({
               url: '/pwdChange.members',
               method: 'POST',
               contentType: "application/x-www-form-urlencoded; charset=UTF-8",
               data: {
                   currentPwd: currentPwd,
                   newPwd: newPwd
               },
               success: function(response) {
            	   console.log(response)
                   let responseObj = JSON.parse(response);
                   console.log(responseObj)
                   if (responseObj.success) {
                       alert("비밀번호가 성공적으로 변경되었습니다.");
                       $("#pwdModal").hide(); // 모달 닫기
                   } else {
                       if (responseObj.error === "currentPwdIncorrect") {
                           alert("현재 비밀번호가 일치하지 않습니다.");
                       } else if (responseObj.error === "pwdUpdateFailed") {
                           alert("비밀번호 변경에 실패했습니다. 다시 시도해 주세요.");
                       } else {
                           alert("비밀번호 변경 중 오류가 발생했습니다.");
                       }
                   }
               }, error: function(request, status, error){
            	   console.log(status);
               }
           });
       });

      // 수정하기 버튼 눌렀을 시
      $("#edit").on(
            "click",
            function() {
               $("#userName[contenteditable='false']").attr(
                     "contenteditable", "true");
               $("#phone[contenteditable='false']").attr(
                     "contenteditable", "true");
               $("#email[contenteditable='false']").attr(
                     "contenteditable", "true");

               $("#edit").hide();
               $("#back").hide();
               $("#pwdChange").hide();
               $("#ok").show();
               $("#cancel").show();
            });

      $("#edit_form").on("submit",function(event) {
                     // 유효성 검사
                     let isValid = true;

                     let userName = $("#userName").text().trim();
                     let phone = $("#phone").text().trim();
                     let email = $("#email").text().trim();

                     // 이름 유효성 검사
                     let namePattern = /^[가-힣]{2,5}$/;
                     if (!namePattern.test(userName)) {
                        isValid = false;
                        alert("2~5자의 한글 이름을 입력해주세요.");
                     }

                     // 전화번호 유효성 검사
                     let phonePattern = /^(011|010)\d{8}$/; // 전화번호 패턴 (11자리 숫자)
                     if (!phonePattern.test(콜)) {
                        isValid = false;
                        alert("전화번호를 다시 입력해주세요.");
                     }

                     // 이메일 유효성 검사
                     let emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
                     if (!emailPattern.test(email)) {
                        isValid = false;
                        alert("이메일 주소를 다시 입력해주세요.");
                     }

                     // 유효하지 않으면 폼 제출 막음
                     if (!isValid) {
                        event.preventDefault();
                        return false;
                     }

                     // 유효하면 hidden input에 값 설정
                     $("#hiddenUserName").val(userName);
                     $("#hiddenPhone").val(콜);
                     $("#hiddenEmail").val(email);
                  });

      $("#cancel").on("click", function() {
         location.href = "/mypage.members";
      });

      $("#back").on("click", function() {
         location.href = "/index.jsp";
      });
   </script>
</body>

