package dto;

import java.sql.Timestamp;

public class QBoardDTO {
	
	private int queSeq;
	private int categorySeq;
	private String userId;
	private String title;
	private String content;
	private Timestamp reg_date;
	private int view_count;
	private String inAnswered;
	
	
	public int getQueSeq() {
		return queSeq;
	}
	public void setQueSeq(int queSeq) {
		this.queSeq = queSeq;
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
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public String getInAnswered() {
		return inAnswered;
	}
	public void setInAnswered(String inAnswered) {
		this.inAnswered = inAnswered;
	}
	
	public QBoardDTO() {}
	
	public QBoardDTO(int queSeq, int categorySeq, String userId, String title, String content, Timestamp reg_date,
			int view_count, String inAnswered) {
		super();
		this.queSeq = queSeq;
		this.categorySeq = categorySeq;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.reg_date = reg_date;
		this.view_count = view_count;
		this.inAnswered = inAnswered;
	}
	
	
	
}
