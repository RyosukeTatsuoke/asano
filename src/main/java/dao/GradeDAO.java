package dao;

import java.awt.Point;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GradeDAO {
    private Connection connection;

    public GradeDAO(Connection connection) {
        this.connection = connection;
    }

    // 成績情報をデータベースから取得するメソッド
    public List<Point> getAllPoints() throws SQLException {
        List<Point> points = new ArrayList<>();
        String query = "SELECT * FROM grades";
        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Point point = new Point();
                point.setId(rs.getInt("id"));
                point.setStudentId(rs.getInt("student_id"));
                point.setSubject(rs.getString("subject"));
                point.setScore(rs.getInt("score"));
                points.add(point);
            }
        }
        return points;
    }

    // 成績情報を追加するメソッド
    public void addPoint(Point point) throws SQLException {
        String query = "INSERT INTO grades (student_id, subject, score) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, point.getStudentId());
            stmt.setString(2, point.getSubject());
            stmt.setInt(3, point.getScore());
            stmt.executeUpdate();
        }
    }

    // 成績情報を更新するメソッド
    public void updatePoint(Point point) throws SQLException {
        String query = "UPDATE grades SET student_id=?, subject=?, score=? WHERE id=?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, point.getStudentId());
            stmt.setString(2, point.getSubject());
            stmt.setInt(3, point.getScore());
            stmt.setInt(4, point.getId());
            stmt.executeUpdate();
        }
    }

    // 成績情報を削除するメソッド
    public void deletePoint(int pointId) throws SQLException {
        String query = "DELETE FROM grades WHERE id=?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, pointId);
            stmt.executeUpdate();
        }
    }
}
