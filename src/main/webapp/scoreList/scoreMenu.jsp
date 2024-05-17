<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>

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
    }

    /* 見出しのスタイル */
    h1 {
        text-align: center;
        margin: 40px 0;
        border-bottom: 2px solid #000;
        line-height: 0.1em;
        font-size: 2.5em; /* フォントサイズを大きくする */
        color: #333;
    }

    h1 span {
        background: #f0f8ff; /* 背景色と同じ色で文字を覆う */
        padding: 0 20px; /* 文字の周りに余白を追加して見やすくする */
        color: #007bff; /* 文字色を変更 */
    }

    /* リンクのスタイル */
    .links-container {
        display: flex;
        justify-content: center;
        flex-wrap: wrap; /* リンクを折り返す */
        width: 100%;
        margin: 20px 0;
        padding: 20px;
        background-color: rgba(0, 123, 255, 0.1); /* 背景色を追加 */
        border-radius: 10px; /* 角を丸くする */
    }

    .links-container a {
        color: #007bff; /* リンクの色 */
        text-decoration: none;
        transition: color 0.3s ease, transform 0.3s ease; /* 色と拡大の変化にアニメーションを追加 */
        position: relative;
        font-size: 1.2em; /* フォントサイズを大きくする */
        margin: 10px 20px; /* リンク間のスペースを追加 */
        padding: 10px 20px; /* リンク自体のパディングを追加 */
        border-radius: 5px; /* リンクの角を丸くする */
        background-color: rgba(0, 123, 255, 0.1); /* リンク背景色 */
    }

    .links-container a::after {
        content: '';
        position: absolute;
        bottom: -5px;
        left: 50%;
        width: 0;
        height: 2px;
        background-color: #007bff; /* 下線の色 */
        transition: width 0.3s ease;
        transform: translateX(-50%);
    }

    .links-container a:hover {
        color: #0056b3;
        transform: scale(1.05); /* リンクを少し拡大 */
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
</style>

<%@include file="../footer.html" %>

<h1><span>成績管理メニュー</span></h1>

<div class="links-container">
    <a href="scoreList.jsp">成績一覧を表示</a>
    <a href="ScoreRegister.jsp">成績登録を行う</a>
    <a href="ScoreUpdate.jsp">成績変更を行う</a>
    <a href="ScoreDelete.jsp">成績削除を行う</a>
</div>
