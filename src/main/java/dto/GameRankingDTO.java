package dto;

import java.sql.Timestamp;

public class GameRankingDTO {
	
	private int rankSeq;
	private int gameSeq;
	private String userId;
	private int score;
	private Timestamp rank_date;
	
	
	public int getRankSeq() {
		return rankSeq;
	}
	public void setRankSeq(int rankSeq) {
		this.rankSeq = rankSeq;
	}
	public int getGameSeq() {
		return gameSeq;
	}
	public void setGameSeq(int gameSeq) {
		this.gameSeq = gameSeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public Timestamp getRank_date() {
		return rank_date;
	}
	public void setRank_date(Timestamp rank_date) {
		this.rank_date = rank_date;
	}
	
	public GameRankingDTO() {}
	
	public GameRankingDTO(int rankSeq, int gameSeq, String userId, int score, Timestamp rank_date) {
		super();
		this.rankSeq = rankSeq;
		this.gameSeq = gameSeq;
		this.userId = userId;
		this.score = score;
		this.rank_date = rank_date;
	}
	
	
	
}
