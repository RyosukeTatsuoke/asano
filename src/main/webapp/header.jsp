<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生情報管理システム</title>
    <!-- ここに必要なCSSファイルのリンクを追加 -->
    <link rel="stylesheet" href="styles.css">
    <style>
        header {
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            text-align: center;
        }

        .logo {
            display: inline-block;
            margin-right: 20px;
        }

        .logo img {
            height: 50px; /* ロゴの高さ */
            width: auto; /* ロゴの幅を自動調整 */
            vertical-align: middle; /* ロゴを垂直中央に配置 */
        }

        .user-info,
        .settings {
            display: inline-block;
            vertical-align: middle; /* 要素を垂直中央に配置 */
        }

        .user-info span {
            margin-right: 20px;
        }

        .settings a {
            color: #fff;
            margin-left: 10px;
            text-decoration: none;
        }

        footer {
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <h1>学生情報管理システム</h1>
        </div>
        <div class="user-info">
            <span>ユーザー名: 大原 一郎</span>
        </div>
        
        <div class="settings">
            <a href="logout.html">ログアウト</a>
            <a href="settings.html">設定</a>
        </div>
    </header>
</body>
</html>
