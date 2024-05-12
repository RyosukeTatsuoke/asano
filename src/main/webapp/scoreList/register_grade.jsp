<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>成績登録</title>
</head>
<body>
    <h1>成績登録</h1>
    <form action="GradeServlet" method="post">
        <label for="studentId">学生番号:</label>
        <input type="text" id="studentId" name="studentId"><br><br>
        
        <label for="subject">科目:</label>
        <input type="text" id="subject" name="subject"><br><br>
        
        <label for="score">点数:</label>
        <input type="text" id="score" name="score"><br><br>
        
        <input type="submit" value="登録">
    </form>
</body>
</html>
