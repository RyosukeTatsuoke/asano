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
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
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
                        <form action="StudentDeleteServlet" method="post">
                            <input type="hidden" name="studentNo" value="<%= student.getNO() %>">
                            <input type="submit" value="削除">
                        </form>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
