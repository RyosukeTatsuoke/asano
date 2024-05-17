package student;

import java.io.IOException;

import dao.GAKUSEIListDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/StudentDeleteServlet")
public class StudentDeleteAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentNo = request.getParameter("studentNo");
        
        GAKUSEIListDAO dao = new GAKUSEIListDAO();
        try {
            dao.deleteStudent(studentNo);
            response.sendRedirect("delete_success.jsp"); // 削除成功ページにリダイレクト
        } catch (Exception e) {
            e.printStackTrace();
            // エラーハンドリング
        }
    }
}
