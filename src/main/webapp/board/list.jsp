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
            background-image: url('${pageContext.request.contextPath}/image/5033917.jpg');
            
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
            background-image: url('${pageContext.request.contextPath}/image/5033917.jpg');

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
        
          .list-button {
		    background: none;
		    border: none;
		    cursor: pointer;
		    padding: 0;
		}
		
		.list-button i {
		    font-size: 1.5em;
		    font-weight:bold;
		    color: violet;
		}
		
		.board-table .title_max {
			white-space: nowrap !important;
	        overflow: hidden !important;
	        text-overflow: ellipsis !important;
	        max-width: 300px !important; /* 적절한 너비로 설정 */
	       	padding: 0 30px !important;
	       	text-align: left;
		}
		
		.title_max a{
			white-space: nowrap !important;
	        overflow: hidden !important;
	        text-overflow: ellipsis !important;
	        max-width: 300px !important; /* 적절한 너비로 설정 */
	       	padding: 0 30px !important;
		}
		
		 
       	/* 검색 폼 스타일링 */
        form {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        #searchOption {
            width: 150px;
            padding: 6px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #fff;
            font-size: 14px;
            color: #333;
            outline: none;
            transition: border-color 0.3s;
        }
        
        #searchOption:hover {
            border-color: #888;
        }
        
        #searchOption:focus {
            border-color: #555;
        }

        #searchInput {
            padding: 6px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            width: 200px;
            outline: none;
            transition: border-color 0.3s;
        }

        #searchInput:hover {
            border-color: #888;
        }

        #searchInput:focus {
            border-color: #555;
        }

        #searchBtn {
            padding: 6px 10px;
            border: none;
            border-radius: 4px;
            background-color: #7829d3;
            color: white;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        #searchBtn:hover {
            background-color: #0056b3;
        }

        .list-button {
            padding: 0;
            border: none;
            background: none;
            cursor: pointer;
        }

       .list-button i {
		    color: #d765f3;
		    font-size: 20px;
		    transition: color 0.3s;
		}
		
		.list-button i:hover {
		    color: #ac16c0;
		    transform: scale(1.1);
            box-shadow: 0 0 8px rgba(0, 86, 179, 0.6);
		}

        /* 검색어 표시 영역 스타일링 */
        .search-info {
            padding: 5px;
            border-radius: 4px;
            margin: 10px 30px;
            font-size: 15px;
            color: #fff;
            background-color: #36333a56;
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
                <h1>자유게시판</h1>
                <div class="wc_message"></div>
            </article>
            <article class="board-area">
                <div class="top-right-button">
                    <button class="new-button" onclick="location.href='bookmark.html'"> 북마크 </button>
                </div>
                <h2></h2>
                  
				    
                <table class="board-table">
               
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>글쓴이</th>
                            <th>등록일</th>
                            <th>조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<!--  "${list}" 없으면 '검색결과없음' 뜨게 하기 -->
                    	 <c:choose>
		                        <c:when test="${empty list}">
		                            <tr>
		                                <td colspan="6" style="text-align:center;">'${keyword}'에 대한 검색 결과 없음</td>
		                            </tr>
		                        </c:when>
		                        <c:otherwise>
		                            <c:forEach var="dto" items="${list}">
		                                <tr>
		                                    <td>${dto.seq}</td>
		                                    <td class="title_max">    
		                                       <a href="/detail.board?seq=${dto.seq}">${dto.title}</a>
		                                    </td>
		                                    <td>${dto.writer}</td>
		                                    <c:choose>
		                                        <c:when test="${dto.upd_date != null}">
		                                            <td><fmt:formatDate value="${dto.upd_date}" pattern="yyyy.MM.dd" /></td>
		                                            <td>${dto.view_count}</td>
		                                        </c:when>
		                                        <c:otherwise>
		                                            <td><fmt:formatDate value="${dto.write_date}" pattern="yyyy.MM.dd" /></td>
		                                            <td>${dto.view_count}</td>
		                                        </c:otherwise>
		                                    </c:choose>
		                                </tr>
		                            </c:forEach>
		                        </c:otherwise>
		                    </c:choose>
                    </tbody>
                </table>
                
               <!-- 검색 폼 -->
			    <div class="search-container">
			        <form action="/search.board?">
			            <select name="option" id="searchOption">
			                <option value="title">제목</option>
			                <option value="writer">작성자</option>
			                <option value="title_writer">제목+작성자</option>
			            </select>
			            <input type="text" name="keyword" id="searchInput" placeholder="검색어를 입력하세요" required>
			            <button type="submit" id="searchBtn">검색</button>
			            <button type="button" class="list-button" onclick="location.href='/list.board'"><i class="fa-solid fa-rotate-left"></i></button>
			        </form>
			    </div>
                <!-- 검색어 표시 영역 -->
			    <c:if test="${not empty keyword}">
			        <div class="search-info">
			            "<c:choose>
			                <c:when test="${option == 'title'}">제목</c:when>
			                <c:when test="${option == 'writer'}">작성자</c:when>
			                <c:otherwise>제목+작성자</c:otherwise>
			            </c:choose>
			            : ${keyword} " 검색 결과
			        </div>
			    </c:if>
    
                <div class="pagination">
                    
                </div>
                <div class="board-buttons">
                    <button class="write-button" id="btnwrite">글쓰기</button>
                    <button class="home-button" id="btnhome" onclick="location.href='/index.jsp'">홈으로</button>
                </div>
            </article>
        </section>
    </main>
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
	 	        //$(".pagination").append("<a href='/search.board?cpage=" + i + "&keyword=${keyword}&option=${option}'>" + i + "</a> ");
                $(".pagination").append("<a href='/search.qboard?cpage=" + i + "&keyword=${keyword}&option=${option}'"+ (i== cpage ?"class='active'":"")+">" + i + "</a> ");

	 	    }
	 	    if(needNext == true){
	 	        $(".pagination").append("<a href='/search.board?cpage=" + (endNavi + 1) + "&keyword=${keyword}&option=${option}'> > </a>");
	 	    }
	    }else{
	    	
	    	  if(needPrev == true){
	    	        $(".pagination").append("<a href='/list.board?cpage=" + (startNavi - 1) + "'> < </a>");
	    	    }
	    	    for(let i = startNavi; i <= endNavi; i++){
	    	    //    $(".pagination").append("<a href='/list.board?cpage=" + i + "'>" + i + "</a> ");
                    $(".pagination").append("<a href='/list.board?cpage=" + i + "'"+(i==cpage?"class='active'":"")+ ">" + i + "</a> ");

	    	    }
	    	    if(needNext == true){
	    	        $(".pagination").append("<a href='/list.board?cpage=" + (endNavi + 1) + "'> > </a>");
	    	    }
	    }
	    	
    });	
    	
    </script>
</body>
</html>



