package student;

import java.util.List;

import bean.GAKUSEIList;
import dao.GAKUSEIListDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class StudentAction extends Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // セッションの取得、存在しない場合は新規作成
        HttpSession session = request.getSession(true);

        // DAOのインスタンス化
        GAKUSEIListDAO dao = new GAKUSEIListDAO();

        // 学生リストを取得
        List<GAKUSEIList> studentList = dao.getAllStudents();

        // 学生リストをセッションに保存
        session.setAttribute("studentList", studentList);

        // 学生リストのJSPページにリダイレクト
        return "../webapp/studentlist/StudentList.jsp";
    }
}
