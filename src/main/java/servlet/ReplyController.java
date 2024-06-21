package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.ReplyDAO;
import dto.ReplyDTO;


@WebServlet("*.reply")
public class ReplyController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String cmd = request.getRequestURI();
		ReplyDAO dao = ReplyDAO.getInstance();
		Gson g = new Gson();
		System.out.println(cmd);
		
		try {
			// 댓글 등록하기
			if(cmd.equals("/comment.reply")) {
				response.setContentType("text/html; charset=UTF-8");
                String loginID = (String)request.getSession().getAttribute("loginID");
                String comments = request.getParameter("comments");
                int board_seq = Integer.parseInt(request.getParameter("seq"));
                int parent_cmt = Integer.parseInt(request.getParameter("parent_cmt"));
               
                //원댓글 등록하기 
//                int success = dao.insertComment(new ReplyDTO(0,board_seq,parent_cmt,comments, null,loginID));
                int success = dao.insertComment(new ReplyDTO(0,board_seq,0,comments, null,loginID));

                String result = g.toJson(success);
				PrintWriter pw = response.getWriter();
				pw.append(result);
                
			} 
			
			// 댓글 답글 등록하기 
			else if(cmd.equals("/replycomment.reply")) {
				response.setContentType("text/html; charset=UTF-8");
                String loginID = (String)request.getSession().getAttribute("loginID");
                String comments = request.getParameter("comments");
                int board_seq = Integer.parseInt(request.getParameter("seq"));
                int parent_cmt = Integer.parseInt(request.getParameter("parent_cmt"));
                
                int success = dao.insertComment(new ReplyDTO(0,board_seq,parent_cmt,comments,null,loginID));
                String result = g.toJson(success);
                PrintWriter pw = response.getWriter();
                pw.append(result);
                
			}
			// 댓글 출력하기 in detail.jsp
	         else if(cmd.equals("/getcomment.reply")) {
	            response.setContentType("text/html; charset=UTF-8");
	            String loginID = (String)request.getSession().getAttribute("loginID");
	            int seq = Integer.parseInt(request.getParameter("seq"));
	            System.out.println("seq확인"+seq);
	            
	            List<ReplyDTO> c_list= dao.getinfo(seq);
	            
	            // 삭제된 댓글 처리
	            List<ReplyDTO> filteredList = new ArrayList<>();
	            for (ReplyDTO comment : c_list) {
	                if (comment.getIsDeleted().equals("n") || dao.getRepliesByParentcmt(comment.getSeq()) > 0) {
	                    filteredList.add(comment);
	                }
	            }

	            Map<String, Object> map = new HashMap<>();
	            map.put("loginID", loginID);
	            map.put("c_list", filteredList);

	            String result = g.toJson(map);
	            PrintWriter pw = response.getWriter();
	            pw.append(result);
	         }
			
			// 댓글 삭제하기 
			else if (cmd.equals("/delete.reply")) {
				response.setContentType("text/html; charset=UTF-8");
				int c_seq = Integer.parseInt(request.getParameter("seq"));
               
				
				 int success = dao.replydelete(c_seq);    // 해당 댓글 isDeleted 값 y로 변경
		            int replies = dao.getRepliesByParentcmt(c_seq); // 답글 개수 받기

		            String result = g.toJson(success);
		            PrintWriter pw = response.getWriter();
		            pw.append(result);
						
					
	
                
            }
			// 댓글 수정하기
			else if(cmd.equals("/edit.reply")) {
				response.setContentType("text/html; charset=UTF-8");
                String loginID = (String)request.getSession().getAttribute("loginID");
                int editSeq = Integer.parseInt(request.getParameter("seq"));
				String editContents = request.getParameter("comments");
				int success = dao.replyedit(new ReplyDTO(editSeq,0,0,editContents,null,loginID));
               
				String result = g.toJson(success);
	            PrintWriter pw = response.getWriter();
	            pw.append(result);

			}
			
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
