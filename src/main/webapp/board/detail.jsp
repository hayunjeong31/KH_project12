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
    <link rel="stylesheet" href="css/header_styles.css">
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
            
        	margin-left:20px;
            padding-bottom: 20px;
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
            justify-content: space-around;
            
            width: 100%;
            max-width: 800px;
            margin-bottom: 20px;
        }

        .post-actions button {
        	font-family: "GalmuriMono9", monospace;
            padding: 10px 15px;
            border: none;
            background-color: rgba(45, 19, 112, 0.684);
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            width: 30%;
            margin: 0 5px; /*margin 양옆에만*/
           
        }

        .post-actions button:hover {
            background-color: rgba(111, 57, 246, 0.684);
            
        }

        .post-attachments {
            width: 100%;
            max-width: 800px;
            margin-bottom: 20px;
        }

        .post-attachments h3 {
        	font-family: "GalmuriMono9", monospace;
        	
            font-size: 1.2em;
            margin-bottom: 10px;
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
            max-width: 750px;
            padding-bottom: 20px;
            font-weight: bold;
        }

		/* 댓글 - 타이틀  */
        .post-comments h3 {
        font-family: "GalmuriMono9", monospace;
        
            font-size: 1.2em;
            font-weight: bold;
            margin-top: 20px;
            margin-bottom: 10px;
            
        }
        
        .post-comments textarea {
        	font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            margin-bottom: 10px;
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
   	 	/* 북마크 상태이면 주황색이게 하기 */
   	 	 .bookmark-orange {
     	 	color: orange;
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
   	 	.box_comment{
   	 		padding-bottom: 20px;
   	 	}
   	 	.comment{
   	 		min-height:50px;
   	 	}
   	 	
   	 		/*댓글 작성자 부분*/
   	 	.col1{
   	 	   	float:left;
   	 		font-weight: bold;
   	 		font-size:1.2em;
   	 		padding-bottom: 7px;
   	 	}
   	 		/*댓글 날짜 부분*/
   	 	.col4{
   	 		float:left;
   	 		padding-left:10px;
   	 		width:30%;
   	 		padding-right:20px;
   	 	}
   	 		/*댓글 내용 부분*/
   	 	.col3{
   	 		word-wrap: break-word;
   	 		padding-bottom: 9px;
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
   	 	
   	 
   	 	
   	 	/* 댓글, 답글 버튼들 COMMON-BUTTON*/
   	 	.common-button {
    		/* 기존 버튼 스타일 복사 */
		    font-family: "GalmuriMono9", monospace;
		    padding: 5px 10px;
		    border: none;
		    background-color: rgba(82, 125, 160, 0.454);
		    color: white;
		    border-radius: 5px;
		    cursor: pointer;
		    margin: 0 5px;
		}
		
		.common-button:hover {
		    background-color: rgba(52, 162, 252, 0.454);
		}
		/* 댓글, 답글 버튼들 COMMON-BUTTON 끝 */
		
		/*답글 textarea 아마도?? ㅎㅎ */
		.re-reply-textarea{
			font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
            width: 20%;
            padding: 10px;
            padding-right: 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            margin: 10px 0;
            word-wrap: break-word;
        }
	
	/*좋아요 싫어요 버튼0*/
	.icon-button{
		 font-family: "GalmuriMono9", monospace;
		    padding: 5px 10px;
		    border: none;
		    background-color: rgba(255, 255, 255, 0);
		    color: black;
		    border-radius: 5px;
		    cursor: pointer;
		    margin:0;
	}
	.icon-button i{
		font-size:1.2em;
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
            <img src="/image/gamebitlogo2.png" alt="Nintendo Logo" class="logo"></a>
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
                            
                            <a href="#">즐겨찾기</a>
                            
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
                        <a href="/showMain.dashBoard">관리자 페이지</a>
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
   
    <main class="main">
        <section class="board-section">
            <article class="board-left">
                <h1>자유게시물 상세 보기</h1>
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
	                	<c:when test="${iswriter}">
					        <button type="button" id="btnedit">수정</button>
					        <button type="button" id="btndelete">삭제</button>
			                <button type="button" id="btnlist" onclick="location.href='/list.board'">목록</button>
			                 <button type="button" id="bookmark-btn" class="bookmark" data-postseq="${dto.seq }"><i id="bookmarkIcon" class="far fa-bookmark"></i></button>
					    </c:when>
			            <c:otherwise>
			                <button type="button" id="btnlist" onclick="location.href='/list.board'">목록</button>
 							<button type="button" id="bookmark-btn" class="bookmark" data-postseq="${dto.seq }"><i id="bookmarkIcon" class="far fa-bookmark"></i></button>				            
 						</c:otherwise>
			        </c:choose>
                </div>
                
                <!-- 업로드한 첨부파일 불러오기  -->
                <div class="post-attachments">
                    <h3>첨부 파일</h3>
                    <ul>
                        <c:forEach var="i" items="${list }">
							<div><i class="fa-regular fa-file"></i>.<a href="/download.file?sysname=${i.sysname}&oriname=${i.oriname}">${i.oriname}</a></div>
						</c:forEach>
                    </ul>
                </div>
               		<div class="post-comments">
	                    <h3>댓글</h3>
	                    <textarea id="new-comment" placeholder="댓글 입력"></textarea>
	                    <button type="button" id="submit-comment">등록</button>
	                </div>

                <div class="comment-box" id="comment-box">
                    <!-- ajax로 댓글 불러오기  -->
                </div>
                    
                 <!-- 댓글 수정하기, 삭제하기 -->
                 <form action="/delete.reply" id="deleteForm" method="post">
                     <input type="hidden" name="c_seq" id="c_seq" value="">
                     <input type="hidden" class="c_parent_seq" name="c_parent_seq" value="${dto.seq}">
                 </form>
                 <form action="/edit.reply" id="editForm" method="post">
                     <input type="hidden" name="c_seq" id="edit_c_seq" value="">
                     <input type="hidden" name="c_parent_seq" id="edit_c_parent_seq" value="${dto.seq}">
                     <input type="hidden" name="edit_contents" id="edit_contents" value="">
                 </form>

            </article>
        </section>
    </main>


    <script>
	    $("#btnlist").on("click",function(){
			location.href="/list.board";
		})
		$("#btnedit").on("click", function() {
	    	location.href = "/edit.board?seq=${dto.seq}";
	    })
	    $("#btndelete").on("click", function() {
	        if (confirm('정말 삭제하시겠습니까?')) {
	            location.href = "/delete.board?seq=${dto.seq}";
	        }
	    })
	    
	    
	    
	    $(document).ready(function() {
			   let loginID = "${loginID}";
			// 댓글 등록하기
				$("#submit-comment").on("click", function() {
				    let newComment = $("#new-comment").val().trim();
				    if (newComment === "") {
				        alert("댓글을 입력하세요.");
				        return;
				    }
				    if(!loginID){
				    	alert("로그인 하세요.");
				    	return;
				    }
				    $.ajax({
				        url: "/comment.reply",
				        type: "post",
				        data: {
				            comments: newComment.replace(/(\r\n|\n|\r)/g, '<br>'),
				            seq: ${dto.seq},
				    		parent_cmt: 0
				        },
				        dataType: "json",
				        success: function(resp) {
				            location.reload();
				        }
				    });
				});
		    /////////////////////////////////////////////////////////////////////
	    	// 북마크 상태 유지하기.... // 페이지 로드 시 초기 북마크 상태를 가져오는 AJAX 요청
			   let postSeq = $("#bookmark-btn").data('postseq'); 
			    $.ajax({
			        url: "/getBookmarkStatus.board",
			        method: "GET",
			        data: {
			            postSeq: postSeq
			        },
			        dataType: "json",
			        success: function(response) {
			            if (response) {
			                $('#bookmark-btn i').addClass('fas bookmark-orange').removeClass('far');
			            } else {
			                $('#bookmark-btn i').addClass('far').removeClass('fas bookmark-orange');
			            }
			        },
			        error: function(error) {
			            console.error('북마크 상태 조회 중 오류가 발생했습니다:', error);
			        }
			    });
	
	        // 북마크 버튼 클릭 시의 처리를 담고 있습니다.
	        $("#bookmark-btn").on("click", function() {
	        	 let postSeq = $(this).data('postseq'); 
	             let bookmarkBtn = $(this);
	             let bookmarkIcon = $(this).find('i');
	             let isBookmarked = bookmarkIcon.hasClass('fas');
					if(!loginID){
						alert("로그인을 하세요.");
						return false;
					}
	            $.ajax({
	                url: "/bookmark.board",
	                method: "post",
	                data: {
	                	postSeq: postSeq,
	                    isBookmarked: !isBookmarked
	                },
	                dataType: "json",
	                success: function(response) {
	                    if (response) {
	                        bookmarkIcon.toggleClass('fas far bookmark-orange');
	                    } else {
	                        console.error('북마크 상태 저장에 실패했습니다.');
	                    }
	                }
	            });
	        });
	        
	        //
	        
	        ///////////////////////////////////////////////////////////////////////////
	        // 대댓글 시도 - board6폴더
	        // 로그인한 사용자 ID 
	
			// 댓글 불러오기 및 출력하기
			$.ajax({
			    url: "/getcomment.reply",
			    data: { seq: ${dto.seq} },
			    dataType: "json"
			}).done(function(resp) {
			    let c_list = resp.c_list;
			    let commentMap = {};
			    let loginID = "${loginID}";
			    console.log(loginID);
			
			    // 모든 댓글을 commentMap에 추가
			    c_list.forEach(function(comment) {
			        commentMap[comment.seq] = comment;
			    });
			
			    // 대댓글을 부모 댓글에 추가
			    c_list.forEach(function(comment) {
			        if (comment.parent_cmt) {
			            let parent = commentMap[comment.parent_cmt];
			            if (parent) {
			                if (!parent.replies) {
			                    parent.replies = [];
			                }
			                parent.replies.push(comment);
			            }
			        }
			    });
			
			    // 최상위 댓글(원댓글)들에 대해 appendComment 호출
			    c_list.forEach(function(comment) {
			        if (!comment.parent_cmt) {
			            appendComment(comment);
			        }
			    });
			});
	
			// 댓글&답글 출력하기
			function appendComment(comment, parentElement) {
			    let box_comment = $("<div>", {"class": "box_comment", "style": "margin-left: " + (comment.parent_cmt ? "50px" : "0")});
			    let commentDiv = $("<div>", {"class": "comment"});
			    let co_writer = $("<div>", {"class": "col1", "style": "text-align:left;"}).html(comment.userId);
			    let co_contents = $("<div>", {"class": "col3"}).html(comment.contents.replace(/\n/g, '<br>'));
			    let co_write_date = $("<div>",{"class":"col4"}).html(comment.write_date);
			    let breakbox = $("<div>",{"class":"breakbox"});
			    
			 	// 아이콘을 감싸는 버튼 생성
			    let co_likes_button = $("<button>", {"class":"icon-button"});
			    let co_likes = $("<i>", {"class":"fa-regular fa-thumbs-up", "data-replyseq": comment.seq});
			    co_likes_button.append(co_likes);

			    let co_hates_button = $("<button>", {"class":"icon-button"});
			    let co_hates = $("<i>", {"class":"fa-regular fa-thumbs-down", "data-replyseq": comment.seq});
			    co_hates_button.append(co_hates);

			    // float없애기 div
			    let co_float_clear = $("<div>", {"style":"clear:both;"});
			    
			    // c_seq_input :)
			    let c_seq_input = $("<input>", {"type": "hidden", "class": "c_seq", "value": comment.seq});
			
			    //////////////////////////////////////////////
			    // 좋아요 갯수 담을 span
			    let co_likes_count = $("<span>",{"class":"co_likes_count"});
			    let co_hates_count = $("<span>",{"class":"co_hates_count"});
			   
			    
			    
				// 좋아요 버튼 클릭하기 
			    co_likes_button.on("click", function() {
			        let replySeq = co_likes.data('replyseq');
			        let isLiked = co_likes.hasClass('fa-solid');
			        let isHated = co_hates.hasClass('fa-solid'); // 추가: 싫어요 버튼 상태 확인
					
			        $.ajax({
			            url: "/like.reply",
			            method: "post",
			            data: {
			                replySeq: replySeq,
			                isLiked: !isLiked,
			                isHated: isHated // (좋아요 반대)싫어요 버튼 상태 전달
			            },
			            dataType: "json",
			            success: function(response) {
			                if (response.result) {
			                    co_likes.toggleClass('fa-regular fa-solid');
			                    co_likes_count.html(response.result2);
			                   
			                    // 추가: 싫어요 버튼 눌러져있다면 regular 상태로 변경
				                if (isHated) {
				                    co_hates.removeClass('fa-solid').addClass('fa-regular');
				                    co_hates_count.html(response.result4);
			                	} else {
			                    	console.error('좋아요 상태 저장에 실패했습니다.');
			               		}
			          	  	}
			          	  }
			        	});
			    	});

			    // 싫어요 버튼 클릭하기
			    co_hates_button.on("click", function() {
			        let replySeq = co_hates.data('replyseq');
			        let isHated = co_hates.hasClass('fa-solid');
			        let isLiked = co_likes.hasClass('fa-solid'); // (싫어요 반대)좋아요 버튼 상태 확인
					
			        $.ajax({
			            url: "/hate.reply",
			            method: "post",
			            data: {
			                replySeq: replySeq,
			                isHated: !isHated,
			                isLiked: isLiked // 추가: 좋아요 버튼 상태 전달
			            },
			            dataType: "json",
			            success: function(response) {
			                if (response.result) {
			                    co_hates.toggleClass('fa-regular fa-solid');
			                    co_hates_count.html(response.result2);
			                    // 추가: 좋아요 버튼 눌러져있다면 regular 상태로 변경
			                    if (isLiked) {
			                        co_likes.removeClass('fa-solid').addClass('fa-regular');
			                        co_likes_count.html(response.result4);
			                    }
			                } else {
			                    console.error('싫어요 상태 저장에 실패했습니다.');
			                }
			          	  }
			        	});
			    });
			   	// 페이지 로드 시 초기 댓글 좋아요 상태를 가져오는 AJAX 요청 
			   	let loginID = "${loginID}";
			   	let replySeq = co_likes.data('replyseq');
			    $.ajax({
			        url: "/getLikesStatus.reply",
			        method: "GET",
			        data: {
			            replySeq: replySeq
			        },
			        dataType: "json",
			        success: function(response) {
			            if (response.result) {
			            	co_likes.addClass('fa-solid').removeClass('fa-regular');
			            } else {
			            	co_likes.addClass('fa-regular').removeClass('fa-solid');
			            }
			            	co_likes_count.html(response.result2);
			        },
			        error: function(error) {
			            console.error('좋아요 상태 조회 중 오류가 발생했습니다:', error);
			        }
			    });
				// 페이지 로드 시 초기 댓글 싫어요 상태를 가져오는 AJAX 요청 
			    $.ajax({
			        url: "/getHatesStatus.reply",
			        method: "GET",
			        data: {
			            replySeq: replySeq
			        },
			        dataType: "json",
			        success: function(response) {
			            if (response.result) {
			            	co_hates.addClass('fa-solid').removeClass('fa-regular');
			            } else {
			            	co_hates.addClass('fa-regular').removeClass('fa-solid');
			            }
			            	co_hates_count.html(response.result2);
			        },
			        error: function(error) {
			            console.error('좋아요 상태 조회 중 오류가 발생했습니다:', error);
			        }
			    });   

				
			        // 삭제된 댓글 처리
			    if (comment.isDeleted === 'y') {
			        if (comment.replies && comment.replies.length > 0) {
			            commentDiv.append("<div class='deleted-reply' style='height:80px; font-weight:bold; padding:30px 10px;'>삭제된 댓글입니다</div>");
			            
			        } else {
			            // 답글이 없는 경우 해당 댓글 출력하지 않음
			            return;
			        }
			    } else {
			        // 삭제되지 않은 경우 기존 코드대로 댓글 출력
			        commentDiv.append(co_writer, co_write_date,co_float_clear, co_contents,  co_likes_button, co_likes_count, co_hates_button, co_hates_count, breakbox, c_seq_input);
			
			        if (!comment.parent_cmt) {
			            // 원댓글일 경우에만 답글 버튼 추가
			            let replyButton = $("<button>", {"class": "common-button"}).text("답글").click(function() {
			                let replyTextarea = $("<textarea>",{"class":"re-reply-textarea"}).attr("placeholder", "답글 입력").css("width", "100%");
			                // 답글 등록 버튼 클릭 시 저장되게 하기
			                let submitReplyButton = $("<button>",{"class":"common-button"}).text("등록").click(function() {
			                    let replyContent = replyTextarea.val().trim();
			                    if (replyContent) {
			                        $.ajax({
			                            // 답글달기 insertComment
			                            url: "/replycomment.reply",
			                            type: "post",
			                            data: {
			                                comments: replyContent.replace(/(\r\n|\n|\r)/g, '<br>'),
			                                seq: ${dto.seq},
			                                parent_cmt: comment.seq
			                            },
			                            dataType: "json",
			                            success: function(resp) {
			                                location.reload();
			                            }
			                        });
			                    }
			                });
			                let cancelReplyButton = $("<button>", {"class":"common-butt"})
			                $(this).parent().append(replyTextarea, submitReplyButton); // 답글 textarea, 답글 등록 버튼 나오게
			                $(this).hide(); // replyButton 답글 버튼 사라지게
			            });
						
						breakbox.append(replyButton); // replyButton 답글 버튼 다시 나타나기.
						commentDiv.append(breakbox);
			        }
	
			        // 로그인한 사용자와 댓글 작성자가 같을 경우 수정 및 삭제 버튼 추가
			        if (comment.userId === loginID) {
			        	//1. 수정버튼 
				    	let editButton = $("<button>", {"class": "common-button"}).text("수정").click(function() {
			    			
				    		$(this).closest('.breakbox').find('.common-button:contains("등록"), .common-button:contains("삭제")').hide();
					       // $(".re-reply-textarea, .common-button:contains('등록'), .common-button:contains('삭제')").hide();
					       // $(".common-button:contains('답글')").hide();
				    		
			    		
			                // contenteditable TRUE 	추가
			                let editTextarea = $(this).parent().siblings(".col3").attr("contenteditable", "true").css("background-color", "white");
			    				
			    		    let originalContent = editTextarea.html(); // 원래 내용을 저장

			                let submitEditButton = $("<button>", {"class": "common-button"}).text("저장").click(function() {
			                   
			                    let editedContent = editTextarea.html().trim(); // div contenteditable true로 해줬으니깐 val이 아니라 html로 ~~
			                    editTextarea.attr("contenteditable", "false");
			                    if (editedContent) {
			                        $.ajax({
			                            url: "/edit.reply",
			                            type: "post",
			                            data: {
			                                comments: editedContent.replace(/(\r\n|\n|\r)/g, '<br>'),
			                                seq: comment.seq
			                            },
			                            dataType: "json",
			                            success: function(resp) {
			                                location.reload();
			                            }
				                        });
				                    }
				                });
		    		        
			                let cancelButton = $("<button>", {"class": "common-button"}).text("취소").click(function() {
			                   // editTextarea.html(originalContent); // 원래 내용으로 복원
			                   // location.reload(); // 페이지 새로고침
				                let editTextarea = $(this).parent().siblings(".col3").attr("contenteditable", "false").css("background-color", "");
				                editTextarea.html(originalContent);
				                $(this).closest('.breakbox').find('.common-button:contains("수정"), .common-button:contains("삭제")').show();
				                $(this).closest('.breakbox').find('.common-button:contains("답글")').show();
				                
				                $(this).closest('.breakbox').find('.common-button:contains("저장"), .common-button:contains("취소")').hide();

			                });
			                
			                $(this).parent().append(submitEditButton, cancelButton); // 수정 textarea, 저장 버튼 나오게
			                $(this).hide(); // editButton 수정 버튼 사라지게
			            });
		
			            // 2. 삭제 기능 추가
			            let deleteButton = $("<button>", {"class": "common-button"}).text("삭제").click(function() {
			                if (confirm("정말 삭제하시겠습니까?")) {
			                    $.ajax({
			                        url: "/delete.reply",
			                        type: "post",
			                        data: { seq: comment.seq },
			                        dataType: "json",
			                        success: function(resp) {
			                            // 삭제 성공 후 reload 대신 클라이언트 측에서 즉시 반영
			                            if (comment.replies && comment.replies.length > 0) {
			                                commentDiv.html("<div>삭제된 댓글입니다</div>");
			                            } else {
			                                box_comment.remove();
			                            }
			                            location.reload();
			                        }
			                    });
			                }
			            });
		            breakbox.append(editButton, deleteButton);
					commentDiv.append(breakbox);
		        }
		    }
	
		    box_comment.append(commentDiv);
		
		    // 부모 엘리먼트에 붙이기
		    if (parentElement) {
		        parentElement.append(box_comment);
		    } else {
		        $("#comment-box").append(box_comment);
		    }
		
		    // 대댓글 표시 (대댓글이 존재한다면 replies.length > 0)
		    if (comment.replies && comment.replies.length > 0) {
		        comment.replies.forEach(function(reply) {
		            appendComment(reply, box_comment);
		        });
		    }
		} //function appendComment(comment, parentElement) 끝
	
	
		
		    
	    });	// document.ready  끝 부분 -
	 
</script>
</body>

</html>
	