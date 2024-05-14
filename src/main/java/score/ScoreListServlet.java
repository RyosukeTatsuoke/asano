package score;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import bean.SCOREList;
import dao.ScoreDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ScoreListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ScoreDAO scoreDAO = new ScoreDAO();
        try {
            List<SCOREList> scores = scoreDAO.getAllStudents();
            request.setAttribute("scores", scores);
            request.getRequestDispatcher("/scoreList.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
        }
    }
}
