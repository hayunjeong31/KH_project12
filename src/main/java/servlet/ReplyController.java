package servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
			if(cmd.equals("/comment.reply")) {
				response.setContentType("text/html; charset=UTF-8");
                String loginID = (String)request.getSession().getAttribute("loginID");
                String comments = request.getParameter("comments");
                int parent_seq = Integer.parseInt(request.getParameter("seq"));
                
               
                
                int success = dao.insertComment(new ReplyDTO(0,parent_seq,0,comments, null,loginID));
                String result = g.toJson(success);
				PrintWriter pw = response.getWriter();
				pw.append(result);
                
				
			} 
			else if (cmd.equals("/delete.reply")) {
				int c_seq = Integer.parseInt(request.getParameter("c_seq"));
                System.out.println("c"+c_seq);
               
                int result = dao.replydelete(c_seq); // 게시글 parent_seq 받아와야함. 
                System.out.println(result);
                int parent_seq = Integer.parseInt(request.getParameter("c_parent_seq"));
                System.out.println("p"+ parent_seq ); 
                response.sendRedirect("/detail.board?seq=" +parent_seq);
            }
			else if(cmd.equals("/edit.reply")) {
                String loginID = (String)request.getSession().getAttribute("loginID");
                int editSeq = Integer.parseInt(request.getParameter("c_seq"));
				String editContents = request.getParameter("edit_contents");
				int p_seq = Integer.parseInt(request.getParameter("c_parent_seq"));
				int result = dao.replyedit(new ReplyDTO(editSeq,p_seq,0,editContents,null,loginID));
                response.sendRedirect("/detail.board?seq=" +p_seq);

			}
			// 댓글 출력하기 in detail.jsp
	         else if(cmd.equals("/getcomment.reply")) {
	            response.setContentType("text/html; charset=UTF-8");
	            String loginID = (String)request.getSession().getAttribute("loginID");
	            int seq = Integer.parseInt(request.getParameter("seq"));
	            System.out.println("seq확인"+seq);
	            
	            List<ReplyDTO> c_list= dao.getinfo(seq);
	            Map<String,Object> map = new HashMap<String,Object>();
	            
	            map.put("loginID",loginID);
	            map.put("c_list",c_list);
	            
	            String result = g.toJson(map);
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
