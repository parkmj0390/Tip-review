package model.DAO;

import h2.DBConnection;
import model.Entitiy.Memo;

import java.sql.*;
import java.util.ArrayList;

public class ReviewDAO {
    private final DBConnection dbConnection;

    public ReviewDAO(DBConnection dbConnection) {
        this.dbConnection = dbConnection;
    }

    // 사용자 ID에 해당하는 리뷰 목록 가져오기
    public Memo[] getReviewByUserId(long userId) throws SQLException {
        Connection conn = dbConnection.getConnection();
        String sql = "SELECT * FROM MEMO WHERE USERID = ?";  // USERID 컬럼이 있다고 가정
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setLong(1, userId);  // long 타입으로 수정

        ResultSet rs = pstmt.executeQuery();
        ArrayList<Memo> reviewList = new ArrayList<>();

        try (conn; pstmt; rs) {
            while (rs.next()) {
                Memo review = new Memo();
                review.setMemoId(rs.getInt("memoId"));
                review.setUsername(rs.getString("username"));
                review.setContent(rs.getString("content"));
                review.setScheduleId(rs.getInt("scheduleId"));
                reviewList.add(review);
            }
        }

        return reviewList.toArray(new Memo[0]);
    }

    // 일정 ID에 해당하는 리뷰 목록 가져오기
    public Memo[] getReviewByScheduleId(int scheduleId) throws SQLException {
        Connection conn = dbConnection.getConnection();
        String sql = "SELECT * FROM MEMO WHERE SCHEDULEID = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, scheduleId);

        ResultSet rs = pstmt.executeQuery();
        ArrayList<Memo> reviewList = new ArrayList<>();

        try (conn; pstmt; rs) {
            while (rs.next()) {
                Memo review = new Memo();
                review.setMemoId(rs.getInt("memoId"));
                review.setUsername(rs.getString("username"));
                review.setContent(rs.getString("content"));
                review.setScheduleId(rs.getInt("scheduleId"));
                reviewList.add(review);
            }
        }

        return reviewList.toArray(new Memo[0]);
    }

    // 리뷰 추가
    public void addReview(Memo review) throws SQLException {
        Connection conn = dbConnection.getConnection();
        String sql = "INSERT INTO MEMO (username, content, scheduleId) VALUES (?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, review.getUsername());
        pstmt.setString(2, review.getContent());
        pstmt.setInt(3, review.getScheduleId());

        pstmt.executeUpdate();
    }
}
