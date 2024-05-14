<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>

<head>

<script>
window.onload = function() {
    var passwordInput = document.getElementById("password");
    var passwordCheckbox = document.getElementById("passwordCheckbox");

    passwordCheckbox.addEventListener('click', function() {
        if (passwordInput.type === "password") {
            passwordInput.type = "text";
        } else {
            passwordInput.type = "password";
        }
    });
}
</script>

<style>
body {
    background-color: #f0f0f0; /* 背景色を変更 */
    display: flex;
    flex-direction: column; /* 項目を縦に並べる */
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    font-size: 25px; /* 文字の大きさを大きくする */
}

h2 {
    margin-bottom: 20px; /* ログインとフォームの間にスペースを追加 */
}

.form-group input[type="text"],
.form-group input[type="password"] {
    transition: border 0.3s;
}

.form-group input[type="text"]:focus,
.form-group input[type="password"]:focus {
    border-color: #007bff;
}

input[type="submit"] {
    background-color: #28a745;
    padding: 10px 20px; /* ボタンを大きくする */
    font-size: 16px; /* ボタンの文字を大きくする */
}

input[type="submit"]:hover {
    background-color: #218838;
}

/* ログイン名とパスワードの行間を狭くする */
p {
    margin-bottom: 1px;
}
</style>

<h2>ログイン</h2> <!-- ログインという文字を追加 -->
<form action="Login.action" method="post">
<p>ログイン名:<input type="text" name="username"></p>
<p>パスワード:<input type="password" id="password" name="password"><br>
<input type="checkbox" id="passwordCheckbox"> Show Password<br>
<p>アカウントをお持ちでない場合は、<a href="../registration/registration.jsp">こちら</a>から会員登録してください。</p>
<p><input type="submit" value="ログイン"</p>
</form>

</head>

<%@include file="../footer.html" %>
