package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.GAKUSEIList;

public class GAKUSEIListDAO {

    private static final String URL = "jdbc:h2:tcp://localhost/~/score1";
    private static final String USERNAME = "sa";
    private static final String PASSWORD = "";

    private Connection getConnection() throws Exception {
        Class.forName("org.h2.Driver");
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }

    private void close(Connection connection, PreparedStatement statement, ResultSet resultSet) {
        try {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<GAKUSEIList> getAllStudents() throws Exception {
        List<GAKUSEIList> studentList = new ArrayList<>();

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            String query = "SELECT * FROM STUDENT";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                GAKUSEIList student = new GAKUSEIList();
                student.setNO(resultSet.getString("NO"));
                student.setNAME(resultSet.getString("NAME"));
                student.setENT_YEAR(resultSet.getInt("ENT_YEAR"));
                student.setCLASS_NUM(resultSet.getInt("CLASS_NUM"));
                student.setIS_ATTEND(resultSet.getBoolean("IS_ATTEND"));
                student.setSCHOOL_CD(resultSet.getString("SCHOOL_CD"));
                studentList.add(student);
            }
        } finally {
            close(connection, statement, resultSet);
        }

        return studentList;
    }
    
    public void addStudent(GAKUSEIList student) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = getConnection();
            String query = "INSERT INTO STUDENT (NAME, ENT_YEAR, CLASS_NUM, IS_ATTEND, SCHOOL_CD) VALUES (?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(query);
            statement.setString(1, student.getNAME());
            statement.setInt(2, student.getENT_YEAR());
            statement.setInt(3, student.getCLASS_NUM());
            statement.setBoolean(4, student.isIS_ATTEND());
            statement.setString(5, student.getSCHOOL_CD());
            statement.executeUpdate();
        } finally {
            close(connection, statement, null);
        }
    }
    
    public void updateStudent(GAKUSEIList student) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = getConnection();
            String query = "UPDATE STUDENT SET NAME=?, ENT_YEAR=?, CLASS_NUM=?, IS_ATTEND=?, SCHOOL_CD=? WHERE NO=?";
            statement = connection.prepareStatement(query);
            statement.setString(1, student.getNAME());
            statement.setInt(2, student.getENT_YEAR());
            statement.setInt(3, student.getCLASS_NUM());
            statement.setBoolean(4, student.isIS_ATTEND());
            statement.setString(5, student.getSCHOOL_CD());
            statement.setString(6, student.getNO());
            statement.executeUpdate();
        } finally {
            close(connection, statement, null);
        }
    }
    
    public void deleteStudent(String studentNo) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = getConnection();
            String query = "DELETE FROM STUDENT WHERE NO=?";
            statement = connection.prepareStatement(query);
            statement.setString(1, studentNo);
            statement.executeUpdate();
        } finally {
            close(connection, statement, null);
        }
    }
    
    public GAKUSEIList getStudentByNo(String studentNo) throws Exception {
        GAKUSEIList student = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            String query = "SELECT * FROM STUDENT WHERE NO = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, studentNo);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                student = new GAKUSEIList();
                student.setNO(resultSet.getString("NO"));
                student.setNAME(resultSet.getString("NAME"));
                student.setENT_YEAR(resultSet.getInt("ENT_YEAR"));
                student.setCLASS_NUM(resultSet.getInt("CLASS_NUM"));
                student.setIS_ATTEND(resultSet.getBoolean("IS_ATTEND"));
                student.setSCHOOL_CD(resultSet.getString("SCHOOL_CD"));
            }
        } finally {
            close(connection, statement, resultSet);
        }

        return student;
    }



    
    

}
