<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<style>
    .form-container {
        border: 1px solid;
        width: 30%;
        margin: 0 auto;
    }
    .form-row {
        display: flex;
        border-bottom: 1px solid;
    }
    .form-label {
        width: 20%;
        font-weight: bold;
        padding: 8px;
        box-sizing: border-box;
        background-color: #F93F4CFF;
        color: white;
    }
    .form-value {
        width: 80%;
        padding: 8px;
        box-sizing: border-box;
    }
    .form-value[contenteditable="true"] {
        background-color: #f0f0f0;
    }
    .button-container {
        text-align: center;
        margin-top: 20px;
    }
</style>
<body>
   <c:choose>
    <c:when test="${dto == null }">
        에러
    </c:when>
    <c:otherwise>
        <form action="/edit.members" id="edit_form" method="post">
            <div class="form-container">
                <div class="form-row">
                    <div class="form-label">ID</div>
                    <div class="form-value" id="userId" contenteditable="false">${dto.userId}</div>
                    <input type="hidden" name="userId" id="hiddenUserId" value="${dto.userId}">
                </div>
                <div class="form-row">
                    <div class="form-label">Name</div>
                    <div class="form-value" id="userName" contenteditable="false">${dto.userName}</div>
                    <input type="hidden" name="userName" id="hiddenUserName" value="${dto.userName}">
                </div>
                <div class="form-row">
                    <div class="form-label">Nickname</div>
                    <div class="form-value" id="nickName" contenteditable="false">${dto.nickName}</div>
                    <input type="hidden" name="nickName" id="hiddenNickName" value="${dto.nickName}">
                </div>
                <div class="form-row">
                    <div class="form-label">Phone</div>
                    <div class="form-value" id="phone" contenteditable="false">${dto.phone}</div>
                    <input type="hidden" name="phone" id="hiddenPhone" value="${dto.phone}">
                </div>
                <div class="form-row">
                    <div class="form-label">Email</div>
                    <div class="form-value" id="email" contenteditable="false">${dto.email}</div>
                    <input type="hidden" name="email" id="hiddenEmail" value="${dto.email}">
                </div>
                <div class="form-row">
                    <div class="form-label">Join Date</div>
                    <div class="form-value"><fmt:formatDate value="${dto.join_date}" pattern="yyyy.MM.dd" /></div>
                </div>
            </div>
            <div class="button-container">
                <button type="button" id="edit">수정하기</button>
                <button type="button" id="back">홈으로</button>
                <button type="submit" id="ok" style="display: none;">수정 완료</button>
                <button type="button" id="cancel" style="display: none;">취소 하기</button>
                <button type="button" id="memberout">회원탈퇴</button>
            </div>
        </form>
    </c:otherwise>
</c:choose>

   <script>
      $("#memberout").on("click",function(){
          location.href="/memberout.members?userId=${dto.userId}";
      });
   
      $("#edit").on("click", function() {
          $("#userName[contenteditable='false']").attr("contenteditable", "true");         
          $("#phone[contenteditable='false']").attr("contenteditable", "true");
          $("#email[contenteditable='false']").attr("contenteditable", "true");

          $("#edit").hide();
          $("#back").hide();
          $("#ok").show();
          $("#cancel").show();
      });
      
      $("#edit_form").on("submit",function(){
          $("#hiddenUserName").val($("#userName").text().trim());
          $("#hiddenPhone").val($("#phone").text().trim());
          $("#hiddenEmail").val($("#email").text().trim());
      });
      
      $("#cancel").on("click",function(){
          location.href = "/mypage.members";
      });
      
      $("#back").on("click", function() {
          location.href = "/main.jsp";
      });
   </script>
</body>
</html>
