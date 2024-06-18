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
	*{ box-sizing: border-box; margin:0; padding:0;}
		div{border:none;}
        .container{width: 50%; margin:auto; border:1px solid black;}
        .header{
        	border:1px solid black;
        	height:60px;
        	display:flex; justify-content:center; align-items:center;
         	
         }
        .content{border:1px solid black;}
        .row2{display: flex; width: 100%; border:1px solid black;}
        .col1{margin-left:5px;}
        .col2{margin-left:5px;}
        .col3{font-size:15px;font-weight:bold; margin-left:5px;}
        
        .write_info{display:flex; margin-left:5px;}
      

       	.row3{border:2px solid dodgerblue; border-radius:4%; min-height: 300px;	}
        .colcol{
        	word-wrap: break-word;  
        	margin:5%;
        }
         button {
	        background: #b3f1a0de ; 
	        color: white; 
	        border: none; 
	        padding: 5px 20px;
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
	    #comment{ width: 80%; margin: 5px 0 0 5px; padding: 5px 20px; }
</style> 
</head>
<body>
<!-- 게시글 클릭 시점에 게시글 내용은 EL/JSTL로 출력하되 댓글 목록은 AJAX로 추가로 받아으는 문법으로 변경 -->
   <div class="container" >
   	   
	       <div class="header">자유게시판</div>
	       <div class="content">
		       <div class="row2">
		           <div class="col1" id="rc1">${dto.seq}</div>
		           <input type="hidden" id="seq" name="seq" value="${dto.seq }">
		           <div class="col2" id="rctitle">${dto.title}</div>
		         
		       </div>
		       <div class="writer_info">
		         <div class="col3" id="rcwriter">${dto.writer}</div>
		       </div>
		       <div class="write_info">
		         <div class="col4" id="rcwritedate">
		         		<c:choose>
	                       	<c:when test="${dto.upd_date != null}">
	                       		${dto.upd_date}
	                       	</c:when>
	                       	<c:otherwise>
	                       		${dto.write_date}
	                       	</c:otherwise>
                    	</c:choose>
		         </div>
		         <div class="col5" id="rcview"> 조회 ${dto.view_count}</div>
		       </div>
		       
		       <div id="filelist">
				<c:forEach var="i" items="${list }">
					<div>${i.seq}.<a href="/download.file?sysname=${i.sysname}&oriname=${i.oriname}">${i.oriname}</a></div>
				</c:forEach>
			   </div>	
		       
		       <div class="row3">
		       	<div class="colcol">${dto.contents}</div>	
		       </div>
	       </div>
	       <div class="row5">
	        <c:choose>
	            <c:when test="${iswriter}">
	                <button type="button" id="btnedit">수정하기</button>
	                <button type="button" id="btndelete">삭제하기</button>
	                <button type="button" id="btnlist">목록으로</button>
	            </c:when>
	            <c:otherwise>
	                <button type="button" id="btnlist">목록으로</button>
	            </c:otherwise>
	        </c:choose>
	    	</div>  
	    	
	    	
	    	<div class="row_comment">
	    		<div class="comment" style="border:1px solid black">
	    			<div class="post-comments">
	                    <h3>댓글</h3>
	                    <textarea id="new-comment" placeholder="댓글 입력"></textarea>
	                    <button type="button" id="submit-comment">등록</button>
	                </div>
	    		</div>
	    	
	    	</div>
    	
    	
    	<div id="comment-box">
    	
		</div>
		
		<form action="/delete.reply" id="deleteForm" method="post">
			<input type="hidden" name="c_seq"  id="c_seq" value=c_seq>
			<input type="hidden" class="c_parent_seq" name="c_parent_seq" value="${dto.seq }">
		</form>
		<form action="/edit.reply" id="editForm" method="post">
	       <input type="hidden" name="c_seq" id="edit_c_seq">
	       <input type="hidden" name="c_parent_seq" id="edit_c_parent_seq" value="${dto.seq}">
	       <input type="hidden" name="edit_contents" id="edit_contents">
       </form>
	
    </div>
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
	    
	    $("#comment-box").on("click", ".co_edit", function() {
            var editableBox = $(this).parent().siblings(".comment").find(".col3");
         // <br> 태그를 줄바꿈 문자로 변환
            editableBox.html(editableBox.html().replace(/<br\s*\/?>/g, '\n'));
            editableBox.attr("contenteditable", "true");
            editableBox.focus();
            $(this).css("display", "none");
            $(this).next().css("display", "inline");
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