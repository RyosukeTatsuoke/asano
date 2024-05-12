<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.GAKUSEIList" %>
<%@ page import="dao.GAKUSEIListDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Update</title>
    <script>
        function scrollToTop() {
            window.scrollTo({
                top: 0,
                behavior: "smooth"
            });
        }
    </script>
</head>
<body>
    <h1>Student Update</h1>
    <form action="StudentSearchServlet" method="get">
        <label for="studentNo">学生番号で検索:</label>
        <input type="text" id="studentNo" name="studentNo">
        <input type="submit" value="検索">
    </form>
    <a href="javascript:void(0)" onclick="scrollToTop()">ページの一番上へ戻る</a>
    <table border="1">
        <tr>
            <th>NO</th>
            <th>NAME</th>
            <th>ENT_YEAR</th>
            <th>CLASS_NUM</th>
            <th>IS_ATTEND</th>
            <th>SCHOOL_CD</th>
            <th>操作</th>
        </tr>
        <% 
           GAKUSEIListDAO dao = new GAKUSEIListDAO();
           List<GAKUSEIList> list = dao.getAllStudents();
           for(GAKUSEIList student : list) { 
        %>
        <tr>
            <td><%= student.getNO() %></td>
            <td><%= student.getNAME() %></td>
            <td><%= student.getENT_YEAR() %></td>
            <td><%= student.getCLASS_NUM() %></td>
            <td><%= student.isIS_ATTEND() %></td>
            <td><%= student.getSCHOOL_CD() %></td>
            <td><a href="StudentUpdateForm.jsp?studentNo=${student.NO}">変更</a></td>
        </tr>
        <% }
        %>
    </table>
    <br>
    <a href="StudentMain.jsp">StudentMain.jspに戻る</a>
</body>
</html>
