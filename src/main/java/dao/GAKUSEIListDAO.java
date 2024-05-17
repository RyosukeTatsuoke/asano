package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.GAKUSEIList;

public class GAKUSEIListDAO {

    private static final String URL = "jdbc:h2:tcp://localhost/~/score1";
    private static final String USERNAME = "sa";
    private static final String PASSWORD = "";

    public List<GAKUSEIList> getAllStudents() {
        List<GAKUSEIList> studentList = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM STUDENT");
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                GAKUSEIList student = extractStudentFromResultSet(resultSet);
                studentList.add(student);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return studentList;
    }

    public void addStudent(GAKUSEIList student) {
        int newStudentNo = getLastStudentNo() + 1; // NO列の値を生成

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(
                     "INSERT INTO STUDENT (NO, NAME, ENT_YEAR, CLASS_NUM, IS_ATTEND, SCHOOL_CD) VALUES (?, ?, ?, ?, ?, ?)")) {

            statement.setInt(1, newStudentNo); // NO列に値を設定
            statement.setString(2, student.getNAME());
            statement.setInt(3, student.getENT_YEAR());
            statement.setInt(4, student.getCLASS_NUM());
            statement.setBoolean(5, student.isIS_ATTEND());
            statement.setString(6, student.getSCHOOL_CD());
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateStudent(GAKUSEIList student) {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(
                     "UPDATE STUDENT SET NAME=?, ENT_YEAR=?, CLASS_NUM=?, IS_ATTEND=?, SCHOOL_CD=? WHERE NO=?")) {

            statement.setString(1, student.getNAME());
            statement.setInt(2, student.getENT_YEAR());
            statement.setInt(3, student.getCLASS_NUM());
            statement.setBoolean(4, student.isIS_ATTEND());
            statement.setString(5, student.getSCHOOL_CD());
            statement.setString(6, student.getNO());
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteStudent(String studentNo) {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("DELETE FROM STUDENT WHERE NO=?")) {

            statement.setString(1, studentNo);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public GAKUSEIList getStudentByNo(String studentNo) {
        GAKUSEIList student = null;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM STUDENT WHERE NO = ?")) {

            statement.setString(1, studentNo);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    student = extractStudentFromResultSet(resultSet);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return student;
    }

    public int getLastStudentNo() {
        int lastStudentNo = 0;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT MAX(NO) AS LAST_NO FROM STUDENT");
             ResultSet resultSet = statement.executeQuery()) {

            if (resultSet.next()) {
                lastStudentNo = resultSet.getInt("LAST_NO");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // ここでSQLExceptionを処理します。
        } catch (Exception e) {
            e.printStackTrace();
            // ここでその他の例外を処理します。
        }
        return lastStudentNo;
    }

    private GAKUSEIList extractStudentFromResultSet(ResultSet resultSet) throws Exception {
        GAKUSEIList student = new GAKUSEIList();
        student.setNO(resultSet.getString("NO"));
        student.setNAME(resultSet.getString("NAME"));
        student.setENT_YEAR(resultSet.getInt("ENT_YEAR"));
        student.setCLASS_NUM(resultSet.getInt("CLASS_NUM"));
        student.setIS_ATTEND(resultSet.getBoolean("IS_ATTEND"));
        student.setSCHOOL_CD(resultSet.getString("SCHOOL_CD"));
        return student;
    }

    private Connection getConnection() throws Exception {
        Class.forName("org.h2.Driver");
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }
}
