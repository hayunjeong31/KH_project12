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
import com.google.gson.GsonBuilder;

import dao.ReplyDAO;
import dto.ReplyDTO;


@WebServlet("*.reply")
public class ReplyController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String cmd = request.getRequestURI();
		ReplyDAO dao = ReplyDAO.getInstance();
		
		Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create(); // 원하는 날짜 포맷 설정
		
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
	            int board_seq = Integer.parseInt(request.getParameter("seq"));
	            System.out.println("seq확인"+board_seq);
	            
	            List<ReplyDTO> c_list= dao.getinfo(board_seq);
	            
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
			///////////////////////////////////////////
			// 좋아요 클릭하기. 
			else if(cmd.equals("/like.reply")) {
				String userId = (String)request.getSession().getAttribute("loginID");
				int replySeq = Integer.parseInt(request.getParameter("replySeq"));
                boolean isLiked = Boolean.parseBoolean(request.getParameter("isLiked"));
                boolean isHated = Boolean.parseBoolean(request.getParameter("isHated"));
                boolean result;
                int result2;
                boolean result3;
                int result4=0;
                if (isLiked) {
                    result = dao.addLike(userId,replySeq);
                    result2 = dao.getCountLikes(replySeq);
                    result3 = dao.checkLike(userId, replySeq);
                    // 싫어요 버튼이 눌려져 있으면 해제
                    if (isHated) {
                    	dao.removeHate(userId, replySeq);
                    	result4 = dao.getCountHates(replySeq);
                    }
                } else {
                    result = dao.removeLike(userId, replySeq);
                    result2 = dao.getCountLikes(replySeq);
                    result3 = dao.checkLike(userId, replySeq);
                }
                Map<String, Object> map = new HashMap<>();
	            map.put("result", result);
	            map.put("result2", result2);
	            map.put("result3", result3);
	            map.put("result4", result4);

	            String success = g.toJson(map);
               

	           // String result = g.toJson(result1);
                //String success = g.toJson(result);
				PrintWriter pw = response.getWriter();
				pw.append(success);
                
                pw.close();

			}
			// 싫어요 클릭하기
			else if(cmd.equals("/hate.reply")) {
				String userId = (String)request.getSession().getAttribute("loginID");
				int replySeq = Integer.parseInt(request.getParameter("replySeq"));
				boolean isLiked = Boolean.parseBoolean(request.getParameter("isLiked"));
                boolean isHated = Boolean.parseBoolean(request.getParameter("isHated"));
                boolean result;
                int result2=0;
                boolean result3=false;
                int result4=0;
                if (isHated) {
                    result = dao.addHate(userId,replySeq);
                    result2= dao.getCountHates(replySeq);
                    result3 = dao.checkHate(userId, replySeq);
                    // 좋아요 버튼이 눌려져 있으면 해제
                    if (isLiked) {
                    	dao.removeLike(userId, replySeq);
                    	result4= dao.getCountLikes(replySeq);
                    }
                } else {
                    result = dao.removeHate(userId, replySeq);
                    result2= dao.getCountHates(replySeq);
                    result3 = dao.checkHate(userId, replySeq);
                }
                Map<String, Object> map = new HashMap<>();
	            map.put("result", result);
	            map.put("result2", result2);
	            map.put("result3", result3);
	            map.put("result4", result4);

	            String success = g.toJson(map);
               // String success = g.toJson(result);
				PrintWriter pw = response.getWriter();
				pw.append(success);
                
                pw.close();
				
			}
			
			// 좋아요 상태 가져오기 
			else if(cmd.equals("/getLikesStatus.reply")) {
				String userId = (String) request.getSession().getAttribute("loginID");
                int replySeq = Integer.parseInt(request.getParameter("replySeq"));
                
                boolean result = dao.checkLike(userId,replySeq);
                int result2 = dao.getCountLikes(replySeq);
                
                Map<String, Object> map = new HashMap<>();
	            map.put("result", result);
	            map.put("result2", result2);

	            String success = g.toJson(map);
                
                // String success = g.toJson(result);
				PrintWriter pw = response.getWriter();
				pw.append(success);
                
                pw.close();
			}
			// 싫어요 상태 가져오기
			else if(cmd.equals("/getHatesStatus.reply")) {
				String userId = (String) request.getSession().getAttribute("loginID");
                int replySeq = Integer.parseInt(request.getParameter("replySeq"));
                
                boolean result = dao.checkHate(userId,replySeq);
                int result2 = dao.getCountHates(replySeq);
                
                Map<String,Object> map = new HashMap<>();
                map.put("result",result);
                map.put("result2", result2);
                
                String success = g.toJson(map);
				PrintWriter pw = response.getWriter();
				pw.append(success);
                
                pw.close();
			}

		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
