<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ScoreDAO" %>
<%@ page import="bean.SCOREList" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>成績削除</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 80%;
        margin: 50px auto;
        background-color: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    }

    h1 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
        font-size: 28px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        padding: 8px; /* パディングを少し小さく */
        border: 1px solid #ddd;
        text-align: center;
    }

    th {
        background-color: #f8f8f8;
        color: #333;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    @media (max-width: 768px) {
        .container {
            width: 90%;
            margin: 20px auto;
            padding: 20px;
        }

        h1 {
            font-size: 24px;
        }

        th, td {
            padding: 6px; /* パディングをさらに小さく */
            font-size: 12px; /* フォントサイズを小さく */
        }
    }

    #backToTop, #backToMenu, #deleteSelected {
        position: fixed;
        bottom: 20px;
        right: 20px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        padding: 8px 16px; /* パディングを小さく */
        font-size: 14px; /* フォントサイズを小さく */
        cursor: pointer;
        transition: background-color 0.3s ease;
        margin-bottom: 10px;
    }

    #backToTop:hover, #backToMenu:hover, #deleteSelected:hover {
        background-color: #45a049;
    }

    #backToMenu {
        bottom: 90px;
    }

    #deleteSelected {
        bottom: 60px;
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
<script>
    function scrollToTop() {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }
</script>
</head>
<body>
<div class="container">
    <h1>成績削除</h1>
    <form action="../score/ScoreDelete.action" method="post">
        <table id="scoreTable">
            <thead>
                <tr>
                    <th>選択</th>
                    <th>学生番号</th>
                    <th>科目コード</th>
                    <th>学校コード</th>
                    <th>NO</th>
                    <th>得点</th>
                    <th>クラス</th>
                </tr>
            </thead>
            <tbody>
                <% 
                   ScoreDAO dao = new ScoreDAO();
                   List<SCOREList> list = dao.getAllStudents();
                   for(SCOREList score : list) { %>
                       <tr>
                           <td><input type="checkbox" name="selectedScores" value="<%= score.getStudentNo() %>,<%= score.getSubjectCd() %>,<%= score.getSchoolCd() %>,<%= score.getNo() %>"></td>
                           <td><%= score.getStudentNo() %></td>
                           <td><%= score.getSubjectCd() %></td>
                           <td><%= score.getSchoolCd() %></td>
                           <td><%= score.getNo() %></td>
                           <td><%= score.getPoint() %></td>
                           <td><%= score.getClassNum() %></td>
                       </tr>
                   <% }
                %>
            </tbody>
        </table>
        <button id="deleteSelected" type="submit">
            選択した成績を削除
        </button>
    </form>
</div>
<button id="backToMenu" onclick="window.location.href='scoreMenu.jsp'">メニューに戻る</button>
<button id="backToTop" onclick="scrollToTop()">トップに戻る</button>
</body>
</html>
