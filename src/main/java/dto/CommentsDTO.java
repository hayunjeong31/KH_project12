package dto;

import java.sql.Timestamp;

public class CommentsDTO {
	
	private int commentSeq;
	private int boardSeq;
	private int parent_cmt;
	private String content;
	private Timestamp reg_date;
	private String userId;
	
	
	public int getCommentSeq() {
		return commentSeq;
	}
	public void setCommentSeq(int commentSeq) {
		this.commentSeq = commentSeq;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public CommentsDTO() {}
	
	public CommentsDTO(int commentSeq, int boardSeq, int parent_cmt, String content, Timestamp reg_date, String userId) {
		super();
		this.commentSeq = commentSeq;
		this.boardSeq = boardSeq;
		this.parent_cmt = parent_cmt;
		this.content = content;
		this.reg_date = reg_date;
		this.userId = userId;
	}
	
	
	
}
