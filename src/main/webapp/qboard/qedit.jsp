<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 수정</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
    <main class="main">
        <section class="edit-post-section">
            <article class="board-left">
                <h1>Destiny</h1>
                <div class="wc_message"></div>
            </article>
            <article class="edit-post-area">
                <h2>게시물 수정</h2>
                <form class="post-form" action="/update.qboard" method="post" enctype="multipart/form-data">
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
                        첨부파일1: <input type="file" id="post-file" name="post-file"><br>
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
                </form>
            </article>
        </section>
    </main>
    
    <script>
        $('#summernote').summernote({
            placeholder: '내용을 입력해 주세요.',
            tabsize: 2,
            height: 400,
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
        $(".deleteFile").on("click", function() {
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
        });
        
    </script>
</body>
</html>
