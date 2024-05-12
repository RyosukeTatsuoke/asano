<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生情報変更失敗</title>
</head>
<body>
    <h1>学生情報の変更に失敗しました。</h1>
    <p>学生情報の更新中にエラーが発生しました。</p>
    <p>エラーメッセージ:</p>
    <%
        // エラーメッセージを表示
        String errorMessage = (String) request.getAttribute("errorMessage");
        out.println("<p>" + errorMessage + "</p>");
    %>
    <a href="/studentList.jsp">学生一覧に戻る</a>
</body>
</html>
