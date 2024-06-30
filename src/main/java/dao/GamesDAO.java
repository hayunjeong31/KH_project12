package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import dto.GamesDTO;

public class GamesDAO {

    private static GamesDAO instance;

    public static synchronized GamesDAO getInstance() {
        if (instance == null) {
            instance = new GamesDAO();
        }
        return instance;
    }

    private Connection getConnection() throws Exception {
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
        return ds.getConnection();
    }

    private GamesDAO() {}

    // 게임 데이터를 조회하는 메서드
    public List<GamesDTO> getGamesList() throws Exception {
        String sql = "SELECT * FROM games";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            List<GamesDTO> list = new ArrayList<>();
            while (rs.next()) {
                GamesDTO game = new GamesDTO();
                game.setGameSeq(rs.getInt("gameSeq"));
                game.setGameName(rs.getString("gameName"));
                list.add(game);
            }
            return list;
        }
    }

    // 게임 데이터를 삽입하는 메서드
    public void insertGame(GamesDTO game) throws Exception {
        String sql = "INSERT INTO games (gameSeq, gameName) VALUES (game_seq.nextval, ?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, game.getGameName());
            ps.executeUpdate();
        }
    }
}
