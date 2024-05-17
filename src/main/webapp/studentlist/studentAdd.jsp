<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.GAKUSEIListDAO" %>
<%@ page import="bean.GAKUSEIList" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>

<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生追加</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            width: 400px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #444;
            margin-bottom: 20px;
        }

        form {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #666;
            font-weight: bold;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 15px;
            box-sizing: border-box;
            font-size: 16px;
        }

        select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url('data:image/svg+xml;utf8,<svg fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/><path d="M0 0h24v24H0z" fill="none"/></svg>');
            background-repeat: no-repeat;
            background-position-x: calc(100% - 10px);
            background-position-y: center;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .note {
            font-size: 14px;
            color: #888;
            text-align: center;
            margin-top: 15px;
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
    <h1>新規学生追加</h1>
    <form action="../student/StudentAdd.action" method="post">
        <label for="studentNo">学生番号</label>
        <% 
            GAKUSEIListDAO dao = new GAKUSEIListDAO();
            int lastStudentNo = dao.getLastStudentNo();
            int newStudentNo = lastStudentNo + 1;
        %>
        <input type="text" id="studentNo" name="no" value="<%= newStudentNo %>" readonly>
       
        <label for="name">名前</label>
        <input type="text" id="name" name="name" required>
        
        <label for="entYear">入学年度</label>
        <input type="text" id="entYear" name="ent_year" required>
        
        <label for="classNum">クラス番号</label>
        <input type="text" id="classNum" name="class_num" required>
        
        <label for="attendance">出席状況</label>
        <select id="attendance" name="is_attend">
            <option value="true">出席</option>
            <option value="false">欠席</option>
        </select>
        
        <label for="schoolCode">学校コード</label>
        <input type="text" id="schoolCode" name="school_cd" required>
        
        <input type="submit" value="追加">
    </form>
    <p class="note">全ての項目を入力してください</p>
</div>


<!-- カーソルエフェクト要素 -->
<div class="cursor-effect" id="cursor"></div>

<script>
    // カーソル追従の設定
    let mouseX = window.innerWidth / 2;
    let mouseY = window.innerHeight / 2;
    let cursorX = mouseX;
    let cursorY = mouseY;

    document.addEventListener('mousemove', function(e) {
        mouseX = e.pageX;
        mouseY = e.pageY;
    });

    function animateCursor() {
        cursorX += (mouseX - cursorX) * 0.1;
        cursorY += (mouseY - cursorY) * 0.1;

        const cursor = document.getElementById('cursor');
        cursor.style.left = cursorX + 'px';
        cursor.style.top = cursorY + 'px';

        requestAnimationFrame(animateCursor);
    }

    animateCursor();
</script>
</body>
</html>
