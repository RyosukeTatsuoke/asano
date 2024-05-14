package score;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ScoreDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentNo = request.getParameter("studentNo");

        try {
            Connection conn = DriverManager.getConnection("jdbc:your_database_url", "your_username", "your_password");
            String sql = "DELETE FROM TEST WHERE STUDENT_NO = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, studentNo);

            int rowsDeleted = stmt.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("A score was deleted successfully!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("ScoreListServlet");
    }
}
