package student;

import bean.GAKUSEIList;
import dao.GAKUSEIListDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class StudentSearchAction extends Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html");

        // リクエストパラメータから学生番号を取得
        String studentNo = request.getParameter("studentNo");

        // DAOインスタンスの作成
        GAKUSEIListDAO dao = new GAKUSEIListDAO();
        
        try {
            // 学生番号で検索
            GAKUSEIList student = dao.getStudentByNo(studentNo);
            if (student != null) {
                // 学生が見つかった場合はリクエストスコープにセットしてJSPにフォワード
                request.setAttribute("student", student);
                RequestDispatcher rd = request.getRequestDispatcher("../studentlist/studentSearchResult.jsp");
                rd.forward(request, response);
            } else {
                // 学生が見つからない場合はエラーメッセージを表示
                request.setAttribute("errorMessage", "該当する学生が見つかりません。");
                RequestDispatcher rd = request.getRequestDispatcher("../studentlist/searchError.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // エラーハンドリング
            request.setAttribute("errorMessage", "エラーが発生しました。");
            RequestDispatcher rd = request.getRequestDispatcher("../studentlist/error.jsp");
            rd.forward(request, response);
        }

        return "../studentlist/studentSearchResult.jsp"; // 正常終了を示すURLを返す
    }
}
