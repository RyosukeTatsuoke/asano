<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>学生情報の変更エラー</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
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
            position: relative; /* 追加 */
        }

        h1 {
            text-align: center;
            color: #e53935;
        }

        p {
            text-align: center;
            color: #666;
            margin-bottom: 20px;
        }

        a {
            display: block;
            text-align: center;
            color: #fff;
            background-color: #2196F3;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            width: 200px;
            margin: 0 auto;
        }

        a:hover {
            background-color: #0e7ae6;
        }

        /* カーソルエフェクトのスタイル */
        .cursor-effect {
            position: fixed;
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

    <h1>学生検索中にエラーが発生しました。</h1>
    <p>申し訳ありませんが、学生の検索中にエラーが発生しました。</p>
    <p>再度試すか、管理者にお問い合わせください。</p>
    <a href="StudentList.jsp">学生一覧に戻る</a>
</div>
</body>
</html>
