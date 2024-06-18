<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" ></script> 
<style>
	body {
	  font-family: Inter, sans-serif;
	  height: 100vh;
	}
	*{ box-sizing: border-box; margin:0; padding:0;}
		
        .container{width: 50%; margin:auto; border:1px solid black;}
        .header{
        	height:60px;
        	display:flex; justify-content:center; align-items:center;
        	border:1px solid black;   margin:5%;      	
         }
        .content{border:1px solid white; }
        .row2{display: flex; width: 100%;border:1px solid white; margin-top:4%;margin-bottom:3;}
        .col1{ margin-left:5px;}
        .col2{ margin-left:5px;}
        .writer_info{ margin-left:5px;}
        .write_info{display: flex; width: 100%;border:1px solid black;}
        .col4{ margin-left:5px;;}
        .col5{ margin-left:5px;}

         button {
	        background: #b3f1a0de ; 
	        color: white; 
	        border: none; 
	        padding: 10px 20px;
	        margin:5px 0 5px 5px;
	        
	        font-size: 16px; 
	        font-weight: bold; 
	        border-radius: 5px; 
	        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); 
	        cursor: pointer; 
	        transition: background 0.3s ease, box-shadow 0.3s ease;
	    }
	    
	    button:hover {
	        background: #b3f1a0de; 
	        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3); 
	    }
	    
	    button:active {
	        background: #b3f1a0de; 
	        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); 
	    }
	    #title{width: 80%; height: 30px;padding:2%; margin-top:2%; margin-bottom: 1%;  border: 1px solid dodgerblue; border-radius: 10px;}
	     
</style> 
</head>
<body>

   <div class="container" >
       <div class="header">게시글 수정</div>
       <form action="/update.board" method="post">
       	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
   		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
       <div class="content">
       	  	
	       <div class="row2">
	           <div class="col1" id="rc1">${dto.seq}</div>
	           <input type="hidden" id="hidden_seq" name="seq">
	           <input type="text" id="title" name="title" value="${dto.title}" placeholder="제목을 입력하세요.">
	       </div>
	       <div class="writer_info">
	       		<div class="col3" id="rcwriter">${dto.writer}</div>
	       </div>
	       <div class="write_info">		
	           	<div class="col4" id="rcwritedate">${dto.write_date}</div>
	           	<div class="col5" id="rcview">${dto.view_count}</div>
	       </div>
	       <div class="row3">
	       	<div id="summernote">${dto.contents}</div>
	       </div>
	       <input type="hidden" id="contents" name="contents">
       </div>
       <div class="row5">
                <button type="submit" id="btncomplete">수정완료</button>
                <button type="button" onclick="location.href='/detail.board?seq=${dto.seq}'">취소</button>
    	</div>
    	</form>  
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
    	$("#btncomplete").on("click",function(){
    		if($("#title").val() == ""){
    			alert("제목을 입력하세요.");
    			return false;
    		}
    		var markupStr = $('#summernote').summernote('code');
    		if(markupStr =="<p><br></p>"){
    			alert("내용을 입력해 주세요.");
    			return false;
    		}
    		$("#hidden_seq").val($("#rc1").text().trim());
    		$("#title").val();
    		$("#contents").val(markupStr);
    	
    	})
    </script>


</body>
</html>