<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.GAKUSEIList" %>
<%@ page import="dao.GAKUSEIListDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Update</title>
</head>
<body>
    <h1>Student Update</h1>
    <table border="1">
        <tr>
            <th>NO</th>
            <th>NAME</th>
            <th>ENT_YEAR</th>
            <th>CLASS_NUM</th>
            <th>IS_ATTEND</th>
            <th>SCHOOL_CD</th>
        </tr>
          <% 
           GAKUSEIListDAO dao = new GAKUSEIListDAO();
           List<GAKUSEIList> list = dao.getAllStudents();
           for(GAKUSEIList student : list) { %>
               <tr>
                   <td><%= student.getNO() %></td>
                   <td><%= student.getNAME() %></td>
                   <td><%= Integer.toString(student.getENT_YEAR()) %></td>
                   <td><%= student.getCLASS_NUM() %></td>
                   <td><%= student.isIS_ATTEND() %></td> <!-- メソッド名が isIS_ATTEND() に変わっていることに注意 -->
                   <td><%= student.getSCHOOL_CD() %></td>
                   <td><a href="StudentUpdateForm.jsp?studentNo=${student.NO}">変更</a></td>
                     </tr>
           <% }
        %>
    </table>
</body>
</html>
               