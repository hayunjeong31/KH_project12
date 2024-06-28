package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.BookmarkDAO;
import dto.BookmarkDTO;

@WebServlet("/bookmarks")
public class BookmarkController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = (String) request.getSession().getAttribute("loginID");
        if (userId != null) {
            BookmarkDAO bookmarkDAO = BookmarkDAO.getInstance();
            List<BookmarkDTO> bookmarks = bookmarkDAO.getBookmarksByUserId(userId);

            // Gson을 이용해 JSON 형태로 변환
            Gson gson = new Gson();
            String json = gson.toJson(bookmarks);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } else {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        }
    }
}
