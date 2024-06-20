package dto;

import java.sql.Timestamp;

public class QBoardDTO {
	
	private int seq;
	private int categorySeq;
	private String writer;
	private String title;
	private String contents;
	private Timestamp write_date;
	private Timestamp upd_date;
	private int view_count;
	private String password;
	private String isAnswered;
	private int adminKey;
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getCategorySeq() {
		return categorySeq;
	}
	public void setCategorySeq(int categorySeq) {
		this.categorySeq = categorySeq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getIsAnswered() {
		return isAnswered;
	}
	public void setIsAnswered(String isAnswered) {
		this.isAnswered = isAnswered;
	}
	public int getAdminKey() {
		return adminKey;
	}
	public void setAdminKey(int adminKey) {
		this.adminKey = adminKey;
	}
	
	public QBoardDTO() {}
	
	public QBoardDTO(int seq, int categorySeq, String writer, String title, String contents, Timestamp write_date,
			Timestamp upd_date, int view_count, String password, String isAnswered, int adminKey) {
		super();
		this.seq = seq;
		this.categorySeq = categorySeq;
		this.writer = writer;
		this.title = title;
		this.contents = contents;
		this.write_date = write_date;
		this.upd_date = upd_date;
		this.view_count = view_count;
		this.password = password;
		this.isAnswered = isAnswered;
		this.adminKey = adminKey;
	}
	
	
	
	
	
}
