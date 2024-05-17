<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Update Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 10px;
            box-sizing: border-box;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 500px;
            width: 100%;
        }

        h1 {
            color: #007bff;
            margin-bottom: 20px;
            font-size: 24px;
        }

        p {
            color: #333;
            margin-bottom: 20px;
            font-size: 18px;
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            font-size: 16px;
        }

        a:hover {
            background-color: #0056b3;
        }

        /* Responsive adjustments */
        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }

            h1 {
                font-size: 20px;
            }

            p {
                font-size: 16px;
            }

            a {
                font-size: 14px;
                padding: 8px 16px;
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
        <h1>学生情報の変更が成功しました。</h1>
        <p>学生情報が正常に更新されました。</p>
        <a href="../studentlist/StudentList.jsp" class="back-link">学生一覧に戻る</a>
    </div>
</body>
</html>
