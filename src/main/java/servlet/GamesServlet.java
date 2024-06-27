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
                // 서버가 재시작되었는지 여부를 확인합니다.
                Boolean serverRestarted = (Boolean) request.getServletContext().getAttribute("serverRestarted");

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                Gson gson = new Gson();
                String jsonServerRestarted = gson.toJson(serverRestarted != null && serverRestarted);
                out.write(jsonServerRestarted);
                out.close();

                // 서버 재시작 플래그를 재설정합니다.
                if (serverRestarted != null && serverRestarted) {
                    request.getServletContext().setAttribute("serverRestarted", false);
                }
            } else {
                // 공통 트라이-캐치 블록으로 묶음
                try {
                    if ("getPlayCounts".equals(action)) {
                        // 각 게임의 플레이 횟수를 가져옵니다.
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
                        
                    } else if ("save".equals(action)) {
                        // 게임 점수를 저장합니다.
                        HttpSession session = request.getSession();
                        String userId = (String) session.getAttribute("loginID");
                        Integer userSeq = (Integer) session.getAttribute("userSeq");

                        // 로그인하지 않은 경우 오류를 반환합니다.
                        if (userId == null || userId.isEmpty() || userSeq == null) {
                            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
                            return;
                        }

                        // 게임 시퀀스 파라미터가 없는 경우 index.jsp로 리디렉션합니다.
                        String gameSeqParam = request.getParameter("gameSeq");
                        if (gameSeqParam == null) {
                            response.sendRedirect("index.jsp");
                            return;
                        }

                        // 게임 점수와 랭크를 저장합니다.
                        int gameSeq = Integer.parseInt(gameSeqParam);
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
                        
                    } else if ("retrieve".equals(action)) {
                        // 상위 5개의 게임 랭킹을 가져옵니다.
                        String gameSeqParam = request.getParameter("gameSeq");
                        if (gameSeqParam == null) {
                            response.sendRedirect("index.jsp");
                            return;
                        }

                        int gameSeq = Integer.parseInt(gameSeqParam);

                        GamesRankingDAO gamesRankingDao = GamesRankingDAO.getInstance();
                        List<GameRankingDTO> topRankings = gamesRankingDao.getTopRankingsByScore(gameSeq, 5);

                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");
                        PrintWriter out = response.getWriter();
                        Gson gson = new Gson();
                        String jsonRankings = gson.toJson(topRankings);
                        out.write(jsonRankings);
                        out.close();
                        
                    } else if ("gamesList".equals(action)) {
                        // 모든 게임 목록을 가져옵니다.
                        GamesDAO gamesDao = GamesDAO.getInstance();
                        List<GamesDTO> gamesList = gamesDao.getGamesList();

                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");
                        PrintWriter out = response.getWriter();
                        Gson gson = new Gson();
                        String jsonGamesList = gson.toJson(gamesList);
                        out.write(jsonGamesList);
                        out.close();
                        
                    } else if ("insertGame".equals(action)) {
                        // 새로운 게임을 추가합니다.
                        String gameName = request.getParameter("gameName");

                        GamesDTO game = new GamesDTO();
                        game.setGameName(gameName);

                        GamesDAO gamesDao = GamesDAO.getInstance();
                        gamesDao.insertGame(game);

                        response.getWriter().write("Game inserted successfully");
                        
                    } else if ("countRankings".equals(action)) {
                        // 특정 게임의 랭킹 수를 가져옵니다.
                        String gameSeqParam = request.getParameter("gameSeq");
                        if (gameSeqParam == null) {
                            response.sendRedirect("index.jsp");
                            return;
                        }

                        int gameSeq = Integer.parseInt(gameSeqParam);

                        GamesRankingDAO gamesRankingDao = GamesRankingDAO.getInstance();
                        int count = gamesRankingDao.countRankingsByGameSeq(gameSeq);

                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");
                        PrintWriter out = response.getWriter();
                        Gson gson = new Gson();
                        String jsonCount = gson.toJson(count);
                        out.write(jsonCount);
                        out.close();
                        
                    } else {
                        // 유효하지 않은 액션 처리
                        System.out.println("No valid action provided");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred");
                }
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
