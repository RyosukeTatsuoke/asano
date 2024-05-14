<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>成績一覧</title>
</head>
<body>
    <h1>成績一覧</h1>
    <table border="1">
        <tr>
            <th>学生番号</th>
            <th>科目コード</th>
            <th>学校コード</th>
            <th>NO</th>
            <th>得点</th>
            <th>クラス</th>
        </tr>
        <% 
           List<Score> scores = (List<Score>) request.getAttribute("scores");
           for(Score score : scores) { %>
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
