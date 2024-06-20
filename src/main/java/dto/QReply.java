package dto;

import java.sql.Timestamp;

public class QReply {

	private int seq;
	private int userId;
	private String contents;
	private Timestamp write_date;
	private String queSeq;
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
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
	public String getQueSeq() {
		return queSeq;
	}
	public void setQueSeq(String queSeq) {
		this.queSeq = queSeq;
	}
	
	public QReply() {}
	
	public QReply(int seq, int userId, String contents, Timestamp write_date, String queSeq) {
		super();
		this.seq = seq;
		this.userId = userId;
		this.contents = contents;
		this.write_date = write_date;
		this.queSeq = queSeq;
	}
	
		
	
}
