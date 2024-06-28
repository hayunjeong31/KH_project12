package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.GameScoreDTO;

public class GamesScoreDAO {

    private static GamesScoreDAO instance;

    public static synchronized GamesScoreDAO getInstance() {
        if (instance == null) {
            instance = new GamesScoreDAO();
        }
        return instance;
    }

    private Connection getConnection() throws Exception {
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
        return ds.getConnection();
    }

    private GamesScoreDAO() {}

    public void insertGameScore(GameScoreDTO score) throws Exception {
        String sql = "INSERT INTO game_score (playSeq, userSeq, gameSeq, gameScore, gameRank, record_date) VALUES (game_score_seq.nextval, ?, ?, ?, ?, ?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, score.getUserSeq());
            ps.setInt(2, score.getGameSeq());
            ps.setInt(3, score.getGameScore());
            ps.setInt(4, score.getGameRank());
            ps.setTimestamp(5, score.getRecord_date());

            ps.executeUpdate();
        }
    }

    public Map<Integer, Integer> getPlayCounts() throws Exception {
        String sql = "SELECT gameSeq, COUNT(*) AS playCount FROM game_score GROUP BY gameSeq";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            Map<Integer, Integer> playCounts = new HashMap<>();
            while (rs.next()) {
                int gameSeq = rs.getInt("gameSeq");
                int playCount = rs.getInt("playCount");
                playCounts.put(gameSeq, playCount);
            }
            return playCounts;
        }
    }
    
    
}
