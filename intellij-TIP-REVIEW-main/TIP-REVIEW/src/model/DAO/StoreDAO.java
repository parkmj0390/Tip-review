package model.DAO;

import h2.DBConnection;
import model.Entitiy.Schedule;

import java.sql.*;
import java.util.ArrayList;

public class StoreDAO {
    private final DBConnection dbConnection;

    public StoreDAO(DBConnection dbConnection) {
        this.dbConnection = dbConnection;
    }

    // 특정 사용자에 해당하는 스토어 목록 가져오기
    public Schedule[] getStoreByUserId(int userId) throws SQLException {
        Connection conn = dbConnection.getConnection();
        String sql = "SELECT * FROM SCHEDULE WHERE USERID = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, userId);

        ResultSet rs = pstmt.executeQuery();
        ArrayList<Schedule> storeList = new ArrayList<>();

        try (conn; pstmt; rs) {
            while (rs.next()) {
                Schedule store = new Schedule();
                store.setScheduleId(rs.getInt("scheduleId"));
                store.setDescription(rs.getString("description"));
                store.setDate(rs.getString("date"));
                store.setTime(rs.getString("time"));
                storeList.add(store);
            }
        }

        return storeList.toArray(new Schedule[0]);
    }

    // 스토어 추가
    public void addStore(Schedule store) throws SQLException {
        Connection conn = dbConnection.getConnection();
        String sql = "INSERT INTO SCHEDULE (description, date, time) VALUES (?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, store.getDescription());
        pstmt.setString(2, store.getDate());
        pstmt.setString(3, store.getTime());

        pstmt.executeUpdate();
    }
}
