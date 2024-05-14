<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>成績登録</title>
</head>
<body>
    <h1>成績登録</h1>
    <form action="ScoreRegisterServlet" method="post">
        <label for="studentNo">学生番号:</label>
        <input type="text" id="studentNo" name="studentNo"><br>
        <label for="subjectCd">科目コード:</label>
        <input type="text" id="subjectCd" name="subjectCd"><br>
        <label for="schoolCd">学校コード:</label>
        <input type="text" id="schoolCd" name="schoolCd"><br>
        <label for="no">NO:</label>
        <input type="text" id="no" name="no"><br>
        <label for="point">得点:</label>
        <input type="text" id="point" name="point"><br>
        <label for="classNum">クラス:</label>
        <input type="text" id="classNum" name="classNum"><br>
        <input type="submit" value="登録">
    </form>
</body>
</html>
