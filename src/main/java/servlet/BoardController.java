package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import commons.BoardConfig;
import dao.BoardDAO;
import dao.FilesDAO;
import dao.ReplyDAO;
import dto.BoardDTO;
import dto.FilesDTO;
import dto.QBoardDTO;
import dto.ReplyDTO;

@WebServlet("*.board")
public class BoardController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String cmd = request.getRequestURI();
		System.out.println(cmd);
		BoardDAO dao = BoardDAO.getInstance();
		ReplyDAO c_dao = ReplyDAO.getInstance();
		FilesDAO f_dao = FilesDAO.getInstance();
		Gson g = new Gson();

		try {
			if(cmd.equals("/list.board")) {
				String writer = (String)request.getSession().getAttribute("loginID");

				String pcpage = request.getParameter("cpage");
				if(pcpage == null) {pcpage ="1";}
				
				int cpage = Integer.parseInt(pcpage);

				List<BoardDTO> list = dao.selectNtoM(
					cpage*BoardConfig.RECORD_COUNT_PER_PAGE-(BoardConfig.RECORD_COUNT_PER_PAGE -1),
					cpage*BoardConfig.RECORD_COUNT_PER_PAGE);
				
				request.setAttribute("list", list); // 현재내가 해당하는 게시글 목록만 가져오는거임.
				request.setAttribute("cpage", cpage);
				request.setAttribute("record_count_per_page",BoardConfig.RECORD_COUNT_PER_PAGE );
				request.setAttribute("navi_count_per_page", BoardConfig.NAVI_COUNT_PER_PAGE);
				request.setAttribute("record_total_count", dao.getRecordCount());
				request.setAttribute("isSearch", 0);
				
				request.getRequestDispatcher("/board/list.jsp").forward(request, response);
				
			}
			else if(cmd.equals("/search.board")) {
			    request.getSession().getAttribute("loginID");
			    int adminKey = (Integer)request.getSession().getAttribute("adminKey");
			    String pcpage = request.getParameter("cpage");
			    if(pcpage == null) {pcpage ="1";}
			    int cpage = Integer.parseInt(pcpage);

			    String keyword = request.getParameter("keyword");
			    System.out.println(keyword);
			    String option = request.getParameter("option");
			    List<BoardDTO> list = dao.searchPosts(keyword, option, 
			            cpage * BoardConfig.RECORD_COUNT_PER_PAGE - (BoardConfig.RECORD_COUNT_PER_PAGE - 1), 
			            cpage * BoardConfig.RECORD_COUNT_PER_PAGE);
			    
			    request.setAttribute("cpage", cpage);
			    request.setAttribute("record_count_per_page", BoardConfig.RECORD_COUNT_PER_PAGE);
			    request.setAttribute("navi_count_per_page", BoardConfig.NAVI_COUNT_PER_PAGE);
			    request.setAttribute("record_total_count", dao.getSearchRecordCount(keyword,option)); // 검색된 게시글 수 가져오기... 
			    request.setAttribute("adminKey", adminKey);
			    request.setAttribute("list", list);
			    request.setAttribute("isSearch", 1);
			    request.setAttribute("keyword", keyword);
			    request.setAttribute("option", option);
			    request.getRequestDispatcher("/board/list.jsp").forward(request, response);
			    
			    if(list != null) {
			    	response.sendRedirect("/search.board");
			    }
			    
			}	
			
			else if(cmd.equals("/write.board")) {
				String writer = (String)request.getSession().getAttribute("loginID");
				
				int maxSize = 1024 * 1024 *10; 
				String realPath = request.getServletContext().getRealPath("files");
				File uploadPath = new File(realPath);  
				if(!uploadPath.exists()) { 
					uploadPath.mkdir(); 
				}
				
				MultipartRequest multi = new MultipartRequest(request,realPath,maxSize, "UTF8",new DefaultFileRenamePolicy());
				
				String title = multi.getParameter("hidden_title");
				String contents = multi.getParameter("hidden_content");
				int parent_seq = dao.insert(new BoardDTO(0,0,writer,title,contents,null,null,0,0));

				
				Enumeration<String> names = multi.getFileNames();
				while(names.hasMoreElements()) {
					String name = names.nextElement();
					String oriname = multi.getOriginalFileName(name);
					String sysname = multi.getFilesystemName(name);
					int categorySeq =1;
					if(oriname!=null) {
						f_dao.insert(new FilesDTO(0, oriname, sysname, parent_seq,categorySeq));
					}
				}
			
				response.sendRedirect("/list.board");
				
			} 
			
				// 게시글 보기 
			else if(cmd.equals("/detail.board")) {
                String loginID = (String)request.getSession().getAttribute("loginID");
				int seq = Integer.parseInt(request.getParameter("seq"));
				BoardDTO dto = dao.getinfo(seq);
				request.setAttribute("dto", dto);
				request.setAttribute("iswriter", dto.getWriter().equals(loginID));
				
				List<FilesDTO> list = f_dao.selectAll(seq);
				request.setAttribute("list", list);
				
				dao.increaseViewCount(seq); 
				request.getRequestDispatcher("/board/detail.jsp").forward(request, response);
				
			}	
		
			
			// 게시글 수정하기 페이지로 넘어가기.
			else if (cmd.equals("/edit.board")) {
                int seq = Integer.parseInt(request.getParameter("seq"));
                BoardDTO dto = dao.getinfo(seq);
                request.setAttribute("dto", dto);
                request.getRequestDispatcher("/board/edit.jsp").forward(request, response);

            }	// 게시글 수정하기 
			else if (cmd.equals("/update.board")) {
                int seq = Integer.parseInt(request.getParameter("seq"));
                System.out.println("seq: "+seq);
                String title = request.getParameter("title");
                System.out.println(title);
                String contents = request.getParameter("contents");
                System.out.println(contents);
                dao.update(new BoardDTO(seq,0, null, title, contents, null,null,0, 0));
                response.sendRedirect("/detail.board?seq=" +seq);

            }	//게시글 삭제하기 
			else if (cmd.equals("/delete.board")) {
                int seq = Integer.parseInt(request.getParameter("seq"));
                dao.delete(seq);
                response.sendRedirect("/list.board");
            }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
