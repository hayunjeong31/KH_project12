package dto;

import java.sql.Timestamp;

public class FreeBoardDTO {

	private int freeSeq;
	private int categorySeq;
	private String userId;
	private String title;
	private String content;
	private Timestamp reg_date;
	private Timestamp upd_date;
	private int view_count;
	private int adminKey;
	
	
	public int getFreeSeq() {
		return freeSeq;
	}
	public void setFreeSeq(int freeSeq) {
		this.freeSeq = freeSeq;
	}
	public int getCategorySeq() {
		return categorySeq;
	}
	public void setCategorySeq(int categorySeq) {
		this.categorySeq = categorySeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public Timestamp getUpd_date() {
		return upd_date;
	}
	public void setUpd_date(Timestamp upd_date) {
		this.upd_date = upd_date;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public int getAdminKey() {
		return adminKey;
	}
	public void setAdminKey(int adminKey) {
		this.adminKey = adminKey;
	}
	
	public FreeBoardDTO() {}
	
	public FreeBoardDTO(int freeSeq, int categorySeq, String userId, String title, String content, Timestamp reg_date,
			Timestamp upd_date, int view_count, int adminKey) {
		super();
		this.freeSeq = freeSeq;
		this.categorySeq = categorySeq;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.reg_date = reg_date;
		this.upd_date = upd_date;
		this.view_count = view_count;
		this.adminKey = adminKey;
	}	
	
	
}
