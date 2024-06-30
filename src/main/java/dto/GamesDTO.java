package dto;


public class GamesDTO {

	private int gameSeq;
	private String gameName;
	
	
	public int getGameSeq() {
		return gameSeq;
	}
	public void setGameSeq(int gameSeq) {
		this.gameSeq = gameSeq;
	}
	public String getGameName() {
		return gameName;
	}
	public void setGameName(String gameName) {
		this.gameName = gameName;
	}

	
	public GamesDTO() {}
	
	public GamesDTO(int gameSeq, String gameName) {
		super();
		this.gameSeq = gameSeq;
		this.gameName = gameName;

	}
	
	
}
