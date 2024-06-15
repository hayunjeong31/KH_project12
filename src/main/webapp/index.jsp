<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
    integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
    crossorigin="anonymous"></script>
<style>
input {
    text-align: center;
}
td {
    text-align: center;
}
</style>
</head>
<body>

<c:choose>
    <c:when test="${not empty sessionScope.loginID}">
        <table border="1" align="center">
            <tr>
                <th colspan="4">${sessionScope.loginID}님 환영합니다.</th>
            </tr>
            <tr>
                <td>
                    <button id="logout">로그아웃</button>
                    <button id="myinfo">내정보</button>
                </td>      
            </tr>
        </table>

        <script>
            $(document).ready(function() {
                $("#logout").on("click", function() {
                    console.log("로그아웃 버튼 클릭");
                    location.href = "/logout.members";
                });
                
                $("#myinfo").on("click", function() {
                    console.log("내정보 버튼 클릭");
                    location.href = "/mypage.members";
                });
            });
        </script>
    </c:when>

    <c:otherwise>
        <form action="/login.members" method="post">
            <table border="1" align="center">
                <tr>
                    <th>Login</th>
                </tr>
                <tr>
                    <td><input type="text" placeholder="ID를 입력하세요" name="id" required></td>
                </tr>
                <tr>
                    <td><input type="password" placeholder="비밀번호를 입력하세요" name="pw" required></td>
                </tr>
                <tr align="center">
                    <td>
                        <button type="submit" id="login">로그인</button>
                        <button type="button" id="signup">회원가입</button>
                    </td>
                </tr>
            </table>
        </form>
    </c:otherwise>
</c:choose>

<script>
    $(document).ready(function() {
        $("#signup").on("click", function() {
            console.log("회원가입 버튼 클릭");
            location.href = "/members/signup.jsp";
        });
    });
</script>

</body>
</html>
