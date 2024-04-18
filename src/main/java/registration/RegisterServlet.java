package registration;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        @SuppressWarnings("unused")
		String password = request.getParameter("password");

        // ここでデータベースにユーザー情報を保存する処理を追加する

        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>会員登録完了</h1>");
        out.println("<p>ユーザー名: " + username + "</p>");
        out.println("</body></html>");
    }
}
