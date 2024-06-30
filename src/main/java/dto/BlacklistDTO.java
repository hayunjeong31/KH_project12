package dto;

import java.sql.Timestamp;

public class BlacklistDTO {
	
	private int blacklistSeq;
	private String userId;
	private String reason;
	private Timestamp reg_date;
	
	
	public int getBlacklistSeq() {
		return blacklistSeq;
	}
	public void setBlacklistSeq(int blacklistSeq) {
		this.blacklistSeq = blacklistSeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	public BlacklistDTO() {}
	
	public BlacklistDTO(int blacklistSeq, String userId, String reason, Timestamp reg_date) {
		super();
		this.blacklistSeq = blacklistSeq;
		this.userId = userId;
		this.reason = reason;
		this.reg_date = reg_date;
	}
	
	
	
}
