package SCORE;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/GradeServlet")
public class GradeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // JSPからの入力を取得
        String studentId = request.getParameter("studentId");
        String subject = request.getParameter("subject");
        int score = Integer.parseInt(request.getParameter("score"));
        
        // 成績を登録するためのクラスをインスタンス化し、メソッドを呼び出す
        GradeManager gradeManager = new GradeManager();
        gradeManager.registerGrade(studentId, subject, score);
        
        // 成績登録完了画面にリダイレクトする（必要に応じて適切なJSPに変更）
        response.sendRedirect("register_grade_done.jsp");
    }
}
