<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="/header.html" %>

<style>
    /* ページ全体のスタイル */
    body {
        display: flex;
        flex-direction: column;
        align-items: center;
        background-color: #f0f8ff; /* ページ全体の背景色を変更 */
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        overflow: hidden;
    }

    /* 見出しのスタイル */
    h1 {
        text-align: center;
        margin: 40px 0;
        border-bottom: 2px solid #000;
        line-height: 0.1em;
        font-size: 2.5em;
        color: #333;
    }

    h1 span {
        background: #f0f8ff;
        padding: 0 20px;
        color: #007bff;
    }

    /* リンクのスタイル */
    .links-container {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        width: 100%;
        margin: 20px 0;
        padding: 20px;
        background-color: rgba(0, 123, 255, 0.1);
        border-radius: 10px;
    }

    .links-container a {
        color: #007bff;
        text-decoration: none;
        transition: color 0.3s ease, transform 0.3s ease;
        position: relative;
        font-size: 1.2em;
        margin: 10px 20px;
        padding: 10px 20px;
        border-radius: 5px;
        background-color: rgba(0, 123, 255, 0.1);
    }

    .links-container a::after {
        content: '';
        position: absolute;
        bottom: -5px;
        left: 50%;
        width: 0;
        height: 2px;
        background-color: #007bff;
        transition: width 0.3s ease;
        transform: translateX(-50%);
    }

    .links-container a:hover {
        color: #0056b3;
        transform: scale(1.05);
    }

    .links-container a:hover::after {
        width: 100%;
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

<h1><span>学生管理</span></h1>

<div class="links-container">
    <a href="StudentList.jsp">学生一覧表示</a>
    <a href="studentAdd.jsp">学生追加</a>
    <a href="studentUpdateList.jsp">学生情報変更</a>
    <a href="studentDelete.jsp">学生削除</a>
</div>

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

<%@include file="/footer.html" %>
