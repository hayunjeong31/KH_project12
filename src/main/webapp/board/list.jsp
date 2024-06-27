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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/galmuri/dist/galmuri.css">
 
<link rel="stylesheet" href="css/header_styles.css"> <!-- Linking external CSS file -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body,
        html {
            height: 100%;

            background-image: url('image/5033917.jpg');
        }

        body {
            font-family: "GalmuriMono9", monospace;
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
            font-family: "GalmuriMono9", monospace;
            /* This might need adjustment based on your layout */
        }
        .new-button:hover{
        	background-color:  rgba(103, 103, 250, 0.733);
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
            font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
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

        .board-buttons {
            display: flex;
            
            justify-content: space-around;
            width: 100%;
            max-width: 800px;
            font-family: "GalmuriMono9", monospace;
        }

        .board-buttons .write-button,
        .board-buttons .home-button {
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

        .board-buttons .write-button:hover,
        .board-buttons .home-button:hover {
           /* background-color:  rgba(103, 103, 250, 0.733); */
             background-color: rgba(237, 175, 18, 0.973);
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
        
       
        
         .pagination {
        	margin-top:3%;
            margin-bottom: 20px;
        }
        .pagination a{
        	text-decoration: none;
        	margin: 0 5px;
            padding: 5px 10px;
            border: 1px solid #ddd;
            background-color: rgba(255, 255, 255, 0.855);
            cursor: pointer;
            color: black;
            text-align:center;
        }
        .pagination a.active{
        	font-weight: bold;
        	color: rgb(237, 98, 237);
        }
        .pagination a:hover{
        	 background-color: rgba(231, 231, 232, 0.004);
            color: white;
            font-weight: bold;
           
        }
        
        /* 리셋 버튼 */
       .list-button {
		    background: none;
		    border: none;
		    cursor: pointer;
		    padding: 0;
		}
		
       .list-button i {
		    color: rgba(255, 255, 255, 0.854); /*흰색 리셋 아이콘*/
		     font-size: 1.5em;
		    font-weight:bold;
		    transition: color 0.3s;
		   
		}
		
		.list-button i:hover {
		    color: rgba(237, 175, 18, 0.973);
		    transform: scale(1.1);
		    border: none;
		}
		
		/* 제목 부분 */
		.board-table .title_max {
			white-space: nowrap !important;
	        overflow: hidden !important;
	        text-overflow: ellipsis !important;
	       	max-width: 300px !important; /* 적절한 너비로 설정 */
	       	padding: 0 30px !important;
	       	margin-left: 20px;
	       	text-align: left;
	       	float: left;
	       	
		}
		.title_replycount{
			float:left;
			
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
            background-color: #fff;
            font-size: 14px;
            color: #333;
            outline: none;
            transition: border-color 0.3s;
            font-family: "GalmuriMono9", monospace;
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
            font-size: 14px;
            width: 200px;
            outline: none;
            transition: border-color 0.3s;
            font-family: "GalmuriMono9", monospace;
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
             background-color: rgba(237, 175, 18, 0.973); /*주황색*/
          /*   background-color: rgb(48, 48, 199);
           background-color: #7829d3;
            background-color: rgb(64, 64, 116);*/
            color: white;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-family: "GalmuriMono9", monospace;
            transition: box-shadow 0.3s ease-in-out;
        }

        #searchBtn:hover {
        	box-shadow: 0 0 10px 3px rgba(255, 255, 255, 0.8);
             background-color: rgba(237, 175, 18, 0.973);
        }

        
		 /* 검색어 표시 영역 스타일링 */
        .search-info {
            padding: 5px;
            border-radius: 4px;
            margin: 10px 30px;
            font-size: 15px;
            color: rgb(255, 255, 255);
            background-color: #36333a56;
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
    <title>게시판</title>
</head>

<body>
    <header>
        <div class="header-container">
        <a href="/index.jsp">
            <img src="image/GamebitLogo.png" alt="Nintendo Logo" class="logo"></a>
            <nav>
                <ul>
                    <li>
                        <a href="/index.jsp">홈</a>
                        <div class="dropdown"></div>
                    </li>
                    <li>
                        <a href="#">게임</a>
                        <div class="dropdown">
                            <a href="/games/win.jsp">명예의 전당</a>
                            
                            <a href="#">즐겨찾기</a>
                            
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
                        <a href="/showMain.dashBoard">관리자 페이지</a>
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
        <section class="board-section">
            <article class="board-left">
                <h1>자유게시판</h1>
                <div class="wc_message"></div>
            </article>
            <article class="board-area">
                <div class="top-right-button">
                    <button type="button" class="new-button"> 북마크 </button>
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
		                                    <td>    
		                                    	<div class="title_max">
		                                       		<a href="/detail.board?seq=${dto.seq}">${dto.title}</a>
		                                    	</div>
		                                       	<span class="title_replycount">(${dto.replyCount})</span>
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
    	let loginID = "${loginID}";
    	
    	$(".new-button").on("click",function(){
    		if(!loginID){
    			alert("로그인이 필요합니다.");
    			return;
    		}
    		location.href="/bookmark.bookmark";
    	})
    	
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
	                   location.href = "/list.board";
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



