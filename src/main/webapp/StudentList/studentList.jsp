<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student List</title>
</head>
<body>
    <h1>Student List</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Entrance Year</th>
            <th>Class Number</th>
            <th>Is Attend</th>
            <th>School Code</th>
        </tr>
        <% 
        try {
            String url = "java:/comp/env/jdbc/score";
            String user = "sa";

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, "");

            String query = "SELECT * FROM STUDENT";

            Statement stmt = con.createStatement();
            
            ResultSet rs = stmt.executeQuery(query);

            while(rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("NO") %></td>
                    <td><%= rs.getString("NAME") %></td>
                    <td><%= rs.getInt("ENT_YEAR") %></td>
                    <td><%= rs.getInt("CLASS_NUM") %></td>
                    <td><%= rs.getBoolean("IS_ATTEND") %></td>
                    <td><%= rs.getString("SCHOOL_CD") %></td>
                </tr>
                <%
            }
            
            rs.close();
            stmt.close();
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
        %>
    </table>
</body>
</html>
