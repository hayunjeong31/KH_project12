package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import commons.BoardConfig;
import dao.QBoardDAO;
import dto.QBoardDTO;


@WebServlet("*.qboard")
public class QBoardController extends HttpServlet {




	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String cmd = request.getRequestURI();
		System.out.println("사용자 요청: " + cmd);
		QBoardDAO dao = QBoardDAO.getInstance();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String writer = (String)session.getAttribute("loginID");
		
		// 내가 작성한 게시물 출력
				try {
					
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

						
						request.getRequestDispatcher("/board/myqpost.jsp").forward(request, response);
					}
					
					

				}catch(Exception e) {
					e.printStackTrace();
				}
			}	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
