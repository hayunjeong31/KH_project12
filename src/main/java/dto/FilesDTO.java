package dto;

public class FilesDTO {
	
	private int fileSeq;
	private String oriname;
	private String sysname;
	private int boardSeq;
	
	
	public int getFileSeq() {
		return fileSeq;
	}
	public void setFileSeq(int fileSeq) {
		this.fileSeq = fileSeq;
	}
	public String getOriname() {
		return oriname;
	}
	public void setOriname(String oriname) {
		this.oriname = oriname;
	}
	public String getSysname() {
		return sysname;
	}
	public void setSysname(String sysname) {
		this.sysname = sysname;
	}
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	
	public FilesDTO() {}
	
	public FilesDTO(int fileSeq, String oriname, String sysname, int boardSeq) {
		super();
		this.fileSeq = fileSeq;
		this.oriname = oriname;
		this.sysname = sysname;
		this.boardSeq = boardSeq;
	}
	
	
}
