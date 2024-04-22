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

@WebServlet("/studentEdit")
public class StudentEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // フォームから送信された新しい学生情報を取得
        String studentId = request.getParameter("studentId");
        String newName = request.getParameter("name");
        int newGrade = Integer.parseInt(request.getParameter("grade"));

        try {
            // データベースへの接続
            Context initContext = new InitialContext();
            DataSource ds = (DataSource) initContext.lookup("java:/comp/env/jdbc/mydb");
            Connection conn = ds.getConnection();

            // SQLクエリの実行
            String sql = "UPDATE STUDENT SET NAME=?, GRADE=? WHERE NO=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newName);
            pstmt.setInt(2, newGrade);
            pstmt.setString(3, studentId);
            pstmt.executeUpdate();

            // リソースの解放
            pstmt.close();
            conn.close();

            // 変更完了画面にリダイレクト
            response.sendRedirect("editComplete.jsp");
        } catch (Exception e) {
            throw new ServletException("学生情報の変更中にエラーが発生しました", e);
        }
    }
}
