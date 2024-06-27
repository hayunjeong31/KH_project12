package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;
import dao.GamesDAO;
import dao.GamesRankingDAO;
import dao.GamesScoreDAO;
import dto.GameRankingDTO;
import dto.GameScoreDTO;
import dto.GamesDTO;

@WebServlet("*.games")
public class GamesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void init() throws ServletException {
        super.init();
        // 서버가 초기화될 때 플래그를 설정합니다.
        getServletContext().setAttribute("serverRestarted", true);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String action = request.getParameter("action");

            if ("checkServerRestart".equals(action)) {
                Boolean serverRestarted = (Boolean) request.getServletContext().getAttribute("serverRestarted");

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                Gson gson = new Gson();
                String jsonServerRestarted = gson.toJson(serverRestarted != null && serverRestarted);
                out.write(jsonServerRestarted);
                out.close();

                // 서버 초기화 플래그를 재설정합니다.
                if (serverRestarted != null && serverRestarted) {
                    request.getServletContext().setAttribute("serverRestarted", false);
                }
            } else if ("getPlayCounts".equals(action)) {
                try {
                    GamesScoreDAO gamesScoreDao = GamesScoreDAO.getInstance();
                    Map<Integer, Integer> playCounts = gamesScoreDao.getPlayCounts();

                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    PrintWriter out = response.getWriter();
                    Gson gson = new Gson();
                    String jsonPlayCounts = gson.toJson(playCounts);
                    System.out.println("Play Counts: " + jsonPlayCounts); // 로그 추가
                    out.write(jsonPlayCounts);
                    out.close();
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "플레이 횟수를 가져오는 중 오류가 발생했습니다");
                }
            } else if ("save".equals(action)) {
                HttpSession session = request.getSession();
                String userId = (String) session.getAttribute("loginID");
                Integer userSeq = (Integer) session.getAttribute("userSeq");

                if (userId == null || userId.isEmpty() || userSeq == null) {
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
                    return;
                }

                try {
                    int gameSeq = Integer.parseInt(request.getParameter("gameSeq"));
                    int score = Integer.parseInt(request.getParameter("gameScore"));
                    int gameRank = Integer.parseInt(request.getParameter("gameRank"));

                    GameRankingDTO ranking = new GameRankingDTO();
                    ranking.setUserId(userId);
                    ranking.setGameSeq(gameSeq);
                    ranking.setScore(score);
                    ranking.setRank_date(new Timestamp(System.currentTimeMillis()));

                    GamesRankingDAO gamesRankingDao = GamesRankingDAO.getInstance();
                    gamesRankingDao.insertGameRanking(ranking);

                    GameScoreDTO gameScore = new GameScoreDTO();
                    gameScore.setUserSeq(userSeq);
                    gameScore.setGameSeq(gameSeq);
                    gameScore.setGameScore(score);
                    gameScore.setGameRank(gameRank);
                    gameScore.setRecord_date(new Timestamp(System.currentTimeMillis()));

                    GamesScoreDAO gamesScoreDao = GamesScoreDAO.getInstance();
                    gamesScoreDao.insertGameScore(gameScore);

                    response.getWriter().write("Score saved successfully");
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while saving score");
                }
            } else if ("retrieve".equals(action)) {
                try {
                    String gameSeqParam = request.getParameter("gameSeq");
                    int gameSeq = gameSeqParam != null ? Integer.parseInt(gameSeqParam) : 1;

                    GamesRankingDAO gamesRankingDao = GamesRankingDAO.getInstance();
                    List<GameRankingDTO> topRankings = gamesRankingDao.getTopRankingsByScore(gameSeq, 5);

                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    PrintWriter out = response.getWriter();
                    Gson gson = new Gson();
                    String jsonRankings = gson.toJson(topRankings);
                    out.write(jsonRankings);
                    out.close();
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while retrieving rankings");
                }
            } else if ("gamesList".equals(action)) {
                try {
                    GamesDAO gamesDao = GamesDAO.getInstance();
                    List<GamesDTO> gamesList = gamesDao.getGamesList();

                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    PrintWriter out = response.getWriter();
                    Gson gson = new Gson();
                    String jsonGamesList = gson.toJson(gamesList);
                    out.write(jsonGamesList);
                    out.close();
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while retrieving games list");
                }
            } else if ("insertGame".equals(action)) {
                try {
                    String gameName = request.getParameter("gameName");

                    GamesDTO game = new GamesDTO();
                    game.setGameName(gameName);

                    GamesDAO gamesDao = GamesDAO.getInstance();
                    gamesDao.insertGame(game);

                    response.getWriter().write("Game inserted successfully");
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while inserting game");
                }
            } else if ("countRankings".equals(action)) {
                try {
                    int gameSeq = Integer.parseInt(request.getParameter("gameSeq"));
                    GamesRankingDAO gamesRankingDao = GamesRankingDAO.getInstance();
                    int count = gamesRankingDao.countRankingsByGameSeq(gameSeq);

                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    PrintWriter out = response.getWriter();
                    Gson gson = new Gson();
                    String jsonCount = gson.toJson(count);
                    out.write(jsonCount);
                    out.close();
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while counting rankings");
                }
            } else {
                System.out.println("No valid action provided");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
