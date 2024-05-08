<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生情報変更フォーム</title>
</head>
<body>
    <h2>学生情報変更フォーム</h2>
    
    <%-- 変更したい学生の学籍番号を表示 --%>
    <h3>学籍番号: ${param.studentNo}</h3>
    
    <%-- 学生情報を変更するフォーム --%>
    <form action="StudentUpdateServlet" method="post">
        <input type="hidden" name="studentNo" value="${param.studentNo}">
        
        <label for="name">名前:</label>
        <input type="text" id="name" name="name"><br><br>
        
        <label for="entYear">入学年度:</label>
        <input type="text" id="entYear" name="entYear"><br><br>
        
        <label for="classNum">クラス番号:</label>
        <input type="text" id="classNum" name="classNum"><br><br>
        
        <label for="isAttend">出席状況:</label><br>
        <input type="radio" id="attend" name="isAttend" value="true" checked>
        <label for="attend">出席中</label><br>
        <input type="radio" id="absent" name="isAttend" value="false">
        <label for="absent">欠席中</label><br><br>
        
        <label for="schoolCd">学校コード:</label>
        <input type="text" id="schoolCd" name="schoolCd"><br><br>
        
        <input type="submit" value="変更する">
    </form>
</body>
</html>
