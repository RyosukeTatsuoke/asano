<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生情報変更</title>
</head>
<body>
    <h1>学生情報変更</h1>
    <form action="studentEdit" method="post">
        <label for="studentId">学生ID:</label>
        <input type="text" id="studentId" name="studentId" value="${param.studentId}" readonly><br>
        <label for="name">新しい氏名:</label>
        <input type="text" id="name" name="name" required><br>
        <label for="grade">新しい学年:</label>
        <input type="number" id="grade" name="grade" required><br>
        <input type="submit" value="変更">
    </form>
</body>
</html>
