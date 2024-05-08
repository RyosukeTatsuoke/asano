package SCORE;

import java.io.IOException;
import java.util.List;

import bean.SCOREList;
import dao.ScoreDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ScoreUpdateServlet")
public class ScoreUpdateServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ScoreDAO dao = new ScoreDAO();
        try {
            List<SCOREList> studentList = dao.getAllStudents();
            request.setAttribute("studentList", studentList);
            request.getRequestDispatcher("/studentUpdate.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // エラーハンドリング
        }
    }
}
