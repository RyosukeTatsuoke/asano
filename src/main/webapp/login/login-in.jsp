<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>
<head>



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
<style>

head {
    font-family: Arial, sans-serif;
    background-color: #f1f1f1;
}

head {
    width: 300px;
    margin: 0 auto;
    margin-top: 100px;
    background-color: #fff;
    border-radius: 5px;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

head {
    text-align: center;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
}

.form-group input[type="text"],
.form-group input[type="password"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

head {
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    transition: background-color 0.3s;
}

form {
    background-color: #B1F9D0;
}
</style>



<form action="Login.action" method="post">
<p>ログイン名<input type="text" name="username"></p>
<p>パスワード<input type="password" id="password" name="password"><br>
<input type="checkbox" onclick="togglePassword()"> Show Password<br>
<p><input type="submit" value="ログイン"</p>
</form>
<p>アカウントをお持ちでない場合は、<a href="../registration/registration.jsp">こちら</a>から会員登録してください。</p>

</head>


<%@include file="../footer.html" %>
