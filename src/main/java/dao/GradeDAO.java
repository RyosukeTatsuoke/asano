package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Grade;

public class GradeDAO {
    private Connection connection;

    public GradeDAO(Connection connection) {
        this.connection = connection;
    }

    // 成績情報をデータベースから取得するメソッド
    public List<Grade> getAllGrades() throws SQLException {
        List<Grade> grades = new ArrayList<>();
        String query = "SELECT * FROM grades";
        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Grade grade = new Grade();
                grade.setId(rs.getInt("id"));
                grade.setStudentId(rs.getInt("student_id"));
                grade.setSubject(rs.getString("subject"));
                grade.setScore(rs.getInt("score"));
                grades.add(grade);
            }
        }
        return grades;
    }

    // 成績情報を追加するメソッド
    public void addGrade(Grade grade) throws SQLException {
        String query = "INSERT INTO grades (student_id, subject, score) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, grade.getStudentId());
            stmt.setString(2, grade.getSubject());
            stmt.setInt(3, grade.getScore());
            stmt.executeUpdate();
        }
    }

    // 成績情報を更新するメソッド
    public void updateGrade(Grade grade) throws SQLException {
        String query = "UPDATE grades SET student_id=?, subject=?, score=? WHERE id=?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, grade.getStudentId());
            stmt.setString(2, grade.getSubject());
            stmt.setInt(3, grade.getScore());
            stmt.setInt(4, grade.getId());
            stmt.executeUpdate();
        }
    }

    // 成績情報を削除するメソッド
    public void deleteGrade(int gradeId) throws SQLException {
        String query = "DELETE FROM grades WHERE id=?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, gradeId);
            stmt.executeUpdate();
        }
    }
}
