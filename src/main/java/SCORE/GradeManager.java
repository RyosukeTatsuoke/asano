package SCORE;

import java.sql.SQLException;

import bean.SCOREList;
import dao.ScoreDAO;

public class GradeManager {
    
    // ScoreDAOインスタンスを生成
    private ScoreDAO scoreDAO;
    
    public GradeManager() {
        // ScoreDAOのインスタンス化
        scoreDAO = new ScoreDAO();
    }

    // 成績を登録するメソッド
    public void registerGrade(String studentId, String subject, int score) {
        // SCOREListオブジェクトを生成して値をセット
        SCOREList scoreList = new SCOREList();
        scoreList.setStudentNo(studentId);
        scoreList.setSubjectCd(subject);
        
        // ここで学校コードやクラス番号を設定する必要がありますが、この情報が利用できない場合は適切な値を設定する必要があります
        
        scoreList.setPoint(score);
        
        try {
            // ScoreDAOを使用して成績を登録
            scoreDAO.addScore(scoreList);
            System.out.println("成績を登録しました。");
        } catch (SQLException e) {
            System.out.println("成績の登録中にエラーが発生しました。");
            e.printStackTrace();
        }
    }
}
