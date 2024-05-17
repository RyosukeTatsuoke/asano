<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生情報変更フォーム</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 10px; /* Ensure padding to avoid content touching the edges */
            box-sizing: border-box;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            text-align: center;
            box-sizing: border-box;
            overflow-y: auto; /* Enable scrolling if content is too large */
        }

        h2 {
            color: #007bff;
            margin-bottom: 20px;
        }

        h3 {
            color: #333;
            margin-bottom: 20px;
        }

        label {
            display: block;
            text-align: left;
            margin: 10px 0 5px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"], input[type="submit"], input[type="radio"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="text"] {
            background-color: #f9f9f9;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .radio-group {
            display: flex;
            justify-content: space-between;
        }

        .radio-group label {
            width: auto;
            margin: 0;
        }

        input[type="radio"] {
            width: auto;
            margin-right: 5px;
        }

        .message {
            color: red;
            margin-bottom: 20px;
        }

        /* Responsive adjustments */
        @media (max-height: 600px) {
            .container {
                height: 100%; /* Take full height of the screen */
                padding: 10px;
            }

            h2, h3 {
                font-size: 1.5em; /* Reduce heading size on smaller screens */
                margin-bottom: 15px;
            }

            label, input[type="text"], input[type="submit"], .radio-group {
                margin: 5px 0 15px; /* Reduce margins to save space */
            }
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
</head>
<body>
    <div class="container">
        <h2>学生情報変更フォーム</h2>
        
        <%-- 変更したい学生の学籍番号を表示 --%>
        <h3>学籍番号: ${param.studentNo}</h3>
        
        <%-- 学生情報を変更するフォーム --%>
        <form action="../student/StudentUpdate.action" method="post">
            <input type="hidden" name="studentNo" value="${param.studentNo}">
            
            <label for="name">名前:</label>
            <input type="text" id="name" name="name">
            
            <label for="entYear">入学年度:</label>
            <input type="text" id="entYear" name="entYear">
            
            <label for="classNum">クラス番号:</label>
            <input type="text" id="classNum" name="classNum">
            
            <label for="isAttend">出席状況:</label>
            <div class="radio-group">
                <input type="radio" id="attend" name="isAttend" value="true" checked>
                <label for="attend">出席中</label>
                <input type="radio" id="absent" name="isAttend" value="false">
                <label for="absent">欠席中</label>
            </div>
            
            <label for="schoolCd">学校コード:</label>
            <input type="text" id="schoolCd" name="schoolCd">
            
            <input type="submit" value="変更する">
        </form>
    </div>
</body>
</html>
