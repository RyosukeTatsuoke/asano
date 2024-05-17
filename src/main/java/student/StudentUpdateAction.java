package student;

import java.util.List;

import bean.GAKUSEIList;
import dao.GAKUSEIListDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class StudentUpdateAction extends Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html");

        GAKUSEIListDAO dao = new GAKUSEIListDAO();
        try {
            List<GAKUSEIList> studentList = dao.getAllStudents();
            request.setAttribute("studentList", studentList);
            
            // リクエストをフォワード
            RequestDispatcher rd = request.getRequestDispatcher("../studentlist/studentUpdateSuccess.jsp");
            rd.forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            // エラーハンドリング
            response.sendRedirect("../studentlist/studentUpdateError.jsp"); // 失敗した場合のページへの遷移
        }

        return "../studentlist/studentUpdateSuccess.jsp"; // 正常終了を示すURLを返す
    }
}
