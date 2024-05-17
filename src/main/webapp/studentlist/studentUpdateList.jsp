<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.GAKUSEIList" %>
<%@ page import="dao.GAKUSEIListDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Update</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            margin: 0;
            padding: 20px;
            box-sizing: border-box;
        }

        .container {
            max-width: 800px;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }

        form {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            margin-right: 10px;
        }

        input[type="text"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 200px;
            margin-right: 10px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a {
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #0056b3;
        }

        .scroll-to-top, .back-to-main {
            position: fixed;
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            border-radius: 50%;
            text-align: center;
            font-size: 20px;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
        }

        .scroll-to-top:hover, .back-to-main:hover {
            background-color: #0056b3;
        }

        .scroll-to-top {
            bottom: 20px;
            right: 20px;
        }

        .back-to-main {
            bottom: 20px;
            left: 20px;
            padding: 10px 15px; /* Ensure enough padding for the text */
            border-radius: 5px; /* Change to rounded rectangle for readability */
            font-size: 16px; /* Adjust font size for readability */
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
    <script>
        function scrollToTop() {
            window.scrollTo({
                top: 0,
                behavior: "smooth"
            });
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Student Update</h1>
        <form action="../student/StudentSearch.action" method="get">
            <label for="studentNo">学生番号で検索:</label>
            <input type="text" id="studentNo" name="studentNo">
            <input type="submit" value="検索">
        </form>
        <table>
            <tr>
                <th>NO</th>
                <th>NAME</th>
                <th>ENT_YEAR</th>
                <th>CLASS_NUM</th>
                <th>IS_ATTEND</th>
                <th>SCHOOL_CD</th>
                <th>操作</th>
            </tr>
            <% 
               GAKUSEIListDAO dao = new GAKUSEIListDAO();
               List<GAKUSEIList> list = dao.getAllStudents();
               for(GAKUSEIList student : list) { 
            %>
            <tr>
                <td><%= student.getNO() %></td>
                <td><%= student.getNAME() %></td>
                <td><%= student.getENT_YEAR() %></td>
                <td><%= student.getCLASS_NUM() %></td>
                <td><%= student.isIS_ATTEND() %></td>
                <td><%= student.getSCHOOL_CD() %></td>
                <td><a href="StudentUpdateForm.jsp?studentNo=<%= student.getNO() %>">変更</a></td>
            </tr>
            <% }
            %>
        </table>
    </div>
    <div class="scroll-to-top" onclick="scrollToTop()">⬆</div>
    <a href="StudentMain.jsp" class="back-to-main">メニューに戻る</a>
</body>
</html>
