<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>成績変更</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 50%;
        margin: 50px auto;
        background-color: #fff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    form {
        text-align: center;
    }

    label {
        display: block;
        margin-bottom: 10px;
        color: #666;
        font-weight: bold;
    }

    input[type="text"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        margin-bottom: 20px;
        box-sizing: border-box;
        font-size: 16px;
    }

    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }
      /* カーソルエフェクトのスタイル */
    .cursor-effect {
        position: absolute;
        width: 20px;
        height: 20px;
        background-color: rgba(0, 123, 255, 0.5);
        border-radius: 50%;
        pointer-events: none;
        transform: translate(-50%, -50%);
        transition: transform 0.1s ease;
        z-index: 1000;
    }
</style>
</head>
<body>
<div class="container">
    <h1>成績変更</h1>
    <form action="../score/ScoreUpdateAction" method="post">
        <label for="studentNo">学生番号:</label>
        <input type="text" id="studentNo" name="studentNo">
        <label for="subjectCd">科目コード:</label>
        <input type="text" id="subjectCd" name="subjectCd">
        <label for="schoolCd">学校コード:</label>
        <input type="text" id="schoolCd" name="schoolCd">
        <label for="no">NO:</label>
        <input type="text" id="no" name="no">
        <label for="point">得点:</label>
        <input type="text" id="point" name="point">
        <label for="classNum">クラス:</label>
        <input type="text" id="classNum" name="classNum">
        <input type="submit" value="更新">
    </form>
</div>
</body>
</html>
