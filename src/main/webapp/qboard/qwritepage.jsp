<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시물 작성</title>

<script src="https://code.jquery.com/jquery-3.7.1.js" ></script> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link href="${pageContext.request.contextPath}/css/header_styles.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/galmuri/dist/galmuri.css">
 
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

</head>
<style>

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    
}

body, html {
    height: 100%;
    font-family: "GalmuriMono9", monospace;
}

.main {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
    background-color: #f4f4f4;
    background-image: url('../image/5033917.jpg'); 
     
}

.create-post-section {
    display: flex;
    width: 70%;
    height: 80%;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    overflow: hidden;
    background-color: rgba(255, 255, 255, 0.563);
}

.create-post-left {
    flex: 1;
    background-color: rgba(45, 19, 112, 0.684);
    color: white;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

.create-post-left h1 {
    font-size: 36px;
}

.create-post-area {
    flex: 2;
    padding: 40px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.create-post-area h2 {
    font-size: 24px;
    margin-bottom: 20px;
    color: black;
    text-align: center;
}

.post-form {
    width: 100%;
    max-width: 800px;
}

.form-field {
    margin-bottom: 20px;
    display: flex;
    flex-direction: column;
}

.form-field label {
    margin-bottom: 5px;
    font-weight: bold;
    font-size: 1em;
}

.form-field input[type="text"],
.form-field textarea,
.form-field input[type="file"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1em;
    font-family: "GalmuriMono9", monospace;

}

.form-field input[type="file"] {
    border: none;
    font-family: "GalmuriMono9", monospace;
        
}
input{
	font-family: "GalmuriMono9", monospace;
}
 

.form-buttons {
    display: flex;
    justify-content: space-between;
    width: 100%;
}

.form-buttons button {
    padding: 10px 20px;
    border: none;
    background-color: rgba(205, 151, 14, 0.595);
    color: white;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1em;
    width: 48%;
    font-family: "GalmuriMono9", monospace;
}
.form-buttons button:hover {
    background-color: rgba(237, 175, 18, 0.973);
        }

.form-buttons .btn-cancel {
    background-color: #dc3545;
}

.form-buttons .btn-cancel:hover {
    background-color: #c82333;
}

.form-buttons .btn-submit {
    background-color: #28a745;
}

.form-buttons .btn-submit:hover {
    background-color: #218838;
}

.wc_message {
    display: none;
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
        background-image: url('../image/9.png');
        
    }

   .file-input{
   		font-family: "GalmuriMono9", monospace;
   }

 /* Summernote 배경색 설정 */
     .note-editable {
         background-color: #d3d2d8d5; /* 원하는 배경색으로 설정 */
       font-family: "GalmuriMono9", monospace;
     }
     .note-placeholder {
    font-family: "GalmuriMono9", monospace; /* 원하는 글꼴로 변경 */
    font-size: 16px; /* 원하는 크기로 변경 */
    color: #888; /* 원하는 색상으로 변경 */
}
   
   .note-resizebar{
   	 	display: none;
   }
   /* password */
   #password{
   		margin-bottom: 20px;
   		text-align:center;
   }
   .file-input-container{
   		padding-bottom:5px;
   }
   
    </style>
<body>
    <header>
        <div class="header-container">
            <img src="../image/GamebitLogo.png" alt="Nintendo Logo" class="logo">
            <nav>
                <ul>
                    <li>
                        <a href="index.html">홈</a>
                        <div class="dropdown"></div>
                    </li>
                    <li>
                        <a href="#">게임</a>
                        <div class="dropdown">
                            <a href="win.html">명예의 전당</a>
                            <a href="#">Subitem 2</a>
                            <a href="#">랭킹</a>
                        </div>
                    </li>
                    <li>
                        <a href="board.html">게시판</a>
                        <div class="dropdown">
                            <a href="board.html">게시판</a>
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
        <section class="create-post-section">
            <article class="create-post-left">
                <h1>게시물 작성</h1>
                <div class="wc_message"></div>
            </article>
            <article class="create-post-area">
                <h2></h2>
                <div class="post-form">
                    <div class="form-field">
                        <label>글 제목</label>
                        <input type="text" id="post-title" name="post-title" required>
                    </div>
                    <div class="form-field">
                        <label>내용</label>
                        <div id="summernote"></div>
                    </div>

                    <form action="/write.qboard" method="post" id="writeform" enctype="multipart/form-data">
                    	<div class="file-field"> 
                        <label>파일 업로드</label>
                        <div class="file-input-container">
				            <input type="file" name="file1" class="file-input" id="file-input1">
				        </div>
				        <div class="file-input-container">
					    	<input type="file" name="file2">
					    </div><br>
                            <input type="hidden" id="hidden_title" name="hidden_title">
                            <input type="hidden" id="hidden_content" name="hidden_content">
                            <input type="hidden" id="hidden_password" name="hidden_password">
				      	</div>
					</form>

                    <div class="form-password">
						<label>비밀번호</label>			
						<input type="password" id="password" name="password" maxlength="4" pattern="\d{4}" required title="4자리 숫자로 입력해주세요" placeholder="  4자리 숫자 입력">
					</div>

                  
                    <div class="form-buttons">
                        <button type="button" class="btn-home">목록</button>
                        <button type="button" id="btnup">등록</button>
                    </div>
                </div>
            </article>
        </section>
    </main>
    <script>
    $(".btn-home").on("click",function(){
    	if(!confirm("작성을 취소하시겠습니까?")){
            event.preventDefault();
            return false;
        }else{
        	location.href='/list.qboard';
        }
    })
    $(document).ready(function() {
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
        
            $("#btnup").on("click",function(){
                if($("#post-title").val().trim() == ""){
                    alert("제목을 입력하세요.");
                    $("#post-title").focus();
                    return false;
                }
                var markupStr = $('#summernote').summernote('code');
                if(markupStr =="<p><br></p>"){
                    alert("내용을 입력해 주세요.");
                    return false;
                }
              
                
                var password = $("#password").val().trim();
                if (password !== "") {
                    let regexpw = /^\d{4}$/; 
                    let result = regexpw.test(password);
                    if (result == false) {
                        alert("비밀번호는 4자리 숫자여야 합니다.");
                        $("#password").focus();
                        return false;
                    }
                }else{
                    if(!confirm("공개글 할거임?")){
                        event.preventDefault();
                        return false;
                    }
                    password = null;
                }
                
                
                $("#hidden_title").val($("#post-title").val().trim());
                $("#hidden_content").val(markupStr);
                $("#hidden_password").val($("#password").val().trim());
                
                $("#writeform").submit();
            })
    });
        </script>
</body>
</html>