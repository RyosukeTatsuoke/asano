<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.jsp" %>

<style>
    /* ページ全体のスタイル */
    body {
        display: flex;
        flex-direction: column;
        align-items: center;
        background-color: #f0f8ff; /* ページ全体の背景色を変更 */
        font-family: 'Helvetica Neue', Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    /* 見出しのスタイル */
    .project-title {
        text-align: center;
        margin: 40px 0;
        border-bottom: 2px solid #000;
        line-height: 0.1em;
        font-size: 3em; /* フォントサイズをさらに大きくする */
        color: #333;
    }

    .project-title span {
        background: #f0f8ff; /* 背景色と同じ色で文字を覆う */
        padding: 0 20px; /* 文字の周りに余白を追加して見やすくする */
        color: #333; /* 文字色を変更 */
    }

    /* リンクのスタイル */
    .links-container {
        display: flex;
        justify-content: center; /* リンクを中央揃えにする */
        width: 80%;
        margin: 20px 0;
        padding: 20px;
        background-color: rgba(0, 123, 255, 0.05); /* 背景色をさらに淡く */
        border-radius: 15px; /* 角をさらに丸くする */
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* ボックスシャドウを追加 */
    }

    .link-group, .link-single {
        display: flex;
        flex-direction: column; /* リンクを縦に並べる */
        align-items: center; /* リンクを中央揃えにする */
        justify-content: center; /* リンクを垂直方向に中央揃えにする */
        margin: 0 20px; /* グループ間のスペースを追加 */
        min-height: 200px; /* ボックスの最小高さを設定 */
    }

    .link-item {
        background-color: #007bff; /* プライマリカラー */
        color: #fff;
        padding: 1em 2em;
        text-decoration: none;
        transition: background-color 0.3s ease, transform 0.3s ease; /* 色と拡大の変化にアニメーションを追加 */
        position: relative;
        font-size: 1.2em; /* フォントサイズを大きくする */
        margin: 10px 0; /* 縦方向のリンク間のスペースを追加 */
        border-radius: 5px; /* リンクの角を丸くする */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* ボックスシャドウを追加 */
    }

    .link-item:hover {
        background-color: #0056b3;
        transform: scale(1.05); /* リンクを少し拡大 */
    }

    .divider {
        border: none;
        border-top: 2px solid #4a4a4a;
        margin: 2em 0;
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
        transition: transform 0.1s ease, background-color 0.3s ease;
        z-index: 1000;
    }

    .cursor-effect:hover {
        background-color: rgba(0, 123, 255, 0.8); /* ホバー時に色を変える */
    }
</style>

<!-- 見出し -->
<h1 class="project-title"><span>asanoproject</span></h1>

<!-- リンクのコンテナ -->
<div class="links-container">
    <div class="link-single">
        <a href="../studentlist/StudentMain.jsp" class="link-item">学生管理</a>
    </div>
    <div class="link-group">
        <a href="../scoreList/scoreMenu.jsp" class="link-item">成績管理</a>
        <a href="../scoreList/scoreMenu.jsp" class="link-item">成績登録</a>
        <a href="../scoreList/scoreMenu.jsp" class="link-item">成績参照</a>
    </div>
    <div class="link-single">
        <a href="#" class="link-item">科目管理</a>
    </div>
</div>

<hr class="divider">

<!-- カーソルエフェクト要素 -->
<div class="cursor-effect" id="cursor"></div>

<%@include file="../footer.html" %>

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
