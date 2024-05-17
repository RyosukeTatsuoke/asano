<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.GAKUSEIList" %>
<%@ page import="dao.GAKUSEIListDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生一覧</title>
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

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
    }

    th {
        background-color: #007bff;
        color: white;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ddd;
    }

    .back-link {
        position: fixed;
        bottom: 20px;
        left: 20px;
        display: inline-block;
        margin: 20px 0;
        text-decoration: none;
        color: #007bff;
        font-weight: bold;
        padding: 10px 15px;
        border-radius: 5px;
        background-color: #007bff;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s ease;
        z-index: 1000;
    }

    .back-link:hover {
        background-color: #0056b3;
    }

    .scroll-top-button {
        position: fixed;
        bottom: 20px;
        right: 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 50%;
        padding: 15px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        z-index: 999;
        display: none;
    }

    .scroll-top-button:hover {
        background-color: #0056b3;
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
        window.scrollTo({
            top: 0,
            behavior: "smooth"
        });
    }

    function toggleScrollTopButton() {
        var scrollTopButton = document.getElementById("scroll-top-button");
        scrollTopButton.style.display = window.pageYOffset > 20 ? "block" : "none";
    }

    window.onscroll = toggleScrollTopButton;

    function animateCursor() {
        let mouseX = window.innerWidth / 2;
        let mouseY = window.innerHeight / 2;
        let cursorX = mouseX;
        let cursorY = mouseY;

        document.addEventListener('mousemove', function(e) {
            mouseX = e.pageX;
            mouseY = e.pageY;
        });

        function moveCursor() {
            cursorX += (mouseX - cursorX) * 0.1;
            cursorY += (mouseY - cursorY) * 0.1;

            const cursor = document.getElementById('cursor');
            cursor.style.left = cursorX + 'px';
            cursor.style.top = cursorY + 'px';

            requestAnimationFrame(moveCursor);
        }

        moveCursor();
    }

    window.onload = function() {
        toggleScrollTopButton();
        animateCursor();
    };
</script>
</head>
<body>
    <div class="container">
        <h1>学生一覧</h1>
        <table>
            <tr>
                <th>NO</th>
                <th>NAME</th>
                <th>ENT_YEAR</th>
                <th>CLASS_NUM</th>
                <th>IS_ATTEND</th>
                <th>SCHOOL_CD</th>
            </tr>
            <% 
               GAKUSEIListDAO dao = new GAKUSEIListDAO();
               List<GAKUSEIList> list = dao.getAllStudents();
               for(GAKUSEIList student : list) { %>
                   <tr>
                       <td><%= student.getNO() %></td>
                       <td><%= student.getNAME() %></td>
                       <td><%= Integer.toString(student.getENT_YEAR()) %></td>
                       <td><%= student.getCLASS_NUM() %></td>
                       <td><%= student.isIS_ATTEND() %></td>
                       <td><%= student.getSCHOOL_CD() %></td>
                   </tr>
               <% }
            %>
        </table>
        <a href="StudentMain.jsp" class="back-link">メニューに戻る</a>
    </div>
    <button onclick="scrollToTop()" class="scroll-top-button" id="scroll-top-button">Top</button>

    <!-- カーソルエフェクト要素 -->
    <div class="cursor-effect" id="cursor"></div>
</body>
</html>
