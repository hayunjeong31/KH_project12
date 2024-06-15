package dto;

public class BoardCategoryDTO {

	private int categorySeq;
	private String categoryName;
	
	
	public int getCategorySeq() {
		return categorySeq;
	}
	public void setCategorySeq(int categorySeq) {
		this.categorySeq = categorySeq;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	public BoardCategoryDTO() {}
	
	public BoardCategoryDTO(int categorySeq, String categoryName) {
		super();
		this.categorySeq = categorySeq;
		this.categoryName = categoryName;
	}
	
	
	
}
