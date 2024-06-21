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
            height: 80%;
            width: 80%;
            margin: 80px auto;
            /* 헤더 고정으로 인한 상단 마진 추가 */
            border-radius: 10px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
            background-color: #f4f4f462;
        }

        .board-section {
            display: flex;
            width: 100%;
            height: 100%;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: rgba(255, 255, 255, 0.412);
        }

        .board-left {
            flex: 1;
            background-color: rgba(4, 134, 39, 0.454);
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

        .board-area {
            flex: 2;
            padding: 20px;
            padding-top: 70px;
            padding-bottom: 100px;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: center;
            background-color: rgba(255, 255, 255, 0.24);
            overflow-y: auto;    max-height: 80vh;
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

        .post-details {
            width: 100%;
            max-width: 800px;
            margin-bottom: 20px;
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
            justify-content: space-between;
            width: 100%;
            max-width: 800px;
            margin-bottom: 20px;
        }

        .post-actions button {
            padding: 10px 20px;
            border: none;
            background-color: rgba(4, 134, 39, 0.47);
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            width: 30%;
        }

        .post-actions button:hover {
            background-color: rgba(13, 230, 71, 0.47);
        }

        .post-attachments {
            width: 100%;
            max-width: 800px;
            margin-bottom: 20px;
        }

        .post-attachments h3 {
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

        .post-comments {
            width: 100%;
            max-width: 800px;
        }

        .post-comments h3 {
            font-size: 1.2em;
            margin-bottom: 10px;
        }

        .post-comments textarea {
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
            background-color: rgba(4, 134, 39, 0.47);
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
        }

        .post-comments button:hover {
            background-color: rgba(13, 230, 71, 0.47);
        }

        .comment-box {
            border-top: 1px solid #ddd;
            padding-top: 10px;
            margin-top: 10px;
        }

        .comment-box .comment {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .comment-box .comment .col1 {
            flex: 1;
            color: black;
        }

        .comment-box .comment .col3 {
            flex: 4;
            color: black;
        }

        .comment-box .comment .col3 .comment-text {
            display: inline-block;
        }

        .comment-box .comment .reply-textarea {
            display: none;
            margin-top: 10px;
        }

        .comment-box .comment .reply-comment-box {
            display: none;
            margin-left: 20px;
            padding-left: 20px;
            border-left: 1px solid #ddd;
        }

        .comment-box .comment a {
            margin-left: 10px;
            cursor: pointer;
            color: blue;
        }
    
    
    </style>
</head>

<body>
    <header>
        <div class="header-container">
            <img src="image/kakao.png" class="logo">
            <nav>
                <ul>
                    <li>
                        <a href="index.html">홈</a>
                        <div class="dropdown">
                        </div>
                    </li>
                    <li>
                        <a href="#">게임</a>
                        <div class="dropdown">
                            <a href="win.html">명예의 전당</a> <!-- 명예의 전당 페이지로 이동 -->
                            <a href="#">Subitem 2</a>
                            <a href="#">랭킹</a>
                        </div>
                    </li>
                    <li>
                        <a href="board.html">게시판</a> <!-- 게시판 페이지로 이동 -->
                        <div class="dropdown">
                            <a href="board.html">게시판</a> <!-- 게시판 페이지로 이동 -->
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
        <section class="board-section">
            <article class="board-left">
                <h1>자유게시물 상세 보기</h1>
                <div class="wc_message"></div>
            </article>
            <article class="board-area">
                <h2></h2>
                <div class="post-details">
                    <p><strong>제목</strong><br>${dto.title}</p>
                    <p><strong>글쓴이</strong><br>${dto.writer}</p>
                    <p>조회수 ${dto.view_count}</p>
                    <p>
                        <c:choose>
	                       	<c:when test="${dto.upd_date != null}">
	                       		수정일: <fmt:formatDate value="${dto.upd_date}" pattern="yyyy.MM.dd HH:mm" />
	                       	</c:when>
	                       	<c:otherwise>
	                       		작성일: <fmt:formatDate value="${dto.write_date}" pattern="yyyy.MM.dd HH:mm" />
	                       	</c:otherwise>
                    	</c:choose>
                    </p>
                    <p><strong>내용</strong><br>
                    ${dto.contents}</p>
                </div>
                <div class="post-actions">
                    <c:choose>
	                	<c:when test="${iswriter}">
					        <button type="button" id="btnedit">수정</button>
					        <button type="button" id="btndelete">삭제</button>
			                <button type="button" id="btnlist" onclick="location.href='/list.qboard'">목록</button>
			                 <button type="button" id="bookmark-btn" class="bookmark" data-postseq="${dto.seq }"><i id="bookmarkIcon" class="far fa-bookmark"></i></button>
					    </c:when>
			            <c:otherwise>
			                <button type="button" id="btnlist" onclick="location.href='/list.qboard'">목록</button>
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

                <div id="comment-box">
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
    $(document).ready(function() {
    	// 북마크 상태 유지하기....
	    // 페이지 로드 시 초기 북마크 상태를 가져오는 AJAX 요청
	   let postSeq = $("#bookmark-btn").data('postseq'); 
	   let loginID = "${loginID}";
	    $.ajax({
	        url: "/getBookmarkStatus.board",
	        method: "GET",
	        data: {
	            postSeq: postSeq
	        },
	        dataType: "json",
	        success: function(response) {
	            if (response) {
	                $('#bookmark-btn i').addClass('fas').removeClass('far');
	            } else {
	                $('#bookmark-btn i').addClass('far').removeClass('fas');
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
                        bookmarkIcon.toggleClass('fas far');
                    } else {
                        console.error('북마크 상태 저장에 실패했습니다.');
                    }
                }
            });
        });
        
        
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
    let box_comment = $("<div>", {"class": "box_comment", "style": "margin-left: " + (comment.parent_cmt ? "20px" : "0")});
    let commentDiv = $("<div>", {"class": "comment", "style": "border:3px solid pink;"});
    let co_writer = $("<div>", {"class": "col1", "style": "text-align:left;"}).html(comment.userId);
    let co_contents = $("<div>", {"class": "col3"}).html(comment.contents.replace(/\n/g, '<br>'));
    let co_write_date = $("<div>").html(comment.write_date);
    let c_seq_input = $("<input>", {"type": "hidden", "class": "c_seq", "value": comment.seq});

    if (comment.isDeleted === 'y') {
        // 삭제된 댓글 처리
        if (comment.replies && comment.replies.length > 0) {
            commentDiv.append("<div>삭제된 댓글입니다</div>");
        } else {
            // 답글이 없는 경우 해당 댓글 출력하지 않음
            return;
        }
    } else {
        // 삭제되지 않은 경우 기존 코드대로 댓글 출력
        commentDiv.append(co_writer, co_contents, co_write_date, c_seq_input);

        if (!comment.parent_cmt) {
            // 원댓글일 경우에만 답글 버튼 추가
            let replyButton = $("<button>").text("답글").click(function() {
                let replyTextarea = $("<textarea>").attr("placeholder", "답글 입력").css("width", "100%");
                // 답글 등록 버튼 클릭 시 저장되게 하기
                let submitReplyButton = $("<button>").text("등록").click(function() {
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
                $(this).parent().append(replyTextarea, submitReplyButton); // 답글 textarea, 답글 등록 버튼 나오게
                $(this).hide(); // replyButton 답글 버튼 사라지게
            });

            commentDiv.append(replyButton); // replyButton 답글 버튼 다시 나타나기.
        }

        // 로그인한 사용자와 댓글 작성자가 같을 경우 수정 및 삭제 버튼 추가
        if (comment.userId === loginID) {
            let editButton = $("<button>").text("수정").click(function() {
                // 수정 기능 추가
                let editTextarea = $(this).siblings(".col3").attr("contenteditable", "true").css("background-color", "white");
                let submitEditButton = $("<button>").text("저장").click(function() {
                    console.log(true);
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
                $(this).parent().append(submitEditButton); // 수정 textarea, 저장 버튼 나오게
                $(this).hide(); // editButton 수정 버튼 사라지게
            });

            let deleteButton = $("<button>").text("삭제").click(function() {
                // 삭제 기능 추가
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

            commentDiv.append(editButton, deleteButton);
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
}


// 댓글 등록하기
$("#submit-comment").on("click", function() {
    let newComment = $("#new-comment").val().trim();
    if (newComment === "") {
        alert("댓글을 입력하세요.");
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
        
        //
        
        //
    });
	     
	    
	    

	    
	    
	 
</script>
</body>

</html>
	