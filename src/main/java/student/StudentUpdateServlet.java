package student;

import java.io.IOException;
import java.util.List;

import bean.GAKUSEIList;
import dao.GAKUSEIListDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/StudentUpdateServlet")
public class StudentUpdateServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GAKUSEIListDAO dao = new GAKUSEIListDAO();
        try {
            List<GAKUSEIList> studentList = dao.getAllStudents();
            request.setAttribute("studentList", studentList);
            request.getRequestDispatcher("/studentUpdate.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // エラーハンドリング
            response.sendRedirect("studentUpdateFailure.jsp"); // 失敗した場合のページへの遷移
        }
    }
}
