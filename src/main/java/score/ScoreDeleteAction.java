package score;
import java.io.IOException;
import java.sql.SQLException;

import dao.ScoreDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ScoreDeleteServlet")
public class ScoreDeleteAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] selectedScores = request.getParameterValues("selectedScores");
        if (selectedScores != null) {
            ScoreDAO dao = new ScoreDAO();
            for (String score : selectedScores) {
                String[] parts = score.split(",");
                String studentNo = parts[0];
                String subjectCd = parts[1];
                String schoolCd = parts[2];
                String no = parts[3];
                try {
                    dao.deleteScore(studentNo, subjectCd, schoolCd, no);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        response.sendRedirect("scoreList.jsp");
    }
}
