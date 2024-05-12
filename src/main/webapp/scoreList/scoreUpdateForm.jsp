<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.SCOREList" %>
<%@ page import="dao.ScoreDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Score Update Form</title>
</head>
<body>
    <h1>Score Update Form</h1>
    
    <%-- URLパラメーターから学生番号を取得 --%>
    <% String studentNo = request.getParameter("studentNo"); %>
    
    <%-- 学生番号をもとに該当する学生のデータを取得 --%>
    <% 
       ScoreDAO dao = new ScoreDAO();
       SCOREList student = dao.getScoreByNo(studentNo);
    %>
    
    <%-- 取得した学生のデータがnullでない場合にフォームを表示 --%>
    <% if(student != null) { %>
        <form action="updateScore.jsp" method="post">
            <input type="hidden" name="studentNo" value="<%= student.getStudentNo() %>">
            <label for="subjectCd">科目コード:</label>
            <input type="text" id="subjectCd" name="subjectCd" value="<%= student.getSubjectCd() %>"><br>
            <label for="schoolCd">学校コード:</label>
            <input type="text" id="schoolCd" name="schoolCd" value="<%= student.getSchoolCd() %>"><br>
            <label for="point">得点:</label>
            <input type="text" id="point" name="point" value="<%= student.getPoint() %>"><br>
            <label for="classNum">クラス:</label>
            <input type="text" id="classNum" name="classNum" value="<%= student.getClassNum() %>"><br>
            <input type="submit" value="更新">
        </form>
    <% } else { %>
        <p>該当する学生のデータが見つかりません。</p>
    <% } %>
</body>
</html>
