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
            height: 60px;
            background-image: url('image/9.png');
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }

        header .header-container {
            display: flex;
            align-items: center;
            width: 100%;
        }

        header nav ul {
            list-style: none;
            display: flex;
            margin-left: auto;
        }

        header nav ul li {
            margin-left: 20px;
            position: relative;
        }

        header nav ul li a {
            color: white;
            text-decoration: none;
        }

        header nav ul li .dropdown {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: black;
            padding: 10px 0;
        }

        header nav ul li:hover .dropdown {
            display: block;
        }

        header .header-buttons {
            display: flex;
            align-items: center;
        }

        header .login-button {
            margin-left: 20px;
            padding: 10px 20px;
            background-color: rgba(4, 134, 39, 0.47);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        header .hamburger-menu {
            display: none;
            flex-direction: column;
            cursor: pointer;
        }

        header .hamburger-menu div {
            width: 25px;
            height: 3px;
            background-color: white;
            margin: 4px 0;
        }

        .main {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80%;
            width: 80%;
            margin: 80px auto;
            border-radius: 10px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
            background-color: rgba(244, 244, 244, 0.39);
        }

        .board-section {
            display: flex;
            width: 100%;
            height: 100%;
            border-radius: 10px;
            overflow: hidden;
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
		    display: flex;
		    flex-direction: column;
		    justify-content: flex-start;
		    align-items: center;
		    overflow-y: auto;    max-height: 80vh;
		}

        .board-area h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: black;
            text-align: center;
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
            justify-content: space-around;
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
        
        #comment-box{
        	width: 100%;
        	margin-top:5%;
            padding: 10px;
            border-radius: 5px;
            font-size: 1em;
            margin-bottom: 10px;
        }
        
        .box_comment{
        	width: 100%;
        	padding:10px;
        	margin-top:3%;
        	border: 1px solid white;
        	background-color: white;
        	border-radius: 3%;
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
                <h1>게시물 상세 보기</h1>
                <div class="wc_message"></div>
            </article>
            <article class="board-area">
                <h2></h2>
                <div class="post-details">
                    <p><strong>제목</strong><br>${dto.title}</p>
                    <p><strong>글쓴이</strong><br>${dto.writer}</p>
                    <p><strong>내용</strong><br>${dto.contents}</p>
                    <p><strong>조회수</strong><br>${dto.view_count}</p>
                    <p><strong>작성일</strong><br>
                        <c:choose>
	                       	<c:when test="${dto.upd_date != null}">
	                       		<fmt:formatDate value="${dto.upd_date}" pattern="yyyy.MM.dd" />
	                       	</c:when>
	                       	<c:otherwise>
	                       		<fmt:formatDate value="${dto.write_date}" pattern="yyyy.MM.dd" />
	                       	</c:otherwise>
                    	</c:choose>
                    </p>
                </div>
                <div class="post-actions">
                    <c:choose>
	                	<c:when test="${iswriter}">
					        <button type="button" id="btnedit">수정</button>
					        <button type="button" id="btndelete">삭제</button>
			                <button type="button" id="btnlist" onclick="location.href='/list.qboard'">목록</button>
					    </c:when>
			            <c:otherwise>
			                <button type="button" id="btnlist" onclick="location.href='/list.qboard'">목록</button>
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
        $(document).ready(function(){
    	
    	// 댓글 등록하기
	    $("#submit-comment").on("click", function(){
	        let newComment = $("#new-comment").val().trim();
	        if(newComment === ""){
	            alert("댓글을 입력하세요.");
	            return;
	        }
	        $.ajax({
	            url: "/comment.reply",
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
    	
    	// 댓글 출력하기 
	    $.ajax({
	    	url:"/getcomment.reply",
	    	data:{
	    		seq: ${dto.seq}
	    	},
	    	dataType:"json"
	    }).done(function(resp){
	    	let c_list = resp.c_list;
	    	let loginID = "${loginID}";
	    	
	    	for(let i of c_list){
	    		let box_comment = $("<div>",{"class":"box_comment"});
	    		let comment = $("<div>",{"class":"comment","style":"border:3px solid pink;"});
	    		
	    		let co_writer = $("<div>",{"class":"col1","style":"text-align:left;"});
	    		let co_contents = $("<div>",{"class":"col3"});
	    		let co_write_date = $("<div>");
                let c_seq_input = $("<input>",{"type":"hidden","class":"c_seq","value": i.seq });
                // 답글달기 영역 만들기 
                let co_babycomment = $("<div>",{"class":"babycomment","style":"border:5px solid green;"}).html("답글달기");
				
					
				// 텍스트의 줄바꿈 문자를 <br> 태그로 변환
                let contentsWithBreaks = i.contents.replace(/\n/g, '<br>');
	    		
	    		co_writer.html(i.userId);
	    		co_contents.html(contentsWithBreaks); // 변환된 냉용 사용.
	    		co_write_date.html(i.write_date);
	    		
	    		comment.append(co_writer);
	    		comment.append(co_contents);
	    		comment.append(co_write_date);
	    		comment.append(c_seq_input);
	    		comment.append(co_babycomment);
	    		
	    		box_comment.append(comment);
	    		
	    		let btncomment = $("<div>",{"class":"btncomment"});

	    		if(loginID == i.userId){
	    			let co_edit = $("<button>",{"class":"co_edit"}).text("수정");
	    			let co_edit_complete = $("<button>",{"class":"co_edit_complete","style":"display:none;"}).text("수정완료");
	    			let co_delete = $("<button>",{"class":"co_delete"}).text("삭제");
	    	
	    		btncomment.append(co_edit);
	    		btncomment.append(co_edit_complete);
	    		btncomment.append(co_delete);

	    		box_comment.append(btncomment);
	    		}
	    
	    		$("#comment-box").append(box_comment);
	    		
	    		console.log(i.userId);
	    	}
	    });	// ajax로 댓글 불러오기. getcomment
	    
	    
	    // 
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

	   $("#comment-box").on("click", ".co_edit_complete", function(){
		   var editableBox = $(this).parent().siblings(".comment").find(".col3");
		   editableBox.attr("contenteditable", "false");
			// 줄바꿈 문자를 <br> 태그로 변환
	       var editContents = editableBox.html().replace(/(\r\n|\n|\r)/g, '<br>'); 
		   var c_seq = $(this).closest(".box_comment").find(".c_seq").val();
		   
		   $("#edit_c_seq").val(c_seq);
		   $("#edit_contents").val(editContents);
		   
		   
		   $(this).css("display","none");
		   $(this).prev(".co_edit").css("display","inline");
		   $("#editForm").submit();
	   })
		$("#comment-box").on("click", ".co_delete", function() {
			if (confirm('정말 삭제하시겠습니까?')) {
	            
	    	var c_seq = $(this).parent().siblings(".comment").find(".c_seq").val();
	    	
	    	$("#c_seq").val(c_seq);
	    	$("#deleteForm").submit();
	        }
	    })
	    
	    
	    	
    })	// document.ready 끝 부분
    
    
    
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
	    
	     
	    
	    
	 
</script>
</body>

</html>
	