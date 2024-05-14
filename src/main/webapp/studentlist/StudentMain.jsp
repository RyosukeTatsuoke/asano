<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>

<style>
    /* ページ全体のスタイル */
    body {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    /* 見出しのスタイル */
    h1 {
        text-align: center;
        margin-bottom: 20px;
        border-bottom: 2px solid #000; /* 下線 */
        line-height: 0.1em; /* 下線の間隔を調整 */
    }

    h1 span {
        background: #f0f8ff; /* 背景色と同じ色で文字を覆う */
        padding: 0 10px; /* 文字の周りに余白を追加して見やすくする */
    }

    /* リンクのスタイル */
    .links-container {
        display: flex;
        justify-content: space-evenly;
        width: 100%;
        margin-top: 20px;
    }

    .links-container a {
        color: #0000ee; /* リンクの色 */
        text-decoration: none;
        transition: color 0.3s ease; /* 色の変化にアニメーションを追加 */
        position: relative; /* 追加 */
    }

    .links-container a::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        width: 0;
        height: 2px;
        background-color: #31aae2; /* 下線の色 */
        transition: .3s;
        transform: translateX(-50%);
    }

    .links-container a:hover::after {
        width: 100%;
    }
</style>

<%@include file="../footer.html" %>

<h1><span>学生管理</span></h1>

<div class="links-container">
    <a href="StudentList.jsp">学生一覧表示</a>
    <a href="studentRegistration.jsp">学生追加</a>
    <a href="studentUpdateList.jsp">学生情報変更</a>
    <a href="delete_student.jsp">学生削除</a>
</div>
