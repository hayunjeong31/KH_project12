package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import dao.DashboardDAO;
import dto.BoardDTO;
import dto.MembersDTO;

@WebServlet("*.dashBoard")
public class DashboardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DashboardDAO dao = DashboardDAO.getInstance();
		String cmd = request.getRequestURI();
		HttpSession session = request.getSession(true);

		response.setContentType("application/json; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();

		System.out.println(cmd);
		if (cmd.equals("/showMain.dashBoard")) {
			List<BoardDTO> recentFourPost = dao.getRecentFourPost();
			List<MembersDTO> recentFourUser = dao.getRecentFourUsers();
			try {
				int todaysPost = dao.getTodayPost();
				System.out.println(todaysPost);
				session.setAttribute("todaysPost", todaysPost);

				int todaysUser = dao.getTodayUser();
				System.out.println(todaysUser);
				session.setAttribute("todaysUser", todaysUser);

				int totalPost = dao.getTotalPost();
				System.out.println(totalPost);
				session.setAttribute("totalPost", totalPost);

				int totalPostCount = dao.getTotalPost();
				System.out.println(totalPostCount);
				session.setAttribute("count", totalPostCount);

				int totalUser = dao.getTotalUser();
				System.out.println(totalUser);
				session.setAttribute("totalUser", totalUser);

				session.setAttribute("recentFourUserList", recentFourUser);
				session.setAttribute("recentFourPostList", recentFourPost);
				
				int userSeq = (int)session.getAttribute("userSeq");
				System.out.println(userSeq);
				session.setAttribute("userSeq", userSeq);
				
				
				request.getRequestDispatcher("/dashboard/dashboardIndex.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if (cmd.equals("/showDetail.dashBoard")) {

			List<BoardDTO> allPostList = dao.getAllBoardListAsAdmin();
			List<MembersDTO> allUserList = dao.getAllMembersAsAdmin();

			session.setAttribute("allPostList", allPostList);
			session.setAttribute("allUserList", allUserList);

			request.getRequestDispatcher("/dashboard/dashboardDetail.jsp").forward(request, response);
		} else if (cmd.equals("/showUser.dashBoard")) {
			int adminKey = (int) session.getAttribute("adminKey");
			

			System.out.println("파라미터: " + request.getParameter("userSeq"));
			String originUserSeq = request.getParameter("userSeq");
			session.setAttribute("userSeq", originUserSeq);
			try {
				MembersDTO member = new MembersDTO();
				if (request.getParameter("userSeq") == null) {
					member = dao.getOneUserInfoAsAdmin((int) session.getAttribute("userSeq"));
				} else {
					member = dao.getOneUserInfoAsAdmin(Integer.parseInt((String) request.getParameter("userSeq")));
				}
				List<BoardDTO> board = dao.showAllBoardByUserId(member.getUserId());
				session.setAttribute("memberInfo", member);

				int blackListSeq = dao.getBlackListSeq(member.getUserSeq());
				int postCountPerUser = dao.getAllPostCountPerUser(member.getUserId());
				int replyCountPerUser = dao.getAllReplyCountPerUser(member.getUserId());
				
				String blockedReason = dao.getBlockedReason(blackListSeq);
				
				session.setAttribute("blockedReason", blockedReason);
				session.setAttribute("userId", member.getUserId());
				session.setAttribute("username", member.getUserName());
				session.setAttribute("userSeq", member.getUserSeq());
				session.setAttribute("userAdminKey", member.getAdminKey());
				session.setAttribute("userBoard", board);
				session.setAttribute("adminKey", adminKey);
				session.setAttribute("postCountPerUser", postCountPerUser);
				session.setAttribute("replyCountPerUser", replyCountPerUser);

				request.getRequestDispatcher("/dashboard/dashboardUserEdit.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			//중간관리자 추가 컨트롤러
		} else if (cmd.equals("/addAsAdmin.dashBoard")) {
			int userSeq = Integer.parseInt(request.getParameter("userSeq"));
			System.out.println("userSeq: "+userSeq);
			int updateResult = dao.updateAdminKey(userSeq);
			System.out.println("updateResult: "+updateResult);
			if(updateResult > 0) {
				int result = dao.promotionToAdmin(userSeq, (String) session.getAttribute("username"), (String) session.getAttribute("userId"));
				JSONObject data = new JSONObject();
				data.put("result", result);
				data.put("updateResult", updateResult);
				out.append(data.toString());
			}
			

		} else if (cmd.equals("/addBlackList.dashBoard")) {
			String blockedReason = new String();
			System.out.println("data: " + request.getParameter("reason"));
			System.out.println("userSeq: " + session.getAttribute("userSeq"));
			String userId = (String) session.getAttribute("userId");
			int userSeq = (int) session.getAttribute("userSeq");
			int reasonValue = Integer.parseInt(request.getParameter("reason"));
			switch (reasonValue) {
			case 1:
				blockedReason = "욕설 또는 악의적인 비방";
				break;
			case 2:
				blockedReason = "광고성 계정";
				break;
			case 3:
				blockedReason = "음란성 게시글";
				break;
			}
			try {
				int insertResult = dao.addBlockUser(blockedReason, userSeq, userId);
				System.out.println("블랙리스트 추가 결과" + insertResult);
				if (insertResult > 0) {
					int blacklistSeq = dao.getBlackListSeq(userSeq);
					System.out.println(blacklistSeq);
					int updatedMemberInfoResult = dao.updateBlockedMemberInfo(blacklistSeq, userSeq);
					System.out.println(updatedMemberInfoResult);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if (cmd.equals("/deleteBlackList.dashBoard")) {
			int userSeq = (int) session.getAttribute("userSeq");
			// blacklistSeq 와 userSeq 가 일치해야만 삭제
			try {
				int blacklistSeq = dao.getBlackListSeq(userSeq);
				// member 테이블에서 비활성 상태 삭제함과 동시에 블랙리스트 내부도 삭제
				int unlockResult = dao.unblockBlockedUser(userSeq);
				int deleteBlackList = dao.deleteBlacklist(blacklistSeq, userSeq);
				System.out.println("unlockResult: " + unlockResult + ", deleteBlackResult: " + deleteBlackList);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if (cmd.equals("/updateUser.dashBoard")) {
			String updatedNickName = request.getParameter("updatedNickname");
			String updatedEmail = request.getParameter("updatedEmail");
			String updatedPhone = request.getParameter("updatedPhone");
			int userSeq = Integer.parseInt(request.getParameter("userSeq"));

			// 디버깅: 파라미터 값 출력
			System.out.println("Received Parameters: " + updatedNickName + ", " + updatedEmail + ", " + updatedPhone
					+ ", " + userSeq);

			session.setAttribute("userSeq", userSeq);

			try {
				MembersDTO originMember = dao.getOneUserInfoAsAdmin(userSeq);
				int updateResult = dao.updateUserInfoAsAdmin(userSeq, updatedNickName, updatedEmail, updatedPhone);
				System.out.println("Original Nickname: " + originMember.getNickName());
				System.out.println("Update Result: " + updateResult);

				if (updateResult > 0) {
					System.out.println("Update successful");

					MembersDTO updatedMember = dao.getOneUserInfoAsAdmin(userSeq);
					JSONObject result = new JSONObject();
					result.put("nickname", updatedMember.getNickName());
					result.put("phone", updatedMember.getPhone());
					result.put("email", updatedMember.getEmail());
					out.append(result.toString());
				} else {
					System.out.println("Update failed");
				}
				session.setAttribute("userSeq", userSeq);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
