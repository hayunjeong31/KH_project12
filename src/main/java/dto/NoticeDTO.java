package dto;

import java.sql.Timestamp;

public class NoticeDTO {

	private int noticeSeq;
	private int adminKey;
	private int categorySeq;
	private String title;
	private Timestamp reg_date;
	
	
	public int getNoticeSeq() {
		return noticeSeq;
	}
	public void setNoticeSeq(int noticeSeq) {
		this.noticeSeq = noticeSeq;
	}
	public int getAdminKey() {
		return adminKey;
	}
	public void setAdminKey(int adminKey) {
		this.adminKey = adminKey;
	}
	public int getCategorySeq() {
		return categorySeq;
	}
	public void setCategorySeq(int categorySeq) {
		this.categorySeq = categorySeq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	public NoticeDTO() {}
	
	public NoticeDTO(int noticeSeq, int adminKey, int categorySeq, String title, Timestamp reg_date) {
		super();
		this.noticeSeq = noticeSeq;
		this.adminKey = adminKey;
		this.categorySeq = categorySeq;
		this.title = title;
		this.reg_date = reg_date;
	}
	
	
	
	
}
