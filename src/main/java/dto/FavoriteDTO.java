package dto;

public class FavoriteDTO {
    private int seq;
    private String userId;
    private String pageUrl;

    public FavoriteDTO(int seq, String userId, String pageUrl) {
        this.seq = seq;
        this.userId = userId;
        this.pageUrl = pageUrl;
    }

    // Getters and setters
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

    public String getPageUrl() {
        return pageUrl;
    }

    public void setPageUrl(String pageUrl) {
        this.pageUrl = pageUrl;
    }
}
