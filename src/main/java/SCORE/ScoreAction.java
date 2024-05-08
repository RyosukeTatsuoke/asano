package SCORE;

import java.util.List;

import bean.SCOREList;
import dao.ScoreDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class ScoreAction extends Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // セッションの取得、存在しない場合は新規作成
        HttpSession session = request.getSession(true);

        // DAOのインスタンス化
        ScoreDAO dao = new ScoreDAO();

        // 学生リストを取得
        List<SCOREList> studentList = dao.getAllStudents();

        // 学生リストをセッションに保存
        session.setAttribute("studentList", studentList);

        // 学生リストのJSPページにリダイレクト
        return "../webapp/studentlist/StudentList.jsp";
    }
}
