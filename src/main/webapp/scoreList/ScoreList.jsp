<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.SCOREList" %>
<%@ page import="dao.ScoreDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Score List</title>
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
    <h1>Score List</h1>
    <a href="javascript:void(0)" onclick="scrollToTop()">ページの一番上へ戻る</a>
    <table border="1">
        <tr>
            <th>学生番号</th>
            <th>科目コード</th>
            <th>学校コード</th>
            <th>得点</th>
            <th>クラス</th>
        </tr>
       <% 
           ScoreDAO dao = new ScoreDAO();
           List<SCOREList> list = dao.getAllStudents();
           for(SCOREList student : list) { %>
               <tr>
                   <td><%= student.getStudentNo() %></td>
                   <td><%= student.getSubjectCd() %></td>
                   <td><%= student.getSchoolCd() %></td>
                   <td><%= student.getPoint() %></td>
                   <td><%= student.getClassNum() %></td>
               </tr>
           <% } %>
    </table>
    <br>
    <a href="scoreMain.jsp">scoreMain.jspに戻る</a>
</body>
</html>
