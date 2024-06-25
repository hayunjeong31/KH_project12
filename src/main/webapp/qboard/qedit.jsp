<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<!DOCTYPE html>
<html lang="ko">

<head>
      <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QnA게시물 수정</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link href="${pageContext.request.contextPath}/css/header_styles.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/galmuri/dist/galmuri.css">

    <style>

         * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body,
        html {
            height: 100%;
<<<<<<< HEAD
        }

        body {
            font-family: "GalmuriMono9", monospace;
=======
            font-family: "GalmuriMono9", monospace;
            
        }

        body {
			font-family: "GalmuriMono9", monospace;
>>>>>>> 07569663bf800ac0c061fb073e5fe4da73153a1f
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
            background-color: #f4f4f463;
            width: 80%;
            height: 80%;
            margin: 80px auto;
            border-radius: 10px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
        }

        .board-section,
        .edit-post-section {
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
<<<<<<< HEAD
            background-color: rgba(82, 125, 160, 0.454);
=======
            background-color: rgba(45, 19, 112, 0.684);
>>>>>>> 07569663bf800ac0c061fb073e5fe4da73153a1f
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

        .edit-post-area {
            flex: 2;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .edit-post-area h2 {
            font-size: 2em;
            margin-bottom: 20px;
            color: black;
            text-align: center;
        }

        .post-form {
            width: 100%;
            max-width: 800px;
        }

        .form-field {
            margin-bottom: 10px;
            display: flex;
            flex-direction: column;
        }

        .form-field label {
            margin-bottom: 10px;
            font-weight: bold;
            font-size: 1em;
        }

        .form-field input[type="text"],
        .form-field input[type="file"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #cccccc77;
            border-radius: 5px;
            font-size: 1em;
            font-family: 'Open Sans', sans-serif;
            
        }

        .form-field input[type="file"] {
            border: none;
            font-family: "GalmuriMono9", monospace;
        }

        .form-buttons {
            display: flex;
            justify-content: space-between;
            width: 100%;
        }

        .form-buttons button {
        	font-family: "GalmuriMono9", monospace;
            padding: 10px 20px;
            border: none;
<<<<<<< HEAD
            background-color: rgba(82, 125, 160, 0.454);
=======
			background-color: rgba(45, 19, 112, 0.684);
>>>>>>> 07569663bf800ac0c061fb073e5fe4da73153a1f
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            width: 48%;
            font-family: "GalmuriMono9", monospace;
            
        }

        .form-buttons button:hover {
<<<<<<< HEAD
            background-color: rgba(52, 162, 252, 0.454);
=======
            background-color: rgba(237, 175, 18, 0.973);
>>>>>>> 07569663bf800ac0c061fb073e5fe4da73153a1f
        }

        .wc_message {
            display: none;
        }
        
        /* Summernote 배경색 설정 */
        .note-editable {
            background-color: #d3d2d8d5; /* 원하는 배경색으로 설정 */
        }
   
	   .note-resizebar{
	   	 	display: none;
	   }
	    #fileloading{
	   	margin-bottom:0;
	   	padding-bottom:0;
	   }
	   .uploadedFile .file-list{
	  	padding-left:10px;
	   	margin-bottom:2%;
	   }
<<<<<<< HEAD
	   .deleteFile{
	   	font-family: "GalmuriMono9", monospace;
	   	margin:1%;
	   
	   }
=======
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
>>>>>>> 07569663bf800ac0c061fb073e5fe4da73153a1f
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
                            <a href="#">게임 플레이 순위</a>
                            <a href="#">즐겨찾기</a>
                            <a href="#">랭킹</a>
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
                        <a href="#">관리자 페이지</a>
                        <div class="dropdown">
                            <a href="#">대시보드</a>
                            <a href="#">통계</a>
                        </div>
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
        <section class="edit-post-section">
            <article class="board-left">
                <h1>Q 게시글 수정</h1>
                <div class="wc_message"></div>
            </article>
            <article class="edit-post-area">
                <h2></h2>
                <form class="post-form" id="editform" action="/update.qboard" method="post" enctype="multipart/form-data">
                    <div class="post-form">
                        <div class="form-field">
                            <label>글 제목</label>
                            <input type="text" id="post-title" name="post-title" value="${dto.title}" placeholder="제목을 입력하세요" required>
                            <input type="hidden" id="post-seq" name="post-seq" value="${dto.seq}">
                        </div>
                        <div class="form-field">
                            <label>내용</label>
                            <div id="summernote">${dto.contents}</div>
                            <input type="hidden" id="contents" name="contents">
                        </div>
                        
                        <!-- 업로드 파일 갯수에 따른 input file 태그 갯수 생성 -->
                        <div class="form-field" id="fileloading">
                            <label>파일 업로드</label>
		                        <c:choose>
		                        	<c:when test="${list.size() == 0}">
			                        	<input type="file" name="file1"><br>
								  		<input type="file" name="file2"><br>
		                        	</c:when>
		                        	<c:when test="${list.size() == 1}">
		                        		<input type="file" name="file1"><br>
		                        	</c:when>
		                        	<c:otherwise>
		                        	</c:otherwise>
		                       	</c:choose>
	                       	
	                       <div class="fileinputtag"></div>
	                       
	                    </div>
	   					 <!-- 수정 해야하는 부분 시작 .deleteFile 버튼 누르면 hide되게.  -->
		                    <div class="uploadedFile">
		                        <c:forEach var="file" items="${list}">
	                            	<div class="file-list">
		                                <i class="fa-regular fa-file"></i>
		                                ${file.oriname}
		                                <button type="button" class="deleteFile" data-sysname="${file.sysname}">삭제<i class="fa-solid fa-trash"></i></button>
		                        	</div>
		                        </c:forEach>
		                    </div>
	                    <!-- 수정된 부분 끝 -->
	                    
	                    <!--  숨긴 파일 정보 hidden에 저장하기  -->
	                    <input type="hidden" id="deletedFilesInput" name="deletedFilesInput">
                                   
                           
                            <!-- 
                            <label>파일 업로드</label>
                            <input type="file" id="post-file" name="post-file"><br>
                        </div>
                        <div class="uploadedFile">
                            
                            <c:forEach var="i" items="${list}">
                                <div class="file-list">
                                    <i class="fa-regular fa-file"></i>
                                    ${i.oriname}
                                    <button type="button" class="deleteFile" data-sysname="${i.sysname}">삭제<i class="fa-solid fa-trash"></i></button>
                                </div>
                            </c:forEach>
                        </div>
                          -->
                          
                        <div class="form-buttons">
                            <button type="button" id="btncomplete">수정완료</button>
                            <button type="button" class="btn-cancel">취소</button>
                        </div>
                    </div>
                </form>
            </article>
        </section>
    </main>
    <script>
    var deletedFiles = [];
	$(document).ready(function(){
        $('#summernote').summernote({
            placeholder: '내용을 입력해 주세요.',
            tabsize: 2,
            height: 250,
            toolbar: [
                ['style', ['style']],
                ['font', ['bold', 'underline', 'clear']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['table', ['table']],
                ['insert', ['link', 'picture', 'video']],
                ['view', ['fullscreen', 'codeview', 'help']]
            ]
        });
        // 게시글 취소버튼 누를 시 confirm 버튼 
        $(".btn-cancel").on("click",function(){
        	if(!confirm("수정을 취소하시겠습니까?")){
                event.preventDefault();
                return false;
            }else{
           	 location.href='/detail.qboard?seq=${dto.seq}';
            }
        })
         // 파일 옆 삭제 버튼 클릭 시
	    $(".deleteFile").on("click", function(){
	        $(this).parent().hide(); // 해당 파일 항목 숨기기
	        
	        var sysname = $(this).data("sysname");
	        $(this).parent().hide(); // 파일 숨기기
	        console.log("삭제할 파일 sysname: " + sysname);
	        
	        // 삭제할 파일의 sysname을 deletedFiles 배열에 추가
	     	 deletedFiles.push(sysname);
	        
	        // 새 파일 업로드 input 추가
	        var fileCount = $(".fileinputtag input[type=file]").length + 1;
	        var fileinput = $("<input>", {
	            "type": "file",
	            "name": "file" + fileCount+3
	        });
	        $(".fileinputtag").append(fileinput);
	    });

     // 게시글 수정완료 버튼 클릭 시 
        $("#btncomplete").on("click", function() {
            if ($("#post-title").val() == "") {
                alert("제목을 입력하세요.");
                return false;
            }
            var markupStr = $('#summernote').summernote('code');
            if (markupStr == "<p><br></p>") {
                alert("내용을 입력해 주세요.");
                return false;
            }
            
         // 게시글 정보 및 삭제할 파일 목록(hidden input) 설정
	        $("#deletedFilesInput").val(deletedFiles.join(","));
         
            $("#post-seq").val();
            $("#post-title").val();
            $("#contents").val(markupStr);
            
            $("#editform").submit();
        });
	});
  
    </script>
</body>

</html>