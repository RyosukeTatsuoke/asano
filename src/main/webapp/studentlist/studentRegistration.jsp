<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生登録</title>
</head>
<body>
    <h1>学生登録</h1>
    <%-- エラーメッセージがあれば表示 --%>
    <c:if test="${not empty message}">
        <p>${message}</p>
    </c:if>
    <form action="StudentRegistrationServlet" method="post">
        <label for="entYear">入学年度：</label>
        <input type="text" id="entYear" name="entYear"><br>
        <label for="studentNo">学生番号：</label>
        <input type="text" id="studentNo" name="studentNo"><br>
        <label for="name">氏名：</label>
        <input type="text" id="name" name="name"><br>
        <label for="classNum">クラス：</label>
        <input type="text" id="classNum" name="classNum"><br>
        <input type="submit" value="登録して終了">
    </form>
</body>
</html>
