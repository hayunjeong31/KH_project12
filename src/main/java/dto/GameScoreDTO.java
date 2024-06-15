package dto;

import java.sql.Timestamp;

public class GameScoreDTO {
	
	private int playSeq;
	private int userSeq;
	private int gameSeq;
	private int gameScore;
	private int gameRank;
	private Timestamp record_date;
	
	
	public int getPlaySeq() {
		return playSeq;
	}
	public void setPlaySeq(int playSeq) {
		this.playSeq = playSeq;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public int getGameSeq() {
		return gameSeq;
	}
	public void setGameSeq(int gameSeq) {
		this.gameSeq = gameSeq;
	}
	public int getGameScore() {
		return gameScore;
	}
	public void setGameScore(int gameScore) {
		this.gameScore = gameScore;
	}
	public int getGameRank() {
		return gameRank;
	}
	public void setGameRank(int gameRank) {
		this.gameRank = gameRank;
	}
	public Timestamp getRecord_date() {
		return record_date;
	}
	public void setRecord_date(Timestamp record_date) {
		this.record_date = record_date;
	}
	
	public GameScoreDTO() {}
	
	public GameScoreDTO(int playSeq, int userSeq, int gameSeq, int gameScore, int gameRank, Timestamp record_date) {
		super();
		this.playSeq = playSeq;
		this.userSeq = userSeq;
		this.gameSeq = gameSeq;
		this.gameScore = gameScore;
		this.gameRank = gameRank;
		this.record_date = record_date;
	}
	
	
}
