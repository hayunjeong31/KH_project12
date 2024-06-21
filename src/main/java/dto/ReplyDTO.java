package dto;

import java.sql.Timestamp;

public class ReplyDTO {
	private int seq;
	private int boardSeq;
	private int parent_cmt; 
	private String contents;
	private Timestamp write_date;
	private String userId;
	private String isDeleted;
	
	public String getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}
	public ReplyDTO(int seq, int boardSeq, int parent_cmt, String contents, Timestamp write_date, String userId,
			String isDeleted) {
		super();
		this.seq = seq;
		this.boardSeq = boardSeq;
		this.parent_cmt = parent_cmt;
		this.contents = contents;
		this.write_date = write_date;
		this.userId = userId;
		this.isDeleted = isDeleted;
	}
	
	public ReplyDTO() {}
	public ReplyDTO(int seq, int boardSeq, int parent_cmt, String contents, Timestamp write_date,String userId ) {
		super();
		this.seq = seq;
		this.boardSeq = boardSeq;
		this.parent_cmt = parent_cmt;
		this.contents = contents;
		this.userId = userId;
		this.write_date = write_date;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public int getParent_cmt() {
		return parent_cmt;
	}
	public void setParent_cmt(int parent_cmt) {
		this.parent_cmt = parent_cmt;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	
	
}
