package STUDENT;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class StudentRegistration extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // フォームからのデータを取得
        String entYear = request.getParameter("entYear");
        String studentNo = request.getParameter("studentNo");
        String name = request.getParameter("name");
        String classNum = request.getParameter("classNum");

        // 未入力チェック
        if (isEmpty(entYear, studentNo, name, classNum)) {
            forwardToRegistrationPage(request, response, "すべてのフィールドを入力してください");
            return;
        }

        // データベースに接続して重複チェック
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourdatabase", "username", "password")) {
            if (isStudentNoExists(conn, studentNo)) {
                forwardToRegistrationPage(request, response, "学生番号が既に存在します");
                return;
            }

            // 新しい学生をデータベースに追加
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO STUDENT (NO, NAME, ENT_YEAR, CLASS_NUM, IS_ATTEND, SCHOOL_CD) VALUES (?, ?, ?, ?, ?, ?)");
            pstmt.setString(1, studentNo);
            pstmt.setString(2, name);
            pstmt.setString(3, entYear);
            pstmt.setString(4, classNum);
            pstmt.setBoolean(5, true); // 仮の値、実際のアプリケーションに応じて変更する必要があります
            pstmt.setString(6, "oom"); // 仮の値、実際のアプリケーションに応じて変更する必要があります
            pstmt.executeUpdate();

            // 登録完了画面にリダイレクト
            response.sendRedirect("/studentlist/registrationComplete.jsp");

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    private boolean isEmpty(String... values) {
        for (String value : values) {
            if (value.isEmpty()) {
                return true;
            }
        }
        return false;
    }

    private void forwardToRegistrationPage(HttpServletRequest request, HttpServletResponse response, String message)
            throws ServletException, IOException {
        // メッセージを設定して再度登録画面を表示
        request.setAttribute("message", message);
        RequestDispatcher rd = request.getRequestDispatcher("/studentRegistration.jsp");
        rd.forward(request, response);
    }

    private boolean isStudentNoExists(Connection conn, String studentNo) throws SQLException {
        try (PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM STUDENT WHERE NO = ?")) {
            pstmt.setString(1, studentNo);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        }
    }
}
