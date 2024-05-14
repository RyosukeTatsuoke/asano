package student;

import java.io.IOException;

import bean.GAKUSEIList;
import dao.GAKUSEIListDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/StudentSearchServlet")
public class StudentSearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // リクエストパラメータから学生番号を取得
        String studentNo = request.getParameter("studentNo");
        
        // 学生番号で検索
        GAKUSEIListDAO dao = new GAKUSEIListDAO();
        try {
            GAKUSEIList student = dao.getStudentByNo(studentNo);
            if (student != null) {
                // 学生が見つかった場合はリクエストスコープにセットしてJSPにフォワード
                request.setAttribute("student", student);
                request.getRequestDispatcher("/studentSearchResult.jsp").forward(request, response);
            } else {
                // 学生が見つからない場合はエラーメッセージを表示
                response.getWriter().println("該当する学生が見つかりません。");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // エラーハンドリング
            response.getWriter().println("エラーが発生しました。");
        }
    }
}
