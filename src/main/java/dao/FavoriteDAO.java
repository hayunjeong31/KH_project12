package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import dto.FavoriteDTO;

public class FavoriteDAO {

    // 싱글톤 패턴을 사용하여 FavoriteDAO 인스턴스를 관리합니다.
    private static FavoriteDAO instance;

    // private 생성자를 사용하여 외부에서 인스턴스 생성을 막습니다.
    private FavoriteDAO() {}

    // 싱글톤 인스턴스를 반환하는 메소드입니다.
    public static synchronized FavoriteDAO getInstance() {
        if (instance == null) {
            instance = new FavoriteDAO();
        }
        return instance;
    }

    // 데이터베이스 연결을 얻는 메소드입니다.
    private Connection getConnection() throws Exception {
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
        return ds.getConnection();
    }

    // 즐겨찾기를 추가하는 메소드입니다.
    public boolean addFavorite(FavoriteDTO favorite) throws Exception {
        String sql = "INSERT INTO favorite (seq, userId, page_url) VALUES (favorite_seq.nextval, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, favorite.getUserId());
            ps.setString(2, favorite.getPageUrl());
            return ps.executeUpdate() > 0; // 성공적으로 추가되면 true를 반환합니다.
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // 오류 발생 시 false를 반환합니다.
        }
    }

    // 즐겨찾기를 제거하는 메소드입니다.
    public boolean removeFavorite(String userId, String pageUrl) throws Exception {
        String sql = "DELETE FROM favorite WHERE userId = ? AND page_url = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, userId);
            ps.setString(2, pageUrl);
            return ps.executeUpdate() > 0; // 성공적으로 제거되면 true를 반환합니다.
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // 오류 발생 시 false를 반환합니다.
        }
    }

    // 특정 사용자가 특정 페이지를 즐겨찾기 했는지 확인하는 메소드입니다.
    public boolean isFavoriteExists(String userId, String pageUrl) throws Exception {
        String sql = "SELECT COUNT(*) FROM favorite WHERE userId = ? AND page_url = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, userId);
            ps.setString(2, pageUrl);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0; // 결과가 1 이상이면 true를 반환합니다.
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // 오류 발생 시 false를 반환합니다.
    }

    // 특정 사용자의 모든 즐겨찾기 항목을 조회하는 메소드입니다.
    public List<FavoriteDTO> getFavoritesByUserId(String userId) throws Exception {
        String sql = "SELECT seq, userId, page_url FROM favorite WHERE userId = ?";
        List<FavoriteDTO> favorites = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    FavoriteDTO favorite = new FavoriteDTO(
                        rs.getInt("seq"),
                        rs.getString("userId"),
                        rs.getString("page_url")
                    );
                    favorites.add(favorite); // 조회된 즐겨찾기 항목을 리스트에 추가합니다.
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return favorites; // 조회된 즐겨찾기 항목 리스트를 반환합니다.
    }
}
