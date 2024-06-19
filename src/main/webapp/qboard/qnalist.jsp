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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link href="${pageContext.request.contextPath}/css/header_styles.css" rel="stylesheet" type="text/css">
 <style>
        /* Inline styles for specific to this HTML file */

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body,
        html {
            height: 100%;
            font-family: Arial, sans-serif;
            background-image: url('image/5033917.jpg');
        }

        body {
            font-family: 'Open Sans', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
        }

        .main {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 80px);
            background-color: #f4f4f43c;
            width: 80%;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
        }

        .board-section {
            display: flex;
            width: 100%;
            height: 100%;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0);
            border-radius: 10px;
            overflow: hidden;
            background-color: rgba(255, 255, 255, 0.054);
        }

        .board-left {
            flex: 1;
            background-color: rgba(45, 19, 112, 0.684);
            color: rgb(255, 255, 255);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .board-left h1 {
            font-size: 36px;
        }

        .board-area {
            flex: 2;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .new-button {
            padding: 8px 16px;
            background-color: rgb(64, 64, 116);
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-left: 850px;
            /* This might need adjustment based on your layout */
        }

        .board-area h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: black;
            text-align: center;
        }

        .board-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .board-table th,
        .board-table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
            color: black;
        }

        .board-table th {
            background-color: #f9f9f9b9;
        }

        .board-table tbody tr {
            background-color: #f9f9f9b9;
        }

        .board-table tbody tr:nth-child(even) {
            background-color: #f9f9f9b9;
        }

        .board-table a {
            color: black;
            text-decoration: none;
        }

        .board-table a:hover {
            text-decoration: underline;
        }

        .pagination {
            margin-bottom: 20px;
        }

        .pagination button {
            margin: 0 5px;
            padding: 5px 10px;
            border: 1px solid #ddd;
            background-color: rgba(255, 255, 255, 0.855);
            cursor: pointer;
            color: black;
        }

        .pagination button:hover {
            background-color: rgba(231, 231, 232, 0.004);
            color: white;
        }

        .pagination button:active {
            background-color: rgba(25, 25, 173, 0.598);
            color: white;
        }

        .board-buttons {
            display: flex;
            justify-content: space-between;
            width: 100%;
            max-width: 800px;
        }

        .board-buttons .write-button,
        .board-buttons .home-button {
            padding: 10px 20px;
            border: none;
            background-color: rgb(64, 64, 116);
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            width: 48%;
        }

        .board-buttons .write-button:hover,
        .board-buttons .home-button:hover {
            background-color: rgb(64, 64, 116);
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
        
        .pagination{
        	margin-top:3%;
        }
        .pagination a{
        	text-decoration: none;
        	color:white;
        }
        .pagination a.active{
        	font-size: 1.2em;
        	font-weight: bold;
        	color: violet;
        }
       .qna-list-button {
		    background: none;
		    border: none;
		    cursor: pointer;
		    padding: 0;
		}
		
		.qna-list-button i {
		    font-size: 1.5em;
		    font-weight:bold;
		    color: violet;
		}
    </style>
    <title>게시판</title>
</head>

<body>
 <header>
        <div class="header-container">
            <img src="image/GamebitLogo.png" alt="Nintendo Logo" class="logo">
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
        <section class="board-section">
            <article class="board-left">
                <h1>QnA게시판</h1>
                <div class="wc_message"></div>
            </article>
            <article class="board-area">
                <div class="top-right-button">
                    <button class="new-button" onclick="location.href='bookmark.html'"> 북마크 </button>
                </div>
                <h2></h2>
                 <!-- 검색어 표시 영역 -->
				<c:if test="${not empty keyword}">
				    <div class="search-info">
				       검색 <c:choose>
				            <c:when test="${option == 'title'}">제목</c:when>
				            <c:when test="${option == 'writer'}">작성자</c:when>
				            <c:otherwise>제목+작성자</c:otherwise>
				        </c:choose>
				        : ${keyword}
				    </div>
				</c:if>
                <table class="board-table">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>글쓴이</th>
                            <th>등록일</th>
                            <th>조회수</th>
                            <th>답변</th>
                        </tr>
                    </thead>
                    <tbody>
                    <!--  "${list}" 없으면 '검색결과없음' 뜨게 하기 -->
                    	 <c:choose>
		                        <c:when test="${empty list}">
		                            <tr>
		                                <td colspan="6" style="text-align:center;">검색 결과 없음</td>
		                            </tr>
		                        </c:when>
		                        <c:otherwise>
		                            <c:forEach var="dto" items="${list}">
		                                <tr>
		                                    <td>${dto.seq}</td>
		                                    <td>    
		                                        <a href="#" class="post-link" data-seq="${dto.seq}" data-password="${dto.password}">
		                                            <c:choose>
		                                                <c:when test="${dto.password == null}">${dto.title} <i class="fa-solid fa-lock-open"></i></c:when>
		                                                <c:otherwise>${dto.title} <i class="fa-solid fa-lock"></i></c:otherwise>
		                                            </c:choose>
		                                        </a>
		                                    </td>
		                                    <td>${dto.writer}</td>
		                                    <c:choose>
		                                        <c:when test="${dto.upd_date != null}">
		                                            <td><fmt:formatDate value="${dto.upd_date}" pattern="yyyy.MM.dd" /></td>
		                                            <td>${dto.view_count}</td>
		                                            <td>${dto.isAnswered}</td>
		                                        </c:when>
		                                        <c:otherwise>
		                                            <td><fmt:formatDate value="${dto.write_date}" pattern="yyyy.MM.dd" /></td>
		                                            <td>${dto.view_count}</td>
		                                            <td>${dto.isAnswered}</td>
		                                        </c:otherwise>
		                                    </c:choose>
		                                </tr>
		                            </c:forEach>
		                        </c:otherwise>
		                    </c:choose>
                    
                    </tbody>
                </table>

                    <!-- 리셋버튼 만들었음. 흠... 일단 만들음 -->
               <form action="/search.qboard?">
	                <select name="option" id="searchOption">
	                    <option value="title">제목</option>
	                    <option value="writer">작성자</option>
	                    <option value="title_writer">제목+작성자</option>
	                </select>
	                <input type="text" name="keyword" id="searchInput" placeholder="검색어를 입력하세요" required>
	                <button type="submit" id="searchBtn">검색</button>
	                <button class="qna-list-button" onclick="location.href='/list.qboard'"><i class="fa-solid fa-rotate-left"></i></button>
	           </form>

                <div class="pagination">
                </div>

                <div class="board-buttons">
                    <button class="write-button">글쓰기</button>
                    <button class="home-button" onclick="location.href='/index.jsp'">홈으로</button>
                </div>
            </article>
        </section>
    </main>

    <script>
   
    
        $(document).ready(function(){
                
            $(".post-link").on("click", function(e){
                e.preventDefault();
                let seq = $(this).data("seq");
                let password = $(this).data("password");
                var adminKey = "${adminKey}";
                let loginID = "${loginID}";
                let writer = $(this).closest("tr").find("td:nth-child(3)").text().trim(); 
                
                if(adminKey != 0 || loginID == writer){
                    location.href = "detail.qboard?seq="+seq;
                }else{
                    if(password ==""){
                        location.href = "detail.qboard?seq="+seq;
                    }
                    else{
                        let pwcheck = prompt("비밀번호 입력하세요");
                        if(pwcheck !== null && pwcheck !==""){	// 비번 입력 취소하거나 아무것도 입력안했을 때 처리. 
                             $.ajax({
                                    url: "/comparePwd.qboard",
                                    method: "POST",
                                    data: { 
                                        seq: seq, 
                                        password: pwcheck 
                                    },
                                    dataType: "json",	
                                    success: function(response) {
                                        if(response === 1) {
                                            location.href = "detail.qboard?seq="+seq;
                                        } else {
                                            alert("비밀번호가 일치하지 않습니다.");
                                        }
                                    },
                                    error: function() {
                                        alert("비밀번호 확인 중 오류가 발생했습니다.");
                                    }
                                });
                        }
                    }
                }
                
                
            }); // $(".post-link").on("click", function(e){ // 끝
       
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
                         $(".pagination").append("<a href='/search.qboard?cpage=" + (startNavi - 1) + "&keyword=${keyword}&option=${option}'> < </a>");
                     }
                     for(let i = startNavi; i <= endNavi; i++){
//                         $(".pagination").append("<a href='/search.qboard?cpage=" + i + "&keyword=${keyword}&option=${option}'>" + i + "</a> ");
                         $(".pagination").append("<a href='/search.qboard?cpage=" + i + "&keyword=${keyword}&option=${option}'"+ (i== cpage ?"class='active'":"")+">" + i + "</a> ");

                     }
                     if(needNext == true){
                         $(".pagination").append("<a href='/search.qboard?cpage=" + (endNavi + 1) + "&keyword=${keyword}&option=${option}'> > </a>");
                     }
                }else{
                    
                      if(needPrev == true){
                            $(".pagination").append("<a href='/list.qboard?cpage=" + (startNavi - 1) + "'> < </a>");
                        }
                        for(let i = startNavi; i <= endNavi; i++){
                            $(".pagination").append("<a href='/list.qboard?cpage=" + i + "'"+(i==cpage?"class='active'":"")+ ">" + i + "</a> ");
                        }
                        if(needNext == true){
                            $(".pagination").append("<a href='/list.qboard?cpage=" + (endNavi + 1) + "'> > </a>");
                        }
                }
                    
                
              
      
            
                
                
            
                
            
    
        <c:choose>
            <c:when test="${loginID != null}">
                $(".write-button").on("click", function() {
                    location.href = "/qboard/qwritepage.jsp";
                });    
            </c:when>
            <c:otherwise>
                $(".write-button").on("click", function() {
                    alert("로그인이 필요합니다.");
                    location.href = "/index.jsp";
                });	
            </c:otherwise>
        </c:choose>
            
          
         
        
         
            
           
            
        })
        </script>

</body>

</html>