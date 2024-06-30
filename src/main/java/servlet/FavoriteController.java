package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.FavoriteDAO;
import dto.FavoriteDTO;

@WebServlet("*.Favorite")
public class FavoriteController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private FavoriteDAO favoriteDAO;

    @Override
    public void init() throws ServletException {
        favoriteDAO = FavoriteDAO.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI = request.getRequestURI();

        if (requestURI.endsWith("/checkFavorite.Favorite")) {
            handleCheckFavorite(request, response);
        } else if (requestURI.endsWith("/getFavorites.Favorite")) {
            handleGetFavorites(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI = request.getRequestURI();

        if (requestURI.endsWith("/updateFavorite.Favorite")) {
            handleUpdateFavorite(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void handleCheckFavorite(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userId = request.getParameter("userId");
        String pageUrl = request.getParameter("pageUrl");

        boolean isFavorite = false;
        try {
            isFavorite = favoriteDAO.isFavoriteExists(userId, pageUrl);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"isFavorite\": " + isFavorite + "}");
    }

    private void handleGetFavorites(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userId = request.getParameter("userId");

        List<FavoriteDTO> favorites = null;
        try {
            favorites = favoriteDAO.getFavoritesByUserId(userId);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        StringBuilder json = new StringBuilder();
        json.append("[");
        if (favorites != null) {
            for (int i = 0; i < favorites.size(); i++) {
                FavoriteDTO favorite = favorites.get(i);
                json.append("{")
                    .append("\"seq\": ").append(favorite.getSeq()).append(", ")
                    .append("\"userId\": \"").append(favorite.getUserId()).append("\", ")
                    .append("\"pageUrl\": \"").append(favorite.getPageUrl()).append("\"")
                    .append("}");
                if (i < favorites.size() - 1) {
                    json.append(", ");
                }
            }
        }
        json.append("]");

        response.getWriter().write(json.toString());
    }

    private void handleUpdateFavorite(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userId = request.getParameter("userId");
        String pageUrl = request.getParameter("pageUrl");
        boolean isFavorite = Boolean.parseBoolean(request.getParameter("isFavorite"));

        FavoriteDTO favorite = new FavoriteDTO(0, userId, pageUrl);

        boolean result = false;
        String message = "";
        try {
            if (isFavorite) {
                result = favoriteDAO.addFavorite(favorite);
                message = result ? "즐겨찾기에 추가되었습니다." : "즐겨찾기 추가에 실패했습니다.";
            } else {
                result = favoriteDAO.removeFavorite(userId, pageUrl);
                message = result ? "즐겨찾기에서 제거되었습니다." : "즐겨찾기 제거에 실패했습니다.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "오류가 발생했습니다: " + e.getMessage();
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"success\": " + result + ", \"message\": \"" + message + "\"}");
    }
}
