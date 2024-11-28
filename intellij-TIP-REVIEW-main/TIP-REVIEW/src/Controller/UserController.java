package Controller;

import h2.DBConnection;
import model.DAO.UserDAO;
import model.Entitiy.User;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/userController")
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDAO userDAO;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        DBConnection dbConnection = new DBConnection();
        this.userDAO = new UserDAO(dbConnection);
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "register":
                    registerUser(request, response);
                    break;
                case "login":
                    loginUser(request, response);
                    break;
                case "viewUser":
                    viewUser(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
            }
        } catch (SQLException e) {
            throw new ServletException("Database error: " + e.getMessage(), e);
        }
    }

    // 회원가입 처리
    private void registerUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        User newUser = new User();
        newUser.setUsername(username);
        newUser.setPassword(password);
        newUser.setEmail(email);

        boolean success = userDAO.addUser(newUser);
        if (success) {
            HttpSession session = request.getSession();
            response.sendRedirect("Main.jsp");
        } else {
            request.setAttribute("resultMessage", "잘못된 이메일 또는 비밀번호입니다!");
        }
    }

    // 로그인 처리
    private void loginUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // 이메일을 사용하여 사용자 정보 가져오기
        User user = userDAO.getUserByEmail(email);
        response.setContentType("text/html; charset=UTF-8");

        if (user != null && user.getPassword().equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", user.getUserId());
            response.sendRedirect("Table.jsp"); // 로그인 성공 후 Table.jsp로 리디렉션
        } else {
            // 로그인 실패 시 오류 메시지 설정
            request.setAttribute("resultMessage", "잘못된 이메일 또는 비밀번호입니다!");
            // 로그인 실패 시 Error.jsp로 포워딩
            request.getRequestDispatcher("/Error.jsp").forward(request, response);
        }
    }



    // 특정 사용자 정보 조회
    private void viewUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        Long userId = (Long) session.getAttribute("userId");

        if (userId != null) {
            int userIdInt = userId.intValue();
            User user = userDAO.getUser(userIdInt);
            request.setAttribute("user", user);
            request.getRequestDispatcher("viewUser.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp"); // 로그인되지 않은 경우 로그인 페이지로 이동
        }
    }
}
