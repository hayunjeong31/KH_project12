<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" ></script> 
<style>

</style>
</head>
<body>
	<main class="main">
        <section class="board-section">
            <article class="board-left">
                <h1>Destiny</h1>
                <div class="wc_message"></div>
            </article>
            <article class="board-area">
                <h2>게시물 상세보기</h2>
                <div class="post-details">
                    <p><strong>제목</strong><br>${dto.seq}${dto.title}</p>
                    <p><strong>글쓴이</strong><br>${dto.writer} </p>
                    <p><strong>내용</strong><br>${dto.contents}</p>
                    <p><strong>조회수</strong><br>${dto.view_count}</p>
                    <p><strong>작성일</strong><br>
	                	<c:choose>
	                       	<c:when test="${dto.upd_date != null}">
	                       		${dto.upd_date}
	                       	</c:when>
	                       	<c:otherwise>
	                       		${dto.write_date}
	                       	</c:otherwise>
                    	</c:choose>
                    </p>   
                </div>
                <div class="post-actions">
	                <c:choose>
	                	<c:when test="${iswriter && count==0}">
					        <button type="button" id="btnedit">수정하기</button>
					        <button type="button" id="btndelete">삭제하기</button>
			                <button type="button" id="btnlist" onclick="location.href='/list.qboard'">목록으로</button>
					    </c:when>
			            <c:when test="${iswriter}"> <!-- 코멘트가 달리면 수정하기 버튼 없애고 삭제하기 & 목록으로 두 버튼만.  -->
			                <button type="button" id="btndelete">삭제하기</button>
			                <button type="button" id="btnlist" onclick="location.href='/list.qboard'">목록으로</button>
			            </c:when>
			            	
			            
			            <c:otherwise>
			                <button type="button" id="btnlist" onclick="location.href='/list.qboard'">목록으로</button>
			            </c:otherwise>
			        </c:choose>
                </div>
                
                <div class="post-attachments">
                    <h3>첨부 파일</h3>
                    <ul>
						<c:forEach var="i" items="${list }">
							<div>${i.seq}.<a href="/download.file?sysname=${i.sysname}&oriname=${i.oriname}">${i.oriname}</a></div>
						</c:forEach>
                    </ul>
                </div>
                
                <c:choose>
                	<c:when test="${adminKey != 0}">
                		<div class="post-comments">
		                    <h3>댓글</h3>
		                    <textarea id="new-comment" placeholder="댓글 입력"></textarea>
		                    <button type="button" id="submit-comment">등록</button>
		                </div>
                	</c:when>
                </c:choose>
                
                
                <div id="comment-box">
                <!-- ajax로 댓글 불러오기  -->
                </div>
                
                <!-- 댓글 수정하기, 삭제하기 -->
				<form action="/delete.qreply" id="deleteForm" method="post">
				    <input type="hidden" name="c_seq" id="c_seq" value="">
				    <input type="hidden" class="c_parent_seq" name="c_parent_seq" value="${dto.seq}">
				</form>
				<form action="/edit.qreply" id="editForm" method="post">
				    <input type="hidden" name="c_seq" id="edit_c_seq" value="">
				    <input type="hidden" name="c_parent_seq" id="edit_c_parent_seq" value="${dto.seq}">
				    <input type="hidden" name="edit_contents" id="edit_contents" value="">
				</form>
                
                
            </article>
        </section>
    </main>
    
    <script>
	    	// 게시글 수정하기, 삭제하기
		    $("#btnedit").on("click", function() {
		    	location.href = "/edit.qboard?seq=${dto.seq}";
		    })
		    $("#btndelete").on("click", function() {
		        if (confirm('정말 삭제하시겠습니까?')) {
		            location.href = "/delete.qboard?seq=${dto.seq}";
		        }
		    })
	    
		    $(document).ready(function(){
			    // 페이지 로드 시 댓글 로드
			    loadComments();
			    // 댓글 로드 함수
			    function loadComments(){
			        $.ajax({
			            url: "/getcomment.qreply",
			            type: "get",
			            data: { seq: ${dto.seq} },
			            dataType: "json",
			            success: function(resp) {
			                let c_list = resp.c_list;
			                let loginID = "${loginID}";
			
			                for(let i of c_list){
			                    let box_comment = $("<div>",{"class":"box_comment"});
			                    let comment = $("<div>",{"class":"comment","style":"border:3px solid pink;"});
			                    
			                    let co_writer = $("<div>",{"class":"col1","style":"text-align:left;"});
			                    let co_contents = $("<div>",{"class":"col3"});
			                    let co_write_date = $("<div>");
			                    let c_seq_input = $("<input>",{"type":"hidden","class":"c_seq","value": i.seq });
			                    
			                 	// 텍스트의 줄바꿈 문자를 <br> 태그로 변환
			                    let contentsWithBreaks = i.contents.replace(/\n/g, '<br>');
			                 
			                    co_writer.html(i.userId);
			                    co_contents.html(contentsWithBreaks); // 변환된 내용을 사용
			                    co_write_date.html(i.write_date);
			                    
			                    comment.append(co_writer);
			                    comment.append(co_contents);
			                    comment.append(co_write_date);
			                    comment.append(c_seq_input);
			                    
			                    box_comment.append(comment);
			                    
			                    let btncomment = $("<div>",{"class":"btncomment"});
			                    if(loginID == i.userId){
			                        let co_edit = $("<button>",{"class":"co_edit"}).text("수정");
			                        let co_edit_complete = $("<button>",{"class":"co_edit_complete","style":"display:none;"}).text("수정완료");
			                        let co_delete = $("<button>",{"class":"co_delete"}).text("삭제");
			                        let co_cancel = $("<button>",{"class":"co_cancel","style":"display:none;"}).text("취소");
			                        
			                        btncomment.append(co_edit);
			                        btncomment.append(co_edit_complete);
			                        btncomment.append(co_delete);
			                        btncomment.append(co_cancel);
			                        
			                        box_comment.append(btncomment);
			                    }
			                    
			                    $("#comment-box").append(box_comment);
			                }
			            }
			        });
			        
			        // 댓글 수정하기 버튼 클릭 시
			        $("#comment-box").on("click", ".co_edit", function() {
			            var editableBox = $(this).parent().siblings(".comment").find(".col3");
			            // <br> 태그를 줄바꿈 문자로 변환
			            editableBox.html(editableBox.html().replace(/<br\s*\/?>/g, '\n'));
			            editableBox.attr("contenteditable", "true");
			            editableBox.focus();
			            $(this).hide(); // 수정하기 버튼 숨기기
			            $(this).siblings(".co_delete").hide(); // 삭제하기 버튼 숨기기
			            $(this).siblings(".co_edit_complete").show(); // 수정완료 버튼 보이기
			            $(this).siblings(".co_cancel").show(); // 수정취소 버튼 보이기
			        });

			        // 댓글 수정취소 버튼 클릭 시
			        $("#comment-box").on("click", ".co_cancel", function() {
			           location.reload();
			        });

			
			        
					// 댓글 수정완료 버튼 클릭 시 
			        $("#comment-box").on("click", ".co_edit_complete", function() {
			            var editableBox = $(this).parent().siblings(".comment").find(".col3");
			            editableBox.attr("contenteditable", "false");
			        	 // 줄바꿈 문자를 <br> 태그로 변환
			            var editContents = editableBox.html().replace(/(\r\n|\n|\r)/g, '<br>'); 
			            var c_seq = $(this).closest(".box_comment").find(".c_seq").val();
			
			            $("#edit_c_seq").val(c_seq);
			            $("#edit_contents").val(editContents);
			
			            $(this).hide(); // 수정완료 버튼 숨기기
			            $(this).siblings(".co_edit").show(); // 수정하기 버튼 보이기
			            $(this).siblings(".co_delete").show(); // 삭제하기 버튼 보이기
			            $(this).siblings(".co_cancel").hide(); // 수정취소 버튼 숨기기
			            
			            $("#editForm").submit();
			        });
			
					// 댓글 삭제 버튼 클릭 시 
			        $("#comment-box").on("click", ".co_delete", function() {
			           if(confirm("정말 댓글을 삭제하시겠습니까?")){
			        	var c_seq = $(this).closest(".box_comment").find(".c_seq").val();
			            $("#c_seq").val(c_seq);
			            $("#deleteForm").submit();
			           }
			        });
			    }
			
			    // 댓글 등록하기
			    $("#submit-comment").on("click", function(){
			        let newComment = $("#new-comment").val().trim();
			        if(newComment === ""){
			            alert("댓글을 입력하세요.");
			            return;
			        }
			        $.ajax({
			            url: "/comment.qreply",
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
			    
			    
			    
			}); // document.ready 끝 부분

    </script>
</body>
</html>