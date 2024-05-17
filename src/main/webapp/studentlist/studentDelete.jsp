<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.GAKUSEIList" %>
<%@ page import="dao.GAKUSEIListDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生情報削除</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            color: #007bff;
            margin-bottom: 20px;
        }

        table {
            border-collapse: collapse;
            width: 90%;
            max-width: 1200px;
            margin: 20px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
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

        input[type="submit"] {
            background-color: #d9534f;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #c9302c;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            table {
                width: 100%;
            }

            th, td {
                padding: 10px;
            }

            h2 {
                font-size: 1.5em;
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
</head>
<body>
    <h2>学生情報削除</h2>
    <table>
        <thead>
            <tr>
                <th>NO</th>
                <th>名前</th>
                <th>入学年度</th>
                <th>クラス番号</th>
                <th>出席状況</th>
                <th>学校コード</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <% 
            GAKUSEIListDAO dao = new GAKUSEIListDAO();
            List<GAKUSEIList> list = dao.getAllStudents();
            for(GAKUSEIList student : list) { %>
                <tr>
                    <td><%= student.getNO() %></td>
                    <td><%= student.getNAME() %></td>
                    <td><%= student.getENT_YEAR() %></td>
                    <td><%= student.getCLASS_NUM() %></td>
                    <td><%= student.isIS_ATTEND() ? "出席中" : "欠席中" %></td>
                    <td><%= student.getSCHOOL_CD() %></td>
                    <td>
                        <form action="StudentDelete.action" method="post">
                            <input type="hidden" name="studentNo" value="<%= student.getNO() %>">
                            <input type="submit" value="削除">
                        </form>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <!-- カーソルエフェクト要素 -->
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
</body>
</html>
