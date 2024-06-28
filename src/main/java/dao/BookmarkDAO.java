package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.BookmarkDTO;

public class BookmarkDAO {
    private static BookmarkDAO instance;

    private BookmarkDAO() {}

    public static synchronized BookmarkDAO getInstance() {
        if (instance == null) {
            instance = new BookmarkDAO();
        }
        return instance;
    }

    private Connection getConnection() throws Exception {
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
        return ds.getConnection();
    }

    public List<BookmarkDTO> getBookmarksByUserId(String userId) {
        List<BookmarkDTO> bookmarks = new ArrayList<>();
        String sql = "SELECT seq, userId, postSeq FROM bookmarks WHERE userId = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    BookmarkDTO bookmark = new BookmarkDTO();
                    bookmark.setSeq(rs.getInt("seq"));
                    bookmark.setUserId(rs.getString("userId"));
                    bookmark.setPostSeq(rs.getInt("postSeq"));
                    bookmarks.add(bookmark);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookmarks;
    }
}
