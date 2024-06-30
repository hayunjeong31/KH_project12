package dto;

public class AdminDTO {
	
	private int adminSeq;
	private int adminKey;
	private String name;
	private String userId;
	
	
	public int getAdminSeq() {
		return adminSeq;
	}
	public void setAdminSeq(int adminSeq) {
		this.adminSeq = adminSeq;
	}
	public int getAdminKey() {
		return adminKey;
	}
	public void setAdminKey(int adminKey) {
		this.adminKey = adminKey;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public AdminDTO() {}
	
	public AdminDTO(int adminSeq, int adminKey, String name, String userId) {
		super();
		this.adminSeq = adminSeq;
		this.adminKey = adminKey;
		this.name = name;
		this.userId = userId;
	}
	
	
	
}
