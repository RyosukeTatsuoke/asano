package studentList;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/studentRegistration")
public class StudentRegistration extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String entYear = request.getParameter("entYear");
        String classNum = request.getParameter("classNum");
        String isAttend = request.getParameter("isAttend");
        String schoolCd = request.getParameter("schoolCd");

        try {
            Context initContext = new InitialContext();
            DataSource ds = (DataSource) initContext.lookup("java:/comp/env/jdbc/mydb");
            Connection conn = ds.getConnection();

            String sql = "INSERT INTO STUDENT (NAME, ENT_YEAR, CLASS_NUM, IS_ATTEND, SCHOOL_CD) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, entYear);
            pstmt.setString(3, classNum);
            pstmt.setString(4, isAttend);
            pstmt.setString(5, schoolCd);
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            response.sendRedirect("registrationComplete.jsp");
        } catch (Exception e) {
            throw new ServletException("Error registering student", e);
        }
    }
}
