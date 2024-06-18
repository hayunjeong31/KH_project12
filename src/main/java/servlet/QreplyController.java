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

import dao.QboardDAO;
import dao.QreplyDAO;
import dto.QreplyDTO;


@WebServlet("*.qreply")
public class QreplyController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf8");
		String cmd = request.getRequestURI();
		QreplyDAO dao = QreplyDAO.getInstance();
		QboardDAO b_dao = QboardDAO.getInstance();
		Gson g = new Gson();
		System.out.println(cmd);
		
		try {
			if(cmd.equals("/comment.qreply")) {
				response.setContentType("text/html; charset=UTF-8");
				String loginID = (String)request.getSession().getAttribute("loginID");
                String comments = request.getParameter("comments");
				int seq = Integer.parseInt(request.getParameter("seq"));
				b_dao.updateAnswered(seq);
				int success = dao.insertReply(new QreplyDTO(0,loginID, comments, null, seq));
				String result = g.toJson(success);
				PrintWriter pw = response.getWriter();
				pw.append(result);
			}
			else if(cmd.equals("/getcomment.qreply")) {
				response.setContentType("text/html; charset=UTF-8");
				 String loginID = (String)request.getSession().getAttribute("loginID");
		            int seq = Integer.parseInt(request.getParameter("seq"));
		            System.out.println("seq확인"+seq);
		            
		            List<QreplyDTO> c_list = dao.getReply(seq);
		            
		            Map<String, Object> resultMap = new HashMap<>();
		            resultMap.put("loginID", loginID);
		            resultMap.put("c_list", c_list);

		            String result = g.toJson(resultMap);
		            PrintWriter pw = response.getWriter();
		            pw.append(result);
			}
			else if(cmd.equals("/delete.qreply")) {
				int c_seq = Integer.parseInt(request.getParameter("c_seq"));
                System.out.println("c"+c_seq);
               
                int result = dao.replydelete(c_seq); // 게시글 parent_seq 받아와야함. 
                System.out.println(result);
                int parent_seq = Integer.parseInt(request.getParameter("c_parent_seq"));
                System.out.println("p"+ parent_seq ); 
                response.sendRedirect("/detail.qboard?seq=" +parent_seq);
			}
			else if(cmd.equals("/edit.qreply")) {
				String loginID = (String)request.getSession().getAttribute("loginID");
                int editSeq = Integer.parseInt(request.getParameter("c_seq"));
				String editContents = request.getParameter("edit_contents");
				int p_seq = Integer.parseInt(request.getParameter("c_parent_seq"));
				int result = dao.replyedit(new QreplyDTO(editSeq,loginID,editContents,null,p_seq));
                response.sendRedirect("/detail.qboard?seq=" +p_seq);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
