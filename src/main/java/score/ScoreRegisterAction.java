package score;
import java.awt.event.ActionEvent;
import java.beans.PropertyChangeListener;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.swing.Action;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ScoreRegisterAction implements Action {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentNo = request.getParameter("studentNo");
        String subjectCd = request.getParameter("subjectCd");
        String schoolCd = request.getParameter("schoolCd");
        int no = Integer.parseInt(request.getParameter("no"));
        int point = Integer.parseInt(request.getParameter("point"));
        int classNum = Integer.parseInt(request.getParameter("classNum"));

        try {
            Connection conn = DriverManager.getConnection("jdbc:your_database_url", "your_username", "your_password");
            String sql = "INSERT INTO TEST (STUDENT_NO, SUBJECT_CD, SCHOOL_CD, NO, POINT, CLASS_NUM) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, studentNo);
            stmt.setString(2, subjectCd);
            stmt.setString(3, schoolCd);
            stmt.setInt(4, no);
            stmt.setInt(5, point);
            stmt.setInt(6, classNum);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new score was inserted successfully!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("ScoreListServlet");
    }

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO 自動生成されたメソッド・スタブ
		
	}

	@Override
	public Object getValue(String key) {
		// TODO 自動生成されたメソッド・スタブ
		return null;
	}

	@Override
	public void putValue(String key, Object value) {
		// TODO 自動生成されたメソッド・スタブ
		
	}

	@Override
	public void setEnabled(boolean b) {
		// TODO 自動生成されたメソッド・スタブ
		
	}

	@Override
	public boolean isEnabled() {
		// TODO 自動生成されたメソッド・スタブ
		return false;
	}

	@Override
	public void addPropertyChangeListener(PropertyChangeListener listener) {
		// TODO 自動生成されたメソッド・スタブ
		
	}

	@Override
	public void removePropertyChangeListener(PropertyChangeListener listener) {
		// TODO 自動生成されたメソッド・スタブ
		
	}
}
