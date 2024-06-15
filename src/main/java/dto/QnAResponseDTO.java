package dto;

import java.sql.Timestamp;

public class QnAResponseDTO {

	private int responseSeq;
	private int queSeq;
	private int adminSeq;
	private String content;
	private Timestamp reg_date;
	
	
	public int getResponseSeq() {
		return responseSeq;
	}
	public void setResponseSeq(int responseSeq) {
		this.responseSeq = responseSeq;
	}
	public int getQueSeq() {
		return queSeq;
	}
	public void setQueSeq(int queSeq) {
		this.queSeq = queSeq;
	}
	public int getAdminSeq() {
		return adminSeq;
	}
	public void setAdminSeq(int adminSeq) {
		this.adminSeq = adminSeq;
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
	
	public QnAResponseDTO() {}
	
	public QnAResponseDTO(int responseSeq, int queSeq, int adminSeq, String content, Timestamp reg_date) {
		super();
		this.responseSeq = responseSeq;
		this.queSeq = queSeq;
		this.adminSeq = adminSeq;
		this.content = content;
		this.reg_date = reg_date;
	}
	
	
}
