<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  



<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.7.1.js" ></script> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="${pageContext.request.contextPath}/css/header_styles.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/galmuri/dist/galmuri.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />

    <title>게시물 상세보기</title>
    <style>
                * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body,
        html {
            height: 100%;
        }

        body {
			font-family: "GalmuriMono9", monospace;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('image/5033917.jpg');
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
            background-image: url('image/9.png');
        }

       

        .main {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            background-color: #f4f4f462;
            width: 80%;
            height: 80%;
            margin: 80px auto;
            /* 헤더 고정으로 인한 상단 마진 추가 */
            border-radius: 10px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
        }

        .board-section {
            display: flex;
            width: 100%;
            height: 100%;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            background-color: rgba(255, 255, 255, 0.412);
        }

        .board-left {
            flex: 1;
            background-color: rgba(45, 19, 112, 0.684);
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .board-left h1 {
            font-size: 36px;
        }

		/* 스크롤 scroll 주기(overflow-x:hidden)
			justify-content: flex-start줘서 글 시작 상단에 시작되게!
		*/
		strong{
			font-family: "GalmuriMono9", monospace;
		}
        .board-area {
			font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;

            flex: 2;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: center;
            overflow-y:auto;
            overflow-x:hidden;
        }

        .board-area h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: black;
            text-align: center;
        }

        .board-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .board-table th,
        .board-table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
            color: black;
        }

        .board-table th {
            background-color: #f4f4f4;
        }

        .board-table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .board-table a {
            color: black;
            text-decoration: none;
        }

        .board-table a:hover {
            text-decoration: underline;
        }

        .pagination {
            margin-bottom: 20px;
        }

        .pagination button {
            margin: 0 5px;
            padding: 5px 10px;
            border: 1px solid #ddd;
            background-color: white;
            cursor: pointer;
            color: black;
        }

        .pagination button:hover {
            background-color: rgba(4, 134, 39, 0.47);
            color: white;
        }

        .pagination button:active {
            background-color: rgba(4, 134, 39, 0.47);
            color: white;
        }

        .write-button {
        	font-family: "GalmuriMono9", monospace;
            padding: 10px 20px;
            background-color: rgba(4, 134, 39, 0.47);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .write-button:hover {
            background-color: rgba(4, 134, 39, 0.47);
        }

		/* qna 게시글 안에 간격 주기 */
        .post-details {
            width: 100%;
            max-width: 800px;
            margin-bottom: 20px;
            padding-top:40px;
            padding-right:20px;
            margin-left:30px;
            margin-right:20px;
            
        }
        .flex-div{
        	display:flex;
        }
        .title{
        	flex:0.5;
        }
        .view-count-date{
        	flex:0.5;
        }

        .post-details p {
            margin-bottom: 10px;
            font-size: 1em;
            color: black;
           
        }

        .post-details strong {
            font-weight: bold;
        }


        .post-actions {
            display: flex;
            justify-content: space-evenly;
            width: 100%;
            max-width: 800px;
            margin-bottom: 20px;
        }

        .post-actions button {
        	font-family: "GalmuriMono9", monospace;
            padding: 10px 20px;
            border: none;
            background-color: rgba(45, 19, 112, 0.684);
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            width: 30%;
           
        }

        .post-actions button:hover {
            background-color: rgba(237, 175, 18, 0.973);
        }

        .post-attachments {
            width: 100%;
            max-width: 800px;
            margin-bottom: 20px;
        }

        .post-attachments h3 {
            font-size: 1.2em;
            margin-bottom: 10px;
            font-family: "GalmuriMono9", monospace;
            
        }

        .post-attachments ul {
            list-style: none;
        }

        .post-attachments ul li {
            margin-bottom: 5px;
        }

        .post-attachments ul li a {
            color: rgb(0, 0, 0);
            text-decoration: none;
        }

        .post-attachments ul li a:hover {
            text-decoration: underline;
        }

        .post-comments  {
            width: 100%;
            max-width: 800px;
            padding-bottom: 20px;
            font-weight: bold;
        }

		/* 댓글 - 타이틀  */
        .post-comments h3 {
            font-size: 1.2em;
            font-weight: bold;
            margin-top: 20px;
            margin-bottom: 10px;
            font-family: "GalmuriMono9", monospace;
            
        }

        .post-comments textarea {
        	            font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;

            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            margin-bottom: 10px;
             word-wrap: break-word;
        }

        .post-comments button {
            padding: 10px 20px;
            border: none;
            background-color: rgba(82, 125, 160, 0.454);  /* 댓글 등록 버튼 : 하늘색임. 다른 색으로 변경할지는 고민중. */
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
        }

        .post-comments button:hover {
            background-color: rgba(52, 162, 252, 0.454);
        }
        .post-msg{
        	text-align:center;
        
        }
        
        /*조회수 작성일 간격 주기*/
        .view-count{
        	margin-right:20px;
        }
        .view-count-date{
        	text-align:right;
        }
        
        .underline {
	        width: 100%;
	        max-width: 100%;
	        height: 2px;
	        background-color: rgba(166, 133, 192, 0.596);
	        margin-bottom: 20px;
   	 	}
   	 	/*게시글 내용 영역*/
   	 	.contents{
   	 		font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
   	 	
   	 		min-height:150px;
   	 		margin-left:2%;
   	 		margin-right:2%;
   	 	}
   	 	/*댓글 영역 CSS*/
   	 	.comment-box{
   	 		width: 100%;
            max-width: 600px;
            padding-bottom: 60px;
            margin-left: 5%;
            padding-left:20px;
   	 	}
   	 	.comment-box {
    word-wrap: break-word;
    padding-bottom: 9px;
    padding-left: 10px;
    font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
    width: 70%;
    padding: 10px;
    border: 2px solid #00FFFF; /* 네온 청록색 테두리 */
    border-radius: 0; /* 픽셀 느낌을 위해 둥근 모서리 제거 */
    font-size: 1em;
    margin-bottom: 10px;
    position: relative;
    z-index: 1;
    overflow: hidden;
    background: #ffffff; /* 흰색 배경 */
    color: #000000; /* 검은색 글씨 */
    font-size: 16px; /* 큰 픽셀 느낌의 글꼴 크기 */
    animation: borderGlow 1.5s infinite alternate;
}
   	 	
   	 	.box_comment{
   	 		padding-bottom: 20px;
   	 	}
   	 		/*댓글 작성자 부분*/
   	 	.col1{
   	 		font-weight: bold;
   	 		font-size:1.1em;
   	 		padding-bottom: 7px;
   	 	}
   	 		/*댓글 내용 부분*/
   	 	.col3{
   	 		word-wrap: break-word;
   	 		padding-bottom: 9px;
   	 		padding-left:10px;
   	 	}
   	 		/*댓글 날짜? 부분*/
   	 	.col4{
   	 		padding-left:10px;
   	 	}
   	 	button{
   	 		font-family: "GalmuriMono9", monospace;
   	 	}
   	 	/*댓글 수정 삭제버튼들 btncomment*/
   	 	.btncomment button{
   	 		padding: 3px 6px;
            border: none;
            background-color: rgba(82, 125, 160, 0.454);  /* 댓글 등록 버튼 : 하늘색임. 다른 색으로 변경할지는 고민중. */
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            margin-right: 6px;
   	 	}
   	 	
   	 	.commentTitle{
   	 		font-size: 25px;
   	 		font-weight: bold;
   	 		margin-top:15px;
   	 		margin-bottom: 25px;
   	 	}
   	 	   	 	.welcome-text {
  font-weight: bold;
  color: #fff;
  margin-right: 20px;
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
</head>

<body>
      <header>
        <div class="header-container">
        <a href="/index.jsp">
            <img src="../image/GamebitLogo.png" alt="Nintendo Logo" class="logo"></a>
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
    <main class="main">
        <section class="board-section">
            <article class="board-left">
                <h1>Q 게시글</h1>
                <div class="wc_message"></div>
            </article>
            <article class="board-area">
                <h2></h2>
                 <div class="post-details">
	                <div class="flex-div">
	                	<div class="title">
		                	<p style="font-size: 20px;"><strong>제목</strong></p>
		    				<p style="font-size: 18px;">${dto.title}</p>
	                    </div>
	                    <div class="view-count-date">
	                    	<span class="view-count">조회수 ${dto.view_count}</span>
	                   
	                        <c:choose>
		                       	<c:when test="${dto.upd_date != null}">
		                       		수정일: <fmt:formatDate value="${dto.upd_date}" pattern="yyyy.MM.dd HH:mm" />
		                       	</c:when>
		                       	<c:otherwise>
		                       		작성일: <fmt:formatDate value="${dto.write_date}" pattern="yyyy.MM.dd HH:mm" />
		                       	</c:otherwise>
	                    	</c:choose>
	                    </div>
                    </div>
                    <p><strong>글쓴이</strong></p><div class="writer-section" style="margin-bottom: 20px;">${dto.writer}</div>
                    <p><strong>내용</strong><br></p>
                    <div class="contents">${dto.contents}</div>
                    </div>
                <div class="post-actions">
                    <c:choose>
	                	<c:when test="${iswriter && count==0}">
					        <button type="button" id="btnedit">수정</button>
					        <button type="button" id="btndelete">삭제</button>
			                <button type="button" id="btnlist" onclick="location.href='/list.qboard'">목록</button>
					    </c:when>
			            <c:when test="${iswriter}"> <!-- 코멘트가 달리면 수정하기 버튼 없애고 삭제하기 & 목록으로 두 버튼만.  -->
			                <button type="button" id="btndelete">삭제</button>
			                <button type="button" id="btnlist" onclick="location.href='/list.qboard'">목록</button>
			            </c:when>
			            <c:otherwise>
			                <button type="button" id="btnlist" onclick="location.href='/list.qboard'">목록</button>
			            </c:otherwise>
			        </c:choose>
                </div>
            	
            	<div class="post-attachments">
                    <h3>첨부 파일</h3>
                    <ul>
                        <c:forEach var="i" items="${list }">
							<div><i class="fa-regular fa-file"></i>.<a href="/download.file?sysname=${i.sysname}&oriname=${i.oriname}">${i.oriname}</a></div>
						</c:forEach>
                    </ul>
                </div>
                
                <c:choose>
                	<c:when test="${adminKey != 0}">
                		<div class="post-comments">
		                    <h3>댓글</h3>
		                    <textarea id="new-comment" placeholder="댓글 입력"></textarea>
		                    <button type="button" id="submit-comment">등록</button>
		                </div>
                	</c:when>
                	<c:otherwise>
                		
                	</c:otherwise>
                </c:choose>

                <!-- ajax로 댓글 불러오기  -->
                <div class="comment-box" id="comment-box">
                </div>
                    
                 <!-- 댓글 수정하기, 삭제하기 -->
                 <form action="/delete.qreply" id="deleteForm" method="post">
                     <input type="hidden" name="c_seq" id="c_seq" value="">
                     <input type="hidden" class="c_parent_seq" name="c_parent_seq" value="${dto.seq}">
                 </form>
                 <form action="/edit.qreply" id="editForm" method="post">
                     <input type="hidden" name="c_seq" id="edit_c_seq" value="">
                     <input type="hidden" name="c_parent_seq" id="edit_c_parent_seq" value="${dto.seq}">
                     <input type="hidden" name="edit_contents" id="edit_contents" value="">
                 </form>

            </article>
        </section>
    </main>

    <script>
        // 게시글 수정하기, 삭제하기
        $("#btnedit").on("click", function() {
            location.href = "/edit.qboard?seq=${dto.seq}";
        })
        $("#btndelete").on("click", function() {
            if (confirm('정말 삭제하시겠습니까?')) {
                location.href = "/delete.qboard?seq=${dto.seq}";
            }
        })
        $(document).ready(function(){
        	
            // 페이지 로드 시 댓글 로드
            loadComments();
            // 댓글 로드 함수
            function loadComments(){
                $.ajax({
                    url: "/getcomment.qreply",
                    type: "get",
                    data: { seq: ${dto.seq} },
                    dataType: "json",
                    success: function(resp) {
                        let c_list = resp.c_list;
                        let loginID = "${loginID}";
        				
                       	// 답변 없을때, c_list가 null 일때. 
                       	if(c_list.length == 0){
                       		
                       		$("#comment-box").html( "<div class='message'>답변이 작성되지 않았습니다.</div>")
                       	}else{
                        
                        for(let i of c_list){
                            let box_comment = $("<div>",{"class":"box_comment"});
                            let comment = $("<div>",{"class":"comment"});
                            
                            let co_writer = $("<div>",{"class":"col1","style":"text-align:left;"});
                            let co_contents = $("<div>",{"class":"col3"});
                            let co_write_date = $("<div>",{"class":"col4"});
                            let c_seq_input = $("<input>",{"type":"hidden","class":"c_seq","value": i.seq });
                            
                             // 텍스트의 줄바꿈 문자를 <br> 태그로 변환
                            let contentsWithBreaks = i.contents.replace(/\n/g, '<br>');
                           
                            co_writer.html("관리자");
                            co_contents.html(contentsWithBreaks); // 변환된 내용을 사용
                            co_write_date.html(i.write_date); // 날짜 형식 변환 함수 사용
                            
                            comment.append(co_writer);
                            comment.append(co_contents);
                            comment.append(co_write_date);
                            comment.append(c_seq_input);
    
                            
                            box_comment.append(comment);
                            
                            let btncomment = $("<div>",{"class":"btncomment"});
                            if(loginID == i.userId){
                                let co_edit = $("<button>",{"class":"co_edit"}).text("수정");
                                let co_edit_complete = $("<button>",{"class":"co_edit_complete","style":"display:none;"}).text("수정완료");
                                let co_delete = $("<button>",{"class":"co_delete"}).text("삭제");
                                let co_cancel = $("<button>",{"class":"co_cancel","style":"display:none;"}).text("취소");
                                
                                btncomment.append(co_edit);
                                btncomment.append(co_edit_complete);
                                btncomment.append(co_delete);
                                btncomment.append(co_cancel);
                                
                                box_comment.append(btncomment);
                            }
                           
                            $("#comment-box").append(box_comment);
                        }
                    }}
                });
                
                // 댓글 수정하기 버튼 클릭 시
                $("#comment-box").on("click", ".co_edit", function() {
                    var editableBox = $(this).parent().siblings(".comment").find(".col3");
                    // <br> 태그를 줄바꿈 문자로 변환
                    editableBox.html(editableBox.html().replace(/<br\s*\/?>/g, '\n'));
                    editableBox.attr("contenteditable", "true");
                    editableBox.css("white-space", "pre-wrap"); // 줄바꿈 스타일 적용
                    editableBox.focus();
                    $(this).hide(); // 수정하기 버튼 숨기기
                    $(this).siblings(".co_delete").hide(); // 삭제하기 버튼 숨기기
                    $(this).siblings(".co_edit_complete").show(); // 수정완료 버튼 보이기
                    $(this).siblings(".co_cancel").show(); // 수정취소 버튼 보이기
                });

                // 댓글 수정취소 버튼 클릭 시
                $("#comment-box").on("click", ".co_cancel", function() {
                   location.reload();
                });

        
                
                // 댓글 수정완료 버튼 클릭 시 
                $("#comment-box").on("click", ".co_edit_complete", function() {
                    var editableBox = $(this).parent().siblings(".comment").find(".col3");
                    editableBox.attr("contenteditable", "false");
                         // 줄바꿈 문자를 <br> 태그로 변환
                    var editContents = editableBox.html().replace(/(\r\n|\n|\r)/g, '<br>'); 
                    var c_seq = $(this).closest(".box_comment").find(".c_seq").val();
        
                    $("#edit_c_seq").val(c_seq);
                    $("#edit_contents").val(editContents);
        
                    $(this).hide(); // 수정완료 버튼 숨기기
                    $(this).siblings(".co_edit").show(); // 수정하기 버튼 보이기
                    $(this).siblings(".co_delete").show(); // 삭제하기 버튼 보이기
                    $(this).siblings(".co_cancel").hide(); // 수정취소 버튼 숨기기
                    
                    $("#editForm").submit();
                });
                
                // 댓글 삭제 버튼 클릭 시 
                $("#comment-box").on("click", ".co_delete", function() {
                   if(confirm("정말 댓글을 삭제하시겠습니까?")){
                    var c_seq = $(this).closest(".box_comment").find(".c_seq").val();
                    $("#c_seq").val(c_seq);
                    $("#deleteForm").submit();
                   }
                });
            }
        
            // 댓글 등록하기
            $("#submit-comment").on("click", function(){
                let newComment = $("#new-comment").val().trim();
                if(newComment === ""){
                    alert("댓글을 입력하세요.");
                    return;
                }
                $.ajax({
                    url: "/comment.qreply",
                    type: "post",
                    data: {
                        comments: newComment.replace(/(\r\n|\n|\r)/g, '<br>'), // 줄바꿈 문자를 <br> 태그로 변환
                        seq: ${dto.seq}
                    },
                    dataType: "json",
                    success: function(resp){
                        
                        location.reload(); // 댓글 추가 후 페이지 새로고침 기능
                    }
                });
            });
            
            
            
        }); // document.ready 끝 부분

</script>
</body>

</html>
	