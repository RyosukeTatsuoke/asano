package studentList;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/StudentListServlet")
public class StudentListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:h2:tcp://localhost/~/score1";
    private static final String JDBC_USER = "sa"; 
    private static final String JDBC_PASSWORD = ""; 

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Student> students = new ArrayList<>();
        try {
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            
            String sql = "SELECT * FROM STUDENT";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                int id = rs.getInt("NO");
                String name = rs.getString("NAME");
                int entranceYear = rs.getInt("ENT_YEAR");
                int classNumber = rs.getInt("CLASS_NUM");
                boolean isAttend = rs.getBoolean("IS_ATTEND");
                String schoolCode = rs.getString("SCHOOL_CD");
                Student student = new Student(id, name, entranceYear, classNumber, isAttend, schoolCode);
                students.add(student);
            }
            
            rs.close();
            stmt.close();
            conn.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        request.setAttribute("students", students);
        request.getRequestDispatcher("/studentList.jsp").forward(request, response);
    }
}
