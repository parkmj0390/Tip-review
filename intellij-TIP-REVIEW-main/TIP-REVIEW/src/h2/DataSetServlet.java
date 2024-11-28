package h2;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(urlPatterns = "/SetDB")
public class DataSetServlet extends HttpServlet {

    // 데이터베이스 초기화 및 데이터 삽입
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (Connection conn = DBConnection.getConnection(); Statement stmt = conn.createStatement()) {


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        response.getWriter().write("데이터 삽입 생성 성공!");
    }
}