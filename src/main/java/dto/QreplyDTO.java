package dto;

import java.sql.Timestamp;

public class QreplyDTO {
	private int seq;
	private String userId;
	private String contents;
	private Timestamp write_date;
	private int queSeq;
	
	public QreplyDTO() {}

	public QreplyDTO(int seq, String userId, String contents, Timestamp write_date, int queSeq) {
		super();
		this.seq = seq;
		this.userId = userId;
		this.contents = contents;
		this.write_date = write_date;
		this.queSeq = queSeq;
	}



	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
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

	public int getQueSeq() {
		return queSeq;
	}

	public void setQueSeq(int queSeq) {
		this.queSeq = queSeq;
	}
	
	
	
	
}
