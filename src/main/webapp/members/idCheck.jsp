<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인 결과</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous">
</script>
<style>
table {
	width: 100%;
}
</style>
</head>
<body>

	<table border="1">
		<tr>
			<th>아이디 중복 결과 확인</th>
		</tr>
			<c:choose>
				<c:when test="${result}">
					<tr>
						<td align="center">이미 사용중인 ID입니다.
					</tr>
					<tr>
						<td align ="center"><button id="close">닫기</button>
						<script>
							$("#close").on("click",function(){
								opener.document.getElementById("id").value="";
								window.close();
							})
						</script>
					</tr>
						
					</c:when>
					<c:otherwise>
						<tr>
							<td align="center"> 사용 가능한 ID입니다. <br>
							정말 사용하시겠습니까?
						</tr>
						
						<tr>
							<td align="center">
							<button id="use">사용</button>
							<button id="cancel">취소</button>
							<script>
							$("#use").on("click",function(){
								window.close();
							})
							
							$("#cancel").on("click",function(){
								opener.document.getElementById("id").value="";
								window.close();
							})
						</script>
					
						</tr>
					</c:otherwise>
			</c:choose>
	</table>

</body>
</html>
