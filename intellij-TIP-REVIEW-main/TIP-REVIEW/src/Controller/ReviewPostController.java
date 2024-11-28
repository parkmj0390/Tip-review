package Controller;

import h2.DBConnection;
import model.DAO.ReviewDAO;
import model.Entitiy.Memo;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/reviewPostController")
public class ReviewPostController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ReviewDAO reviewDAO;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        DBConnection dbConnection = new DBConnection();
        this.reviewDAO = new ReviewDAO(dbConnection);
    }

    // 리뷰 목록 가져오기
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("getReviewByUserId".equals(action)) {
                getReviewByUserId(request, response);
            } else if ("getReviewByScheduleId".equals(action)) {
                getReviewByScheduleId(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    // 사용자 ID에 해당하는 리뷰 목록 가져오기
    private void getReviewByUserId(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        long userId = Long.parseLong(request.getParameter("userId"));  // long으로 변경
        Memo[] reviewList = reviewDAO.getReviewByUserId(userId);  // Memo[] 타입 사용
        request.setAttribute("reviewList", reviewList);
        request.getRequestDispatcher("/reviewList.jsp").forward(request, response);
    }

    // 일정 ID에 해당하는 리뷰 목록 가져오기
    private void getReviewByScheduleId(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int scheduleId = Integer.parseInt(request.getParameter("scheduleId"));
        Memo[] reviewList = reviewDAO.getReviewByScheduleId(scheduleId);
        request.setAttribute("reviewList", reviewList);
        request.getRequestDispatcher("/reviewList.jsp").forward(request, response);
    }

    // 리뷰 추가
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String content = request.getParameter("content");
        int scheduleId = Integer.parseInt(request.getParameter("scheduleId"));

        Memo newReview = new Memo(); // Memo 객체 사용
        newReview.setUsername(username);
        newReview.setContent(content);
        newReview.setScheduleId(scheduleId);

        try {
            reviewDAO.addReview(newReview); // DAO 메서드 호출
            response.sendRedirect("/reviewPostController?action=getReviewByScheduleId&scheduleId=" + scheduleId);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
