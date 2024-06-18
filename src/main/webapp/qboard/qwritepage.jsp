<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" ></script> 
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
	<main class="main">
        <section class="create-post-section">
            <article class="create-post-left">
                <h1>Destiny</h1>
                <div class="wc_message"></div>
            </article>
            <article class="create-post-area">
                <h2>게시물 작성</h2>
                
                    <div>
                       <p>글 제목</p>
                        <input type="text" id="post-title" name="post-title" required>
                    </div>
                    <div>
                        <label>내용</label>
                        <div id="summernote"></div>
                    </div>
                   
                    <form action="/write.qboard" method="post" id="writeform" enctype="multipart/form-data">
                    	<div>
                        <label>파일 업로드</label>
						첨부파일1: <input type="file" id="post-file" name="post-file"><br>
						<input type="hidden" id="hidden_title" name="hidden_title">
				      	<input type="hidden" id="hidden_content" name="hidden_content">
				      	<input type="hidden" id="hidden_password" name="hidden_password">
				      	</div>
					</form>
					
					<div class="form-password">
						<label for="post-file">비밀번호</label>			
						<input type="password" id="password" name="password" maxlength="4" pattern="\d{4}" required title="4자리 숫자로 입력해주세요">
						
					</div>
                    
                    <div class="form-buttons">
                        <button type="button" onclick="location.href='/list.qboard'">목록</button>
                        <button type="button" id="btnup">등록</button>
                    </div>
                
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
    </script>
</body>
</html>