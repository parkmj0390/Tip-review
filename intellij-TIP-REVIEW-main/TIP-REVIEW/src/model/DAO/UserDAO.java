package model.DAO;

import h2.DBConnection;
import model.Entitiy.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO {
    final private DBConnection dbConnection;

    public UserDAO(DBConnection dbConnection) {
        this.dbConnection = dbConnection;
    }

    // getUser (by userId)
    public User getUser(int userId) throws SQLException {
        Connection conn = dbConnection.getConnection();
        String sql = "SELECT * FROM Users WHERE userId = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, userId);

        ResultSet rs = pstmt.executeQuery();
        rs.next();

        User user = new User();
        try (conn; pstmt; rs) {
            user.setUserId(rs.getInt("userId"));
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            user.setEmail(rs.getString("email"));
            return user;
        }
    }

    // UserDAO 클래스에 추가
    public User getUserByUsername(String username) throws SQLException {
        Connection conn = dbConnection.getConnection();
        String sql = "SELECT * FROM Users WHERE username = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);

        ResultSet rs = pstmt.executeQuery();
        try (conn; pstmt; rs) {
            if (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                return user;
            } else {
                return null; // 사용자가 존재하지 않을 경우 null 반환
            }
        }
    }


    // getUserList (all users)
    public User[] getUserList() throws SQLException {
        Connection conn = dbConnection.getConnection();
        String sql = "SELECT * FROM Users";
        PreparedStatement pstmt = conn.prepareStatement(sql);

        ResultSet rs = pstmt.executeQuery();

        ArrayList<User> userList = new ArrayList<>();
        try (conn; pstmt; rs) {
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                userList.add(user);
            }
            return userList.toArray(new User[0]);
        }
    }

    // addUser (insert new user)
    public boolean addUser(User user) throws SQLException {
        Connection conn = dbConnection.getConnection();
        String sql = "INSERT INTO Users (username, password, email) VALUES (?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, user.getUsername());
        pstmt.setString(2, user.getPassword());
        pstmt.setString(3, user.getEmail());

        int rowsAffected = pstmt.executeUpdate();
        return rowsAffected > 0;
    }

    // updateUser (update user by userId)
    public boolean updateUser(User user) throws SQLException {
        Connection conn = dbConnection.getConnection();
        String sql = "UPDATE Users SET username = ?, password = ?, email = ? WHERE userId = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, user.getUsername());
        pstmt.setString(2, user.getPassword());
        pstmt.setString(3, user.getEmail());
        pstmt.setInt(4, user.getUserId());

        int rowsAffected = pstmt.executeUpdate();
        return rowsAffected > 0;
    }

    // deleteUser (delete user by userId)
    public boolean deleteUser(int userId) throws SQLException {
        Connection conn = dbConnection.getConnection();
        String sql = "DELETE FROM Users WHERE userId = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, userId);

        int rowsAffected = pstmt.executeUpdate();
        return rowsAffected > 0;
    }

    // 이메일로 사용자 조회
    public User getUserByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM Users WHERE email = ?";
        try (Connection conn = dbConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);  // 이메일로 검색

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setUserId(rs.getInt("userId"));
                    user.setUsername(rs.getString("username"));
                    user.setPassword(rs.getString("password"));
                    user.setEmail(rs.getString("email"));
                    return user;
                } else {
                    return null; // 이메일로 사용자가 존재하지 않으면 null 반환
                }
            }
        }
    }

}
