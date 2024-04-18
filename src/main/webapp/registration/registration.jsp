
<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>

    <h1>会員登録</h1>
    <form action="RegisterServlet" method="post">
        ユーザー名: <input type="text" name="username"><br>
        パスワード: <input type="password" name="password"><br>
        <input type="submit" value="登録">
    </form>
        <p>すでにアカウントをお持ちの場合は、<a href="login-in.jsp">こちら</a>からログインしてください。</p>

<%@include file="../footer.html" %>
