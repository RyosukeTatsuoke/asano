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
    font-size: 15px; /* ボタンの文字を大きくする */
}

input[type="submit"]:hover {
    background-color: #218838;
}
</style>

</head>

<h1>会員登録</h1>
<form action="Register.servlet" method="post">
    ユーザー名: <input type="text" name="username"><br>
    パスワード: <input type="password" id="password" name="password"><br>
    <input type="checkbox" id="passwordCheckbox"> Show Password<br>
    <p>すでにアカウントをお持ちの場合は、<a href="../login/login-in.jsp">こちら</a>からログインしてください。</p>
    <input type="submit" value="登録">
</form>

<%@include file="../footer.html" %>
