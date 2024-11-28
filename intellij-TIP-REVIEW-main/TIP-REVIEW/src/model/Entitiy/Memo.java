package model.Entitiy;

public class Memo {
    private int memoId;
    private String username;
    private String content;
    private int scheduleId;

    public Memo() {}

    public Memo(int memoId, String username, String content, int scheduleId) {
        this.memoId = memoId;
        this.username = username;
        this.content = content;
        this.scheduleId = scheduleId;
    }

    public int getMemoId() {
        return memoId;
    }

    public void setMemoId(int memoId) {
        this.memoId = memoId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(int scheduleId) {
        this.scheduleId = scheduleId;
    }

    @Override
    public String toString() {
        return "Memo{" +
                "memoId=" + memoId +
                ", username='" + username + '\'' +
                ", content='" + content + '\'' +
                ", scheduleId=" + scheduleId +
                '}';
    }
}
