package score;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ScoreUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentNo = request.getParameter("studentNo");
        String subjectCd = request.getParameter("subjectCd");
        String schoolCd = request.getParameter("schoolCd");
        int no = Integer.parseInt(request.getParameter("no"));
        int point = Integer.parseInt(request.getParameter("point"));
        int classNum = Integer.parseInt(request.getParameter("classNum"));

        try {
            Connection conn = DriverManager.getConnection("jdbc:your_database_url", "your_username", "your_password");
            String sql = "UPDATE TEST SET SUBJECT_CD = ?, SCHOOL_CD = ?, NO = ?, POINT = ?, CLASS_NUM = ? WHERE STUDENT_NO = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, subjectCd);
            stmt.setString(2, schoolCd);
            stmt.setInt(3, no);
            stmt.setInt(4, point);
            stmt.setInt(5, classNum);
            stmt.setString(6, studentNo);

            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("An existing score was updated successfully!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("ScoreListServlet");
    }
}
