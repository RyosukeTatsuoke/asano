<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.GAKUSEIList" %>

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
            <th>NO</th>
            <th>NAME</th>
            <th>ENT_YEAR</th>
            <th>CLASS_NUM</th>
            <th>IS_ATTEND</th>
            <th>SCHOOL_CD</th>
        </tr>
        <% List<GAKUSEIList> list = (List<GAKUSEIList>) session.getAttribute("list");
           if(list != null) {
               for(GAKUSEIList student : list) { %>
                   <tr>
                       <td><%= student.getNO() %></td>
                       <td><%= student.getNAME() %></td>
                       <td><%= student.getENT_YEAR() %></td>
                       <td><%= student.getCLASS_NUM() %></td>
                       <td><%= student.getIS_ATTEND() %></td>
                       <td><%= student.getSCHOOL_CD() %></td>
                   </tr>
               <% }
           } %>
    </table>
</body>
</html>
