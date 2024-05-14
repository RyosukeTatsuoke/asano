<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="bean.SCOREList" %>
<%@ page import="dao.ScoreDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>成績一覧</title>
<script>
    var ascendingOrder = true; // デフォルトは昇順

    function sortTable() {
        var table, rows, switching, i, x, y, shouldSwitch;
        table = document.getElementById("scoreTable");
        switching = true;
        /* ループ内のすべての行をチェック */
        while (switching) {
            switching = false;
            rows = table.rows;
            /* 2行目からループ */
            for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;
                /* 5列目のセルを取得 */
                x = rows[i].getElementsByTagName("TD")[4];
                y = rows[i + 1].getElementsByTagName("TD")[4];
                /* 数値として比較 */
                if (ascendingOrder) {
                    if (parseInt(x.innerHTML) > parseInt(y.innerHTML)) {
                        shouldSwitch = true;
                        break;
                    }
                } else {
                    if (parseInt(x.innerHTML) < parseInt(y.innerHTML)) {
                        shouldSwitch = true;
                        break;
                    }
                }
            }
            if (shouldSwitch) {
                /* 行を入れ替え */
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
            }
        }
        // 昇順と降順を切り替え
        ascendingOrder = !ascendingOrder;
    }
</script>
</head>
<body>
    <h1>成績一覧</h1>
    <button onclick="sortTable()">得点で並び替え</button>
    <table border="1" id="scoreTable">
        <tr>
            <th>学生番号</th>
            <th>科目コード</th>
            <th>学校コード</th>
            <th>NO</th>
            <th>得点</th>
            <th>クラス</th>
        </tr>
        <% 
           ScoreDAO dao = new ScoreDAO();
           List<SCOREList> list = dao.getAllStudents();
           for(SCOREList score : list) { %>
               <tr>
                   <td><%= score.getStudentNo() %></td>
                   <td><%= score.getSubjectCd() %></td>
                   <td><%= score.getSchoolCd() %></td>
                   <td><%= score.getNo() %></td>
                   <td><%= score.getPoint() %></td>
                   <td><%= score.getClassNum() %></td>
               </tr>
           <% }
        %>
    </table>
</body>
</html>
