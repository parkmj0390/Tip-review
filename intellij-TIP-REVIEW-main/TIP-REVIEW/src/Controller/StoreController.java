package Controller;

import h2.DBConnection;
import model.DAO.StoreDAO;
import model.Entitiy.Schedule;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;


@WebServlet(urlPatterns = "/home")
public class StoreController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private StoreDAO storeDAO;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        DBConnection dbConnection = new DBConnection();
        this.storeDAO = new StoreDAO(dbConnection);
    }

    // /home 요청을 받으면 로그인 페이지로 리다이렉트
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        // /home 요청을 받으면 로그인 페이지로 포워딩
        if (action == null || action.isEmpty()) {
            request.getRequestDispatcher("/Main.jsp").forward(request, response);
        } else {
            // 그 외의 요청 처리
            try {
                if ("getStoresByUserId".equals(action)) {
                    getStoresByUserId(request, response);
                }
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        }
    }

    // 특정 사용자의 스토어 목록 가져오기
    private void getStoresByUserId(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        Long userId = Long.parseLong(request.getParameter("userId"));

        // Long -> int로 변환하여 StoreDAO 메서드 호출
        int userIdInt = userId.intValue();
        Schedule[] stores = storeDAO.getStoreByUserId(userIdInt);

        request.setAttribute("storeList", stores);
        request.getRequestDispatcher("/Main.jsp").forward(request, response);
    }

    // 스토어 추가
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String description = request.getParameter("description");
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        Schedule newStore = new Schedule();
        newStore.setDescription(description);
        newStore.setDate(date);
        newStore.setTime(time);

        try {
            storeDAO.addStore(newStore);
            response.sendRedirect("/storeController?action=getStoresByUserId&userId=" + newStore.getScheduleId());
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

}