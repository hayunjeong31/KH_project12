package dto;

public class FilesDTO {
	private int seq;
	private String oriname;
	private String sysname;
	private int parent_seq;
	private int categorySeq;
	
	public FilesDTO() {}
	
	public FilesDTO(int seq, String oriname, String sysname, int parent_seq, int categorySeq) {
		super();
		this.seq = seq;
		this.oriname = oriname;
		this.sysname = sysname;
		this.parent_seq = parent_seq;
		this.categorySeq = categorySeq;
	}

	public int getCategorySeq() {
		return categorySeq;
	}

	public void setCategorySeq(int categorySeq) {
		this.categorySeq = categorySeq;
	}

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
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
	public int getParent_seq() {
		return parent_seq;
	}
	public void setParent_seq(int parent_seq) {
		this.parent_seq = parent_seq;
	}
}
