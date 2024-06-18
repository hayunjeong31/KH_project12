<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write_page</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" ></script> 
<style>   
		*{ box-sizing: border-box;}
       div{border: solid 1px white; }
       .header{
       		text-align: center; height:50px;
       		display:flex; justify-content:center;align-items:center;
       	}
       .container{width: 50%; margin:auto;}
       .titlerow{width: 100%; padding: 1%; }
       #in_title{width: 98%; height: 30px; margin-top:2%; margin-bottom: 1%; padding:4%; border: 1px solid dodgerblue; border-radius: 10px;}
       #title{ padding-bottom: 4%;}
       .row3{  padding:1%;}
       #in_content{width: 98%; height: 300px; margin-bottom:1%; padding:4%; border: 1px solid dodgerblue; border-radius: 10px;}
        .row5{display:flex; justify-content:end; gap:5px;}
        button {        
        background: #93b3f7de ; 
        color: white; 
        border: none; 
        padding: 10px 20px;
        font-size: 16px; 
        font-weight: bold; 
        border-radius: 5px; 
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); 
        cursor: pointer; 
        transition: background 0.3s ease, box-shadow 0.3s ease;
	    }
	    button:hover {
	        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3); 
	    }	    
	    button:active {
	        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); 
	    }

</style>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
   <div class="container">
        <div class="header">자유게시판 글 작성하기</div>
        <div class="titlerow">
            <div class="col2" id="rctitle" style="border: none;">
                <input type="text" id="in_title" placeholder="제목을 입력해 주세요." autocomplete="off">
            </div>
        </div>
       	<form action="/write.board" method="post" id="writeform" enctype="multipart/form-data">
			첨부파일1: <input type="file" name="file1"><br>
			<input type="hidden" id="hidden_title" name="hidden_title">
	      	<input type="hidden" id="hidden_content" name="hidden_content">
		</form>
        <div class="row3" >
        	<div id="summernote"></div>
        </div>
        <div class="row5">
            <button type="button" id="btnlist">목록으로</button>
            <button type="button" id="btnup">작성완료</button>
        </div>
    </div>
			
	 
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
    </script>
    <script>
    	$("#btnlist").on("click",function(){
    		location.href="/list.board";
    	})
    	$("#btnup").on("click",function(){
    		if($("#in_title").val().trim() == ""){
    			alert("제목을 입력하세요.");
    			$("#in_title").focus();
    			return false;
    		}
    		var markupStr = $('#summernote').summernote('code');
    		if(markupStr =="<p><br></p>"){
    			alert("내용을 입력해 주세요.");
    			return false;
    		}
    		$("#hidden_title").val($("#in_title").val().trim());
    		$("#hidden_content").val(markupStr);
    		console.log($("#hidden_title").val());
    		console.log($("#hidden_content").val());
    		
    		$("#writeform").submit();
    	})
    </script>
</body>
</html>



