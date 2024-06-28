package dto;

public class BookmarkDTO {
    private int seq;
    private String userId;
    private int postSeq;

    public BookmarkDTO() {}

    public BookmarkDTO(int seq, String userId, int postSeq) {
        this.seq = seq;
        this.userId = userId;
        this.postSeq = postSeq;
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

    public int getPostSeq() {
        return postSeq;
    }

    public void setPostSeq(int postSeq) {
        this.postSeq = postSeq;
    }
}
