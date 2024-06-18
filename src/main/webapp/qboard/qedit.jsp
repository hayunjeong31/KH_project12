<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시물 수정</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet" href="css/edit_styles.css">
    <link href="${pageContext.request.contextPath}/css/header_styles.css" rel="stylesheet" type="text/css">

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
            background-color: rgba(195, 208, 23, 0.578);
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
            border: 1px solid #cccccc77;
            border-radius: 5px;
            font-size: 1em;
        }

        .form-field input[type="file"] {
            border: none;
        }

        .form-buttons {
            display: flex;
            justify-content: space-between;
            width: 100%;
        }

        .form-buttons button {
            padding: 10px 20px;
            border: none;
            background-color: rgba(195, 208, 23, 0.578);
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            width: 48%;
        }

        .form-buttons button:hover {
            background-color: rgba(221, 235, 16, 0.78);
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
	</style>
</head>

<body>
    <header>
        <div class="header-container">
            <img src="image/GamebitLogo.png" alt="Gamebit Logo" class="logo">
            <nav>
                <ul>
                    <li>
                        <a href="index.html">홈</a>
                    </li>
                    <li>
                        <a href="notice.html">공지사항</a>
                    </li>
                    <li>
                        <a href="#">내 정보</a>
                        <div class="dropdown">
                            <a href="#">내 정보 보기</a>
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
            </div>
        </div>
    </header>
    <main class="main">
        <section class="edit-post-section">
            <article class="board-left">
                <h1>게시물 수정</h1>
                <div class="wc_message"></div>
            </article>
            <article class="edit-post-area">
                <h2></h2>
                <form class="post-form" action="/update.qboard" method="post" enctype="multipart/form-data">
                    <div class="post-form">
                        <div class="form-field">
                            <label for="post-title">글 제목</label>
                            <input type="text" id="post-title" name="post-title" value="${dto.title}" placeholder="제목을 입력하세요" required>
                            <input type="hidden" id="post-seq" name="post-seq" value="${dto.seq}">
                        </div>
                        <div class="form-field">
                            <label for="post-content">내용</label>
                            <div id="summernote">${dto.contents}</div>
                            <input type="hidden" id="contents" name="contents">
                        </div>
                        <div class="form-field">
                            <label for="post-file">파일 업로드</label>
                            <input type="file" id="post-file" name="post-file"><br>
                        </div>
                        <div class="uploadedFile">
                            <!-- 업로드 했던 파일 리스트 -->
                            <c:forEach var="i" items="${list}">
                                <div>
                                    <i class="fa-regular fa-file"></i>
                                    <a href="/download.file?sysname=${i.sysname}&oriname=${i.oriname}" data-sysname="${i.sysname}">${i.oriname}</a>
                                    <button type="button" class="deleteFile" data-sysname="${i.sysname}"><i class="fa-solid fa-trash"></i></button>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="form-buttons">
                            <button type="button" class="btn-cancel" onclick="location.href='/detail.qboard?seq=${dto.seq}'">취소</button>
                            <button type="submit" class="btn-submit">수정</button>
                        </div>
                    </div>
                </form>
            </article>
        </section>
    </main>
    <script>
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

     // 게시글 수정완료 버튼 클릭 시 
        $(".btn-submit").on("click", function() {
            if ($("#post-title").val() == "") {
                alert("제목을 입력하세요.");
                return false;
            }
            var markupStr = $('#summernote').summernote('code');
            if (markupStr == "<p><br></p>") {
                alert("내용을 입력해 주세요.");
                return false;
            }
            $("#post-seq").val();
            $("#post-title").val();
            $("#contents").val(markupStr);
        });

        // 파일 삭제 버튼 클릭 시 -> 수정필요 : 파일삭제버튼 누르면 ui로만 hide하게, 그리고 수정완료 버튼 누르면 hide한거 db에 삭제하게 
   /*     $(".deleteFile").on("click", function() {
            var sysname = $(this).data("sysname");
            var $fileDiv = $(this).closest('div');
            $.ajax({
                url: "/delete.file",
                method: "POST",
                data: { sysname: sysname },
                success: function(response) {
                    if (response == 'success') {
                        $fileDiv.remove();
                    } else {
                        alert("파일 삭제에 실패했습니다.");
                    }
                },
                error: function() {
                    alert("파일 삭제 중 오류가 발생했습니다.");
                }
            });
        }); */
    </script>
</body>

</html>