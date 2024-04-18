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

<form action="LoginAction" method="post">
<p>ログイン名<input type="text" name="username"></p>
<p>パスワード<input type="password" id="password" name="password"><br>
<input type="checkbox" onclick="togglePassword()"> Show Password<br>
<p><input type="submit" value="ログイン"</p>
</form>
<p>アカウントをお持ちでない場合は、<a href="registration.jsp">こちら</a>から会員登録してください。</p>


<%@include file="../footer.html" %>
