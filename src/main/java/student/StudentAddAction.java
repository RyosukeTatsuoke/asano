package student;

import bean.GAKUSEIList;
import dao.GAKUSEIListDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class StudentAddAction extends Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html");

        // DAOインスタンスの作成
        GAKUSEIListDAO dao = new GAKUSEIListDAO();

        // 最後の学生番号を取得
        int lastStudentNo = dao.getLastStudentNo();

        // 新しい学生番号を設定
        int newStudentNo = lastStudentNo + 1;

        // フォームからの入力データを取得
        String name = request.getParameter("name");
        String ent_year = request.getParameter("ent_year");
        String class_num = request.getParameter("class_num");
        String is_attend = request.getParameter("is_attend");
        String school_cd = request.getParameter("school_cd");

        // 新しい学生を作成
        GAKUSEIList newStudent = new GAKUSEIList();
        newStudent.setNO(String.valueOf(newStudentNo)); // NOを設定
        newStudent.setNAME(name);
        newStudent.setENT_YEAR(Integer.parseInt(ent_year));
        newStudent.setCLASS_NUM(Integer.parseInt(class_num));
        newStudent.setIS_ATTEND(Boolean.parseBoolean(is_attend));
        newStudent.setSCHOOL_CD(school_cd);

        // 学生をデータベースに追加
        dao.addStudent(newStudent);

        // JSPに新しい学生番号を渡す
        request.setAttribute("newStudentNo", newStudentNo);

        // リクエストをフォワード
        RequestDispatcher rd = request.getRequestDispatcher("../studentlist/addComplete.jsp");
        rd.forward(request, response);

        return "../studentlist/addComplete.jsp"; // 正常終了を示すURLを返す
    }
}
