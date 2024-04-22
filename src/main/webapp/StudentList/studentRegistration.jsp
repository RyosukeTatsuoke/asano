<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>新規学生登録</title>
</head>
<body>
    <h1>新規学生登録</h1>
    <form action="studentRegistration" method="post">
        <label for="name">氏名:</label>
        <input type="text" id="name" name="name" required><br>
        <label for="entYear">入学年度:</label>
        <input type="text" id="entYear" name="entYear" required><br>
        <label for="classNum">クラス:</label>
        <select id="classNum" name="classNum">
            <option value="101">101</option>
            <option value="201">201</option>
            <!-- 他のクラスのオプションを追加する場合はここに追加 -->
        </select><br>
        <label for="isAttend">在学状況:</label>
        <select id="isAttend" name="isAttend">
            <option value="TRUE">在学中</option>
            <option value="FALSE">退学中</option>
            <!-- 他の在学状況のオプションを追加する場合はここに追加 -->
        </select><br>
        <label for="schoolCd">学校コード:</label>
        <select id="schoolCd" name="schoolCd">
            <option value="tky">tky</option>
            <option value="oom">oom</option>
            <!-- 他の学校コードのオプションを追加する場合はここに追加 -->
        </select><br>
        <input type="submit" value="登録">
    </form>
</body>
</html>
