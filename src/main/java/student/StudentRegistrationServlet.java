package student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class StudentRegistrationServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:h2:tcp://localhost/~/score1";
    private static final String DB_USER = "sa";
    private static final String DB_PASSWORD = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 次の学生番号を取得
        String nextStudentNo = getNextStudentNo();

        // JSP ファイルに次の学生番号を渡す
        request.setAttribute("nextStudentNo", nextStudentNo);

        // 学生登録画面にフォワード
        request.getRequestDispatcher("/studentRegistration.jsp").forward(request, response);
    }

    @Override
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

        // データベースに学生を追加
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            addStudentToDatabase(conn, entYear, studentNo, name, classNum);
            response.sendRedirect("registrationSuccess.jsp"); // 登録成功ページにリダイレクト

        } catch (SQLException ex) {
            ex.printStackTrace();
            forwardToRegistrationPage(request, response, "データベースエラーが発生しました");
        }
    }

    private String getNextStudentNo() {
        String nextStudentNo = null;
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(NO) FROM STUDENT");
             ResultSet rs = pstmt.executeQuery()) {

            if (rs.next()) {
                int maxNo = rs.getInt(1);
                nextStudentNo = String.valueOf(maxNo + 1);
            } else {
                nextStudentNo = "1";
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            // エラー処理
        }
        return nextStudentNo;
    }

    private boolean isEmpty(String... values) {
        for (String value : values) {
            if (value == null || value.isEmpty()) {
                return true;
            }
        }
        return false;
    }

    private void forwardToRegistrationPage(HttpServletRequest request, HttpServletResponse response, String message)
            throws ServletException, IOException {
        // メッセージを設定して再度登録画面を表示
        request.setAttribute("message", message);
        request.getRequestDispatcher("/studentRegistration.jsp").forward(request, response);
    }

    private void addStudentToDatabase(Connection conn, String entYear, String studentNo, String name, String classNum)
            throws SQLException {
        try (PreparedStatement pstmt = conn.prepareStatement("INSERT INTO STUDENT (NAME, ENT_YEAR, CLASS_NUM, IS_ATTEND, SCHOOL_CD) VALUES (?, ?, ?, ?, ?)")) {
            pstmt.setString(1, name);
            pstmt.setString(2, entYear);
            pstmt.setString(3, classNum);
            pstmt.setBoolean(4, true); // 仮の値、実際のアプリケーションに応じて変更する必要があります
            pstmt.setString(5, "oom"); // 仮の値、実際のアプリケーションに応じて変更する必要があります
            pstmt.executeUpdate();
        }
    }
}
