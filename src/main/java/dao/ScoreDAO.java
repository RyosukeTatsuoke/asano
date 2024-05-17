package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.SCOREList;

public class ScoreDAO {

    // SQLクエリの定数化
    private static final String SELECT_ALL_STUDENTS_QUERY = "SELECT STUDENT_NO, SUBJECT_CD, SCHOOL_CD, NO, POINT, CLASS_NUM FROM TEST";
    private static final String INSERT_STUDENT_QUERY = "INSERT INTO TEST (STUDENT_NO, SUBJECT_CD, SCHOOL_CD, NO, POINT, CLASS_NUM) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String UPDATE_STUDENT_QUERY = "UPDATE TEST SET STUDENT_NO=?, SUBJECT_CD=?, SCHOOL_CD=?, NO=?, POINT=?, CLASS_NUM=? WHERE STUDENT_NO=?";
    private static final String DELETE_STUDENT_QUERY = "DELETE FROM TEST WHERE STUDENT_NO=? AND SUBJECT_CD=? AND SCHOOL_CD=? AND NO=?";
    private static final String SELECT_STUDENT_BY_NO_QUERY = "SELECT * FROM TEST WHERE STUDENT_NO = ?";

    // JDBCドライバをロードするためのstaticブロック
    static {
        try {
            Class.forName("org.h2.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:h2:tcp://localhost/~/score1", "sa", "");
    }

    public List<SCOREList> getAllStudents() throws SQLException {
        List<SCOREList> studentList = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL_STUDENTS_QUERY);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                SCOREList student = new SCOREList();
                student.setStudentNo(resultSet.getString("STUDENT_NO"));
                student.setSubjectCd(resultSet.getString("SUBJECT_CD"));
                student.setSchoolCd(resultSet.getString("SCHOOL_CD"));
                student.setNo(resultSet.getInt("NO"));
                student.setPoint(resultSet.getInt("POINT"));
                student.setClassNum(resultSet.getInt("CLASS_NUM"));
                studentList.add(student);
            }
        }

        return studentList;
    }

    public void addScore(SCOREList student) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_STUDENT_QUERY)) {

            statement.setString(1, student.getStudentNo());
            statement.setString(2, student.getSubjectCd());
            statement.setString(3, student.getSchoolCd());
            statement.setInt(4, student.getNo());
            statement.setInt(5, student.getPoint());
            statement.setInt(6, student.getClassNum());
            statement.executeUpdate();
        }
    }

    public void updateScore(SCOREList student) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_STUDENT_QUERY)) {

            statement.setString(1, student.getStudentNo());
            statement.setString(2, student.getSubjectCd());
            statement.setString(3, student.getSchoolCd());
            statement.setInt(4, student.getNo());
            statement.setInt(5, student.getPoint());
            statement.setInt(6, student.getClassNum());
            statement.setString(7, student.getStudentNo());
            statement.executeUpdate();
        }
    }

    public void deleteScore(String studentNo, String subjectCd, String schoolCd, String no) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_STUDENT_QUERY)) {

            statement.setString(1, studentNo);
            statement.setString(2, subjectCd);
            statement.setString(3, schoolCd);
            statement.setString(4, no);
            statement.executeUpdate();
        }
    }

    public SCOREList getScoreByNo(String studentNo) throws SQLException {
        SCOREList student = null;

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_STUDENT_BY_NO_QUERY)) {

            statement.setString(1, studentNo);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    student = new SCOREList();
                    student.setStudentNo(resultSet.getString("STUDENT_NO"));
                    student.setSubjectCd(resultSet.getString("SUBJECT_CD"));
                    student.setSchoolCd(resultSet.getString("SCHOOL_CD"));
                    student.setNo(resultSet.getInt("NO"));
                    student.setPoint(resultSet.getInt("POINT"));
                    student.setClassNum(resultSet.getInt("CLASS_NUM"));
                }
            }
        }

        return student;
    }
}
