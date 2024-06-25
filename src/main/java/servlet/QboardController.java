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
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import commons.BoardConfig;
import commons.EncryptionUtils;
import dao.FilesDAO;
import dao.QBoardDAO;
import dao.QreplyDAO;
import dto.FilesDTO;
import dto.QBoardDTO;

@WebServlet("*.qboard")
public class QboardController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String cmd = request.getRequestURI();
		QBoardDAO dao = QBoardDAO.getInstance();
		QreplyDAO r_dao = QreplyDAO.getInstance();
		FilesDAO f_dao = FilesDAO.getInstance();
		Gson g = new Gson();
		System.out.println("사용자 요청: " + cmd);;
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String writer = (String)session.getAttribute("loginID");

		try {
			if(cmd.equals("/list.qboard")) {
				request.getSession().getAttribute("loginID");
				int adminKey = (Integer)request.getSession().getAttribute("adminKey");
				String pcpage = request.getParameter("cpage");
				System.out.println("pcpage"+ pcpage);
				if(pcpage == null) {pcpage ="1";}
				int cpage = Integer.parseInt(pcpage);
				System.out.println("cpage "+ cpage);
				
	
				List<QBoardDTO> list = dao.selectNtoM(
						cpage*BoardConfig.RECORD_COUNT_PER_PAGE-(BoardConfig.RECORD_COUNT_PER_PAGE -1),
						cpage*BoardConfig.RECORD_COUNT_PER_PAGE);
				
				request.setAttribute("adminKey", adminKey);
				request.setAttribute("list", list); // 현재내가 해당하는 게시글 목록만 가져오는거임.
				request.setAttribute("cpage", cpage);
				request.setAttribute("record_count_per_page",BoardConfig.RECORD_COUNT_PER_PAGE );
				request.setAttribute("navi_count_per_page", BoardConfig.NAVI_COUNT_PER_PAGE);
				request.setAttribute("record_total_count", dao.getRecordCount());
				 request.setAttribute("isSearch", 0);
				 
				request.getRequestDispatcher("/qboard/qnalist.jsp").forward(request, response);

			}
			else if(cmd.equals("/search.qboard")) {
			    request.getSession().getAttribute("loginID");
			    int adminKey = (Integer)request.getSession().getAttribute("adminKey");
			    String pcpage = request.getParameter("cpage");
			    if(pcpage == null) {pcpage ="1";}
			    int cpage = Integer.parseInt(pcpage);

			    String keyword = request.getParameter("keyword");
			    System.out.println(keyword);
			    String option = request.getParameter("option");
			    List<QBoardDTO> list = dao.searchPosts(keyword, option, 
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
			    request.getRequestDispatcher("/qboard/qnalist.jsp").forward(request, response);
			    
			    if(list != null) {
			    	response.sendRedirect("/search.qboard");
			    }
			    
			}	
		
			
			else if(cmd.equals("/write.qboard")) {

				int maxSize = 1024 * 1024 *10; 
				String realPath = request.getServletContext().getRealPath("files");
				File uploadPath = new File(realPath);  
				if(!uploadPath.exists()) { 
					uploadPath.mkdir(); 
				}

				MultipartRequest multi = new MultipartRequest(request,realPath,maxSize, "UTF8",new DefaultFileRenamePolicy());

				String title = multi.getParameter("hidden_title");
				String content = multi.getParameter("hidden_content");
				String password_orgin = multi.getParameter("hidden_password");
				
				String password = null;
				if(password_orgin != null && !password_orgin.isEmpty()) {
					password = EncryptionUtils.getSHA512(password_orgin);
				}
				
				int parent_seq = dao.insert(new QBoardDTO(0,0,writer,title,content,null,null,0,password, null,0));

				Enumeration<String> names = multi.getFileNames();
				while(names.hasMoreElements()) {
					int categorySeq = 2;
					String name = names.nextElement();
					String oriname = multi.getOriginalFileName(name);
					String sysname = multi.getFilesystemName(name);
					if(oriname!=null) {
						f_dao.insert(new FilesDTO(0, oriname, sysname, parent_seq,categorySeq));
					}
				}

				response.sendRedirect("/list.qboard");

			} 
			
			// 비밀글 비번 입력해서 일치확인하기
			else if(cmd.equals("/comparePwd.qboard")) {
				response.setContentType("text/html; charset=UTF-8");
				int seq = Integer.parseInt(request.getParameter("seq"));
				String inputPassword = request.getParameter("password");
				String password = EncryptionUtils.getSHA512(inputPassword);
				
				int correct = dao.comparePassword(seq,password);
				String result = g.toJson(correct);
				PrintWriter pw = response.getWriter();
				pw.append(result);
			}

			// 게시글 보기 
			else if(cmd.equals("/detail.qboard")) {
				String loginID = (String)request.getSession().getAttribute("loginID");
				int adminKey = (Integer)request.getSession().getAttribute("adminKey");

				int seq = Integer.parseInt(request.getParameter("seq"));
				
				QBoardDTO dto = dao.getinfo(seq);
				int count = r_dao.getreplycount(seq); // 댓글 갯수 가져오기. 
				
				request.setAttribute("count", count);
				request.setAttribute("adminKey", adminKey);
				request.setAttribute("dto", dto);
				request.setAttribute("iswriter", dto.getWriter().equals(loginID));

				List<FilesDTO> list = f_dao.selectAll(seq,2);
				request.setAttribute("list", list);

				dao.increaseViewCount(seq); 
				request.getRequestDispatcher("/qboard/qdetail.jsp").forward(request, response);

			}	

			
			// 게시글 수정하기 페이지로 넘어가기.
			else if (cmd.equals("/edit.qboard")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				QBoardDTO dto = dao.getinfo(seq);
				List<FilesDTO> list = f_dao.selectAll(seq,2);
				request.setAttribute("list", list);
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("/qboard/qedit.jsp").forward(request, response);

			}	// 게시글 수정하기 
			else if (cmd.equals("/update.qboard")) {
				
				/////////////////////////////////////////////////
				int maxSize = 1024 * 1024 *10; 
				String realPath = request.getServletContext().getRealPath("files");
				File uploadPath = new File(realPath);  
				if(!uploadPath.exists()) { 
					uploadPath.mkdir(); 
				}

				MultipartRequest multi = new MultipartRequest(request,realPath,maxSize, "UTF8",new DefaultFileRenamePolicy());
				String title = multi.getParameter("post-title");
				String contents = multi.getParameter("contents");
				
				
				int parent_seq = Integer.parseInt(multi.getParameter("post-seq"));
				dao.update(new QBoardDTO(parent_seq,0, null, title, contents, null, null,0,null,null,0));
				
				// 숨긴 파일 정보 받아서 삭제하기 .
				String deletedFiles = multi.getParameter("deletedFilesInput"); // multi로 parameter받아와야함.! no 실수 !! 
				System.out.println("Deleted Files Input: " + deletedFiles);
				if(deletedFiles !=null && !deletedFiles.isEmpty()) {
					String[] filesToDelete = deletedFiles.split(",");
					for (String filename : filesToDelete) {
                        f_dao.deleteBySysname(filename, 2); // categorySeq가 2인 파일 삭제
                        new File(realPath+"/"+filename).delete();
                        // 파일은 서버의 영향을 안받는 경우가 있어 제대로 삭제가 안되는 경우가 있다 .그럴 경우 다시 삭제를 할 수 있도록 logic 구현을 해주면 좋다! <강사님 曰>
                    }
				}
				

				Enumeration<String> names = multi.getFileNames();
				while(names.hasMoreElements()) {
					String name = names.nextElement();
					String oriname = multi.getOriginalFileName(name);
					String sysname = multi.getFilesystemName(name);
					int categorySeq = 2;
					System.out.println("sysname"+sysname);
					if(oriname!=null) {
						f_dao.insert(new FilesDTO(0, oriname, sysname, parent_seq,categorySeq));
					}
				}
				
				List<FilesDTO> updatedFileList  = f_dao.selectAll(parent_seq,2);
				request.setAttribute("list", updatedFileList);
				
				response.sendRedirect("/detail.qboard?seq=" +parent_seq);
				
			}
			//게시글 삭제하기 
			else if (cmd.equals("/delete.qboard")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				dao.delete(seq);
				response.sendRedirect("/list.qboard");
			}
			
			// 원희 Controller
			// 내가 작성한 게시물 출력
			if(cmd.equals("/myqpostlist.qboard")) {
				
				String pcpage = request.getParameter("cpage");
				if(pcpage == null) {
					pcpage = "1";
				}
				int cpage = Integer.parseInt(pcpage);

				
				List<QBoardDTO> list = dao.selectByWriter(
						writer, cpage * BoardConfig.RECORD_COUNT_PER_PAGE - (BoardConfig.RECORD_COUNT_PER_PAGE - 1),
						cpage * BoardConfig.RECORD_COUNT_PER_PAGE);
								
				request.setAttribute("list", list);
				request.setAttribute("cpage", cpage);
				request.setAttribute("record_count_per_page", BoardConfig.RECORD_COUNT_PER_PAGE);
				request.setAttribute("navi_count_per_page", BoardConfig.NAVI_COUNT_PER_PAGE);
				request.setAttribute("record_total_count", dao.getRecordCountByWriter(writer));

				
				request.getRequestDispatcher("/qboard/myqpost.jsp").forward(request, response);
			}
			// 게시글 보기 
						else if(cmd.equals("/myqdetail.qboard")) {
							String loginID = (String)request.getSession().getAttribute("loginID");
							int adminKey = (Integer)request.getSession().getAttribute("adminKey");

							int seq = Integer.parseInt(request.getParameter("seq"));
							
							QBoardDTO dto = dao.getinfo(seq);
							int count = r_dao.getreplycount(seq); // 댓글 갯수 가져오기. 
							
							request.setAttribute("count", count);
							request.setAttribute("adminKey", adminKey);
							request.setAttribute("dto", dto);
							request.setAttribute("iswriter", dto.getWriter().equals(loginID));

							List<FilesDTO> list = f_dao.selectAll(seq,2);
							request.setAttribute("list", list);

							dao.increaseViewCount(seq); 
							request.getRequestDispatcher("/qboard/myqdetail.jsp").forward(request, response);

						}
			// 비밀글 비번 입력해서 일치확인하기
						else if(cmd.equals("/mycomparePwd.qboard")) {
							response.setContentType("text/html; charset=UTF-8");
							int seq = Integer.parseInt(request.getParameter("seq"));
							String inputPassword = request.getParameter("password");
							String password = EncryptionUtils.getSHA512(inputPassword);
							
							int correct = dao.comparePassword(seq,password);
							String result = g.toJson(correct);
							PrintWriter pw = response.getWriter();
							pw.append(result);
						} 
						
						//게시글 삭제하기 
						else if (cmd.equals("/mydelete.qboard")) {
							int seq = Integer.parseInt(request.getParameter("seq"));
							dao.delete(seq);
							response.sendRedirect("/myqpostlist.qboard");
						}

						// 게시글 수정하기 페이지로 넘어가기.
						else if (cmd.equals("/myedit.qboard")) {
							int seq = Integer.parseInt(request.getParameter("seq"));
							QBoardDTO dto = dao.getinfo(seq);
							List<FilesDTO> list = f_dao.selectAll(seq,2);
							request.setAttribute("list", list);
							
							request.setAttribute("dto", dto);
							request.getRequestDispatcher("/qboard/myqedit.jsp").forward(request, response);

						}	// 게시글 수정하기 
						else if (cmd.equals("/myupdate.qboard")) {
							
							/////////////////////////////////////////////////
							int maxSize = 1024 * 1024 *10; 
							String realPath = request.getServletContext().getRealPath("files");
							File uploadPath = new File(realPath);  
							if(!uploadPath.exists()) { 
								uploadPath.mkdir(); 
							}

							MultipartRequest multi = new MultipartRequest(request,realPath,maxSize, "UTF8",new DefaultFileRenamePolicy());

							String title = multi.getParameter("post-title");
							String contents = multi.getParameter("contents");
							
							
							int parent_seq = Integer.parseInt(multi.getParameter("post-seq"));
							dao.update(new QBoardDTO(parent_seq,0, null, title, contents, null, null,0,null,null,0));
							List<FilesDTO> list = f_dao.selectAll(parent_seq,2);
							request.setAttribute("list", list);

							Enumeration<String> names = multi.getFileNames();
							while(names.hasMoreElements()) {
								String name = names.nextElement();
								String oriname = multi.getOriginalFileName(name);
								String sysname = multi.getFilesystemName(name);
								int categorySeq = 2;
								if(oriname!=null) {
									f_dao.insert(new FilesDTO(0, oriname, sysname, parent_seq,categorySeq));
								}
							}
							response.sendRedirect("/myqdetail.qboard?seq=" +parent_seq);
							
						}
			

		}catch(Exception e) {
			e.printStackTrace();
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
