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

    private static final String URL = "jdbc:h2:tcp://localhost/~/score1";
    private static final String USERNAME = "sa";
    private static final String PASSWORD = "";

    private static String INSERT_SCORE_QUERY = "INSERT INTO TEST (STUDENT_NO, SUBJECT_CD, SCHOOL_CD, NO, POINT, CLASS_NUM) VALUES (?, ?, ?, ?, ?, ?)";

    // SQLクエリの定数化
    private static final String SELECT_ALL_STUDENTS_QUERY = "SELECT STUDENT_NO, SUBJECT_CD, SCHOOL_CD, NO, POINT, CLASS_NUM FROM TEST";
    private static final String INSERT_STUDENT_QUERY = "INSERT INTO TEST (STUDENT_NO, SUBJECT_CD, SCHOOL_CD, NO, POINT, CLASS_NUM) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String UPDATE_STUDENT_QUERY = "UPDATE TEST SET STUDENT_NO=?, SUBJECT_CD=?, SCHOOL_CD=?, NO=?, POINT=?, CLASS_NUM=? WHERE STUDENT_NO=?";
    private static final String DELETE_STUDENT_QUERY = "DELETE FROM TEST WHERE STUDENT_NO=?";
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
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
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
            statement.setInt(4, student.getPoint());
            statement.setInt(5, student.getClassNum());
            statement.executeUpdate();
        }
    }

    public void updateScore(SCOREList student) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_STUDENT_QUERY)) {

            statement.setString(1, student.getStudentNo());
            statement.setString(2, student.getSubjectCd());
            statement.setString(3, student.getSchoolCd());
            statement.setInt(4, student.getPoint());
            statement.setInt(5, student.getClassNum());
            statement.setString(6, student.getStudentNo());
            statement.executeUpdate();
        }
    }

    public void deleteScore(String studentNo) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_STUDENT_QUERY)) {

            statement.setString(1, studentNo);
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
                    student.setPoint(resultSet.getInt("POINT"));
                    student.setClassNum(resultSet.getInt("CLASS_NUM"));
                }
            }
        }

        return student;
    }

	public static String getINSERT_SCORE_QUERY() {
		return INSERT_SCORE_QUERY;
	}

	public static void setINSERT_SCORE_QUERY(String iNSERT_SCORE_QUERY) {
		INSERT_SCORE_QUERY = iNSERT_SCORE_QUERY;
	}
}
