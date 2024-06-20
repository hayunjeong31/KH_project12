package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import dao.DashboardDAO;
import dto.FreeBoardDTO;
import dto.MembersDTO;

@WebServlet("*.dashBoard")
public class DashboardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DashboardDAO dao = DashboardDAO.getInstance();

		String cmd = request.getRequestURI();
		HttpSession session = request.getSession(true);
		System.out.println(cmd);
		if (cmd.equals("/showAll.dashBoard")) {
			List<FreeBoardDTO> boardList = dao.getAllBoardListAsAdmin();
			List<MembersDTO> memberList = dao.selectAllMembersAsAdmin();
			List<Integer> ageList = dao.getAllAgeFromUsers();
			List<Integer> subStringAgeList = new ArrayList<>();
			List<String> genderList = dao.getAllGenderFromUser();
			for(Integer age: ageList) {
				Integer subStrAge =Integer.parseInt(age.toString().substring(0,4));
				subStringAgeList.add(subStrAge);
			}
			session.setAttribute("memberList", memberList);
			session.setAttribute("boardList", boardList);
			session.setAttribute("ageList", subStringAgeList);
			session.setAttribute("genderList", genderList);
		}

		request.getRequestDispatcher("/dashboard/dashboardIndex.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
