package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.GAKUSEIList;

public class GAKUSEIListDAO {

    public List<GAKUSEIList> getAllStudents() throws Exception {
        List<GAKUSEIList> studentList = new ArrayList<>();
        
        // データベースへの接続
        Class.forName("org.h2.Driver");
        Connection connection = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/score1", "sa", "");

        // SQL文の準備と実行
        String query = "SELECT * FROM STUDENT";
        PreparedStatement statement = connection.prepareStatement(query);
        ResultSet resultSet = statement.executeQuery();

        // 結果の処理
        while (resultSet.next()) {
            GAKUSEIList student = new GAKUSEIList();
            student.setNO(resultSet.getString("NO"));
            student.setNAME(resultSet.getString("NAME"));
            student.setENT_YEAR(resultSet.getString("ENT_YEAR"));
            student.setCLASS_NUM(resultSet.getString("CLASS_NUM"));
            student.setIS_ATTEND(resultSet.getString("IS_ATTEND"));
            student.setSCHOOL_CD(resultSet.getString("SCHOOL_CD"));
            studentList.add(student);
        }

        // リソースの解放
        resultSet.close();
        statement.close();
        connection.close();

        return studentList;
    }

    public List<GAKUSEIList> search(String searchString) throws Exception {
        List<GAKUSEIList> studentList = new ArrayList<>();
        
        // データベースへの接続
        Class.forName("org.h2.Driver");
        Connection connection = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/score1", "sa", "");

        // SQL文の準備と実行
        String query = "SELECT * FROM STUDENT WHERE NAME LIKE ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, "%" + searchString + "%");
        ResultSet resultSet = statement.executeQuery();

        // 結果の処理
        while (resultSet.next()) {
            GAKUSEIList student = new GAKUSEIList();
            student.setNO(resultSet.getString("NO"));
            student.setNAME(resultSet.getString("NAME"));
            student.setENT_YEAR(resultSet.getString("ENT_YEAR"));
            student.setCLASS_NUM(resultSet.getString("CLASS_NUM"));
            student.setIS_ATTEND(resultSet.getString("IS_ATTEND"));
            student.setSCHOOL_CD(resultSet.getString("SCHOOL_CD"));
            studentList.add(student);
        }

        // リソースの解放
        resultSet.close();
        statement.close();
        connection.close();

        return studentList;
    }
}
