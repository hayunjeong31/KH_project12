package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import dto.GameRankingDTO;
import java.util.ArrayList;
import java.util.List;

public class GamesRankingDAO {

    private static GamesRankingDAO instance;

    public static synchronized GamesRankingDAO getInstance() {
        if (instance == null) {
            instance = new GamesRankingDAO();
        }
        return instance;
    }

    private Connection getConnection() throws Exception {
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
        return ds.getConnection();
    }

    private GamesRankingDAO() {}

    public void insertGameRanking(GameRankingDTO ranking) throws Exception {
        String sql = "INSERT INTO game_ranking (rankSeq, gameSeq, userId, score, rank_date) VALUES (game_ranking_seq.nextval, ?, ?, ?, ?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, ranking.getGameSeq());
            ps.setString(2, ranking.getUserId());
            ps.setInt(3, ranking.getScore());
            ps.setTimestamp(4, ranking.getRank_date());

            int rowsAffected = ps.executeUpdate();
            System.out.println("Inserted " + rowsAffected + " row(s) into game_ranking");
        }
    }

    public List<GameRankingDTO> getTopRankingsByScore(int gameSeq, int limit) throws Exception {
        String sql = "SELECT * FROM (SELECT * FROM game_ranking WHERE gameSeq = ? ORDER BY score DESC) WHERE ROWNUM <= ?";
        List<GameRankingDTO> rankings = new ArrayList<>();

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, gameSeq);
            ps.setInt(2, limit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    GameRankingDTO ranking = new GameRankingDTO();
                    ranking.setRankSeq(rs.getInt("rankSeq"));
                    ranking.setGameSeq(rs.getInt("gameSeq"));
                    ranking.setUserId(rs.getString("userId"));
                    ranking.setScore(rs.getInt("score"));
                    ranking.setRank_date(rs.getTimestamp("rank_date"));
                    rankings.add(ranking);
                    System.out.println("RankSeq: " + ranking.getRankSeq() + ", UserId: " + ranking.getUserId() + ", Score: " + ranking.getScore() + ", RankDate: " + ranking.getRank_date());
                }
            }
        }
        return rankings;
    }

    public int countRankingsByGameSeq(int gameSeq) throws Exception {
        String sql = "SELECT COUNT(*) FROM game_ranking WHERE gameSeq = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, gameSeq);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return 0;
    }
}
