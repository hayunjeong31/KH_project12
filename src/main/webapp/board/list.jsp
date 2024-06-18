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
		*{ box-sizing: border-box; margin:0; padding:0;}
		div{border: solid 1px black; text-align: center;}
        .container{width: 800px; margin:auto;}
        .header{
        	height:60px;
        	display:flex; justify-content:center; align-items:center;
         	
         }
        
        .row2{display: flex; width: 100%;}
        .col1{flex:0.05;}
        .col2{flex:0.5;}
        .col3{flex:0.15;}
        .col4{flex:0.2;}
        .col5{flex:0.1;}

        .row3{display:flex; justify-content: center; align-items: center; height: 40px;}
         button {
	        background: #b3f1a0de ; 
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
	        background: #b3f1a0de; 
	        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3); 
	    }
	    
	    button:active {
	        background: #b3f1a0de; 
	        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); 
	    }
	    .col2 a{
            text-decoration: none;
            color: black;
            margin:1em;
        }
				
</style>
</head>
<body>
    <div class="container" >
       <div class="header">자유게시판</div>
       <div class="content">
       <div class="row2">
           <div class="col1" id="rc1"></div>
           <div class="col2" id="rctitle">제목</div>
           <div class="col3" id="rcwriter">작성자</div>
           <div class="col4" id="rcwritedate">날짜</div>
           <div class="col5" id="rcview">조회</div>
       </div>
       
		<c:forEach var="dto" items="${list}">
			<div class="row3" id="content" style="border:none;">
			   <div class="col1" >${dto.seq}</div>
	           <div class="col2" style="text-align:left;"><a href="/detail.board?seq=${dto.seq}">${dto.title}</a>
	           </div>
	           <div class="col3">${dto.writer}</div>
	           <div class="col4" style="border:none;">
	           		<c:choose>
                       	<c:when test="${dto.upd_date != null}">
                       		<div><fmt:formatDate value="${dto.upd_date}" pattern="yyyy.MM.dd" /></div>
                       	</c:when>
                       	<c:otherwise>
                       		<div><fmt:formatDate value="${dto.write_date}" pattern="yyyy.MM.dd" /></div>
                       	</c:otherwise>
                    </c:choose>
	           		
	           </div>
	           <div class="col5">${dto.view_count}</div>
			</div>		
		</c:forEach>
       </div>
       
         <form action="/search.board?">
		        <select name="option" id="searchOption">
		            <option value="title">제목</option>
		            <option value="writer">작성자</option>
		            <option value="title_writer">제목+작성자</option>
		        </select>
		        <input type="text" name="keyword" id="searchInput" placeholder="검색어를 입력하세요" required>
		        <button type="submit" id="searchBtn">검색</button>
		   </form>
         <div class="pagination">
                </div>
                
      
       <div class="row5">
       		<button type="button" id="btnhome">Home</button>
       		<button type="button" id="btnwrite">작성하기</button>
		</div>
    </div>
    <script>
    
    $(document).ready(function(){
    	$("#btnhome").on("click",function(){
    		location.href="/index.jsp";
    	})
	   	$("#btnwrite").on("click", function() {
	           <c:choose>
	               <c:when test="${loginID != null}">
	                   location.href = "/board/writepage.jsp";
	               </c:when>
	               <c:otherwise>
	                   alert("로그인이 필요합니다.");
	                   location.href = "/index.jsp";
	               </c:otherwise>
	           </c:choose>
        });
    	
    	
    	// 전체 게시글 페이징 & 검색 게시글 페이징. 	
	 	let cpage = ${cpage};
	    let record_total_count = ${record_total_count};
	    let record_count_per_page = ${record_count_per_page};
	    let navi_count_per_page = ${navi_count_per_page};
	    let page_total_count = 0;

	    if(record_total_count % record_count_per_page > 0){
	        page_total_count = Math.trunc(record_total_count / record_count_per_page) + 1;
	    } else{
	        page_total_count = Math.trunc(record_total_count / record_count_per_page);
	    }

	    let startNavi = Math.trunc((cpage - 1) / navi_count_per_page) * navi_count_per_page + 1;
	    let endNavi = startNavi + navi_count_per_page - 1;

	    if(endNavi > page_total_count){
	        endNavi = page_total_count;
	    }   

	    let needNext = true; 
	    let needPrev = true;
	    if(startNavi == true){
	        needPrev = false;
	    }
	    if(endNavi == page_total_count){
	        needNext = false;
	    }
	    if(${isSearch}==1){
	    	
	    	 if(needPrev == true){
	 	        $(".pagination").append("<a href='/search.board?cpage=" + (startNavi - 1) + "&keyword=${keyword}&option=${option}'> < </a>");
	 	    }
	 	    for(let i = startNavi; i <= endNavi; i++){
	 	        $(".pagination").append("<a href='/search.board?cpage=" + i + "&keyword=${keyword}&option=${option}'>" + i + "</a> ");
	 	    }
	 	    if(needNext == true){
	 	        $(".pagination").append("<a href='/search.board?cpage=" + (endNavi + 1) + "&keyword=${keyword}&option=${option}'> > </a>");
	 	    }
	    }else{
	    	
	    	  if(needPrev == true){
	    	        $(".pagination").append("<a href='/list.board?cpage=" + (startNavi - 1) + "'> < </a>");
	    	    }
	    	    for(let i = startNavi; i <= endNavi; i++){
	    	        $(".pagination").append("<a href='/list.board?cpage=" + i + "'>" + i + "</a> ");
	    	    }
	    	    if(needNext == true){
	    	        $(".pagination").append("<a href='/list.board?cpage=" + (endNavi + 1) + "'> > </a>");
	    	    }
	    }
	    	
    });	
    	
    </script>
</body>
</html>



