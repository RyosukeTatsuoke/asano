// StudentAction.java
package STUDENT;
import java.util.List;

import bean.GAKUSEIList;
import dao.GAKUSEIListDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class StudentAction extends Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(); // セッションの開始

        GAKUSEIListDAO dao = new GAKUSEIListDAO();
        List<GAKUSEIList> studentList = dao.search(""); // 学生一覧を取得

        session.setAttribute("studentList", studentList); // 学生リストをセッションに保存

        return "../menu/StudentList.jsp"; // studentList.jspに遷移
    }
}
