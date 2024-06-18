<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" ageEncoding="UTF-8"%>
>>>>>>> a91a0e4e24369a7d37098e7fe4f080ccfb4a906b
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

<<<<<<< HEAD
=======
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

	<script>
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

    if (newPwd !== confirmPwd) {
        alert("새 비밀번호가 일치하지 않습니다.");
        return;
    }

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
            let responseObj = JSON.parse(response);
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

		$("#edit_form").on("submit", function() {
			$("#hiddenUserName").val($("#userName").text().trim());
			$("#hiddenPhone").val($("#phone").text().trim());
			$("#hiddenEmail").val($("#email").text().trim());
		});

		$("#cancel").on("click", function() {
			location.href = "/mypage.members";
		});

		$("#back").on("click", function() {
			location.href = "/main.jsp";
		});
	</script>
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

>>>>>>> a91a0e4e24369a7d37098e7fe4f080ccfb4a906b
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
