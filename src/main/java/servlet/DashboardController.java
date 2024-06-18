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
			JsonArray ageArray = new JsonArray();
			for(Integer age: ageList) {
				String subStringAge =age.toString().substring(0,2);
				if(subStringAge.contains("9") || subStringAge.contains("8")||subStringAge.contains("7")||
						subStringAge.contains("6") || subStringAge.contains("5") || subStringAge.contains("4")||subStringAge.contains("3")) {
					int birthYear = (Integer.parseInt("19"+subStringAge));
					subStringAgeList.add((2024-(Integer)birthYear)%10);
					ageArray.add((2024-(Integer)birthYear)%10);
				}else {
					int birthYear = (Integer.parseInt("20"+subStringAge));
					subStringAgeList.add((2024-(Integer)birthYear)%10);
					ageArray.add((2024-(Integer)birthYear)%10);
					System.out.println((2024-(Integer)birthYear)%10);
				}
			}
			session.setAttribute("memberList", memberList);
			session.setAttribute("boardList", boardList);
			session.setAttribute("ageList", ageArray);
		}

		request.getRequestDispatcher("/dashboard/dashboardIndex.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
