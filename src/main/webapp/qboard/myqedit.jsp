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
            font-family: "GalmuriMono9", monospace;
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
            font-family: Arial, sans-serif;
            
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
            background-color: rgba(45, 19, 112, 0.684);
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

        .wc_message {
            display: none;
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
	   #fileloading{
	   	margin-bottom:0;
	   	padding-bottom:0;
	   }
	   .uploadedFile .file-list{
	   	margin-bottom:2%;
	   }
	   .deleteFile{
	   	font-family: "GalmuriMono9", monospace;
	   	margin:1%;
	   
	   }
	   
	   /*또 추가 수정 css*/
	   input{
			font-family: "GalmuriMono9", monospace;
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
                            <a href="win.html">명예의 전당</a>
                            <a href="#">Subitem 2</a>
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
                <form class="post-form" action="/myupdate.qboard" method="post" enctype="multipart/form-data">
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
                        <div class="form-field" id="fileloading">
                            <label>파일 업로드</label>
                            <input type="file" id="post-file" name="post-file"><br>
                        </div>
                        <div class="uploadedFile">
                            <!-- 업로드 했던 파일 리스트 -->
                            <c:forEach var="i" items="${list}">
                                <div class="file-list">
                                    <i class="fa-regular fa-file"></i>
                                    ${i.oriname}
                                    <button type="button" class="deleteFile" data-sysname="${i.sysname}">삭제<i class="fa-solid fa-trash"></i></button>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="form-buttons">
                            <button type="button" class="btn-cancel">취소</button>
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
        // 게시글 취소버튼 누를 시 confirm 버튼 
        $(".btn-cancel").on("click",function(){
        	if(!confirm("수정을 취소하시겠습니까?")){
                event.preventDefault();
                return false;
            }else{
           	 location.href='/myqdetail.qboard?seq=${dto.seq}';
            }
        })

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

  
    </script>
</body>

</html>