
<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>

<script>
function togglePassword() {
    var passwordInput = document.getElementById("password");
    if (passwordInput.type === "password") {
        passwordInput.type = "text";
    } else {
        passwordInput.type = "password";
    }
}
</script>

    <h1>会員登録</h1>
    <form action="Register.servlet" method="post">
        ユーザー名: <input type="text" name="username"><br>
        パスワード: <input type="password" id="password" name="password"><br>
<input type="checkbox" onclick="togglePassword()"> Show Password<br>
        <input type="submit" value="登録">
    </form>
        <p>すでにアカウントをお持ちの場合は、<a href="../login/login-in.jsp">こちら</a>からログインしてください。</p>

<%@include file="../footer.html" %>




