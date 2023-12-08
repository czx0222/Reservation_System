<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>体育场地预约管理系统</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-image: url("../images/back2.jpg");
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

        .backarea {
            width: 500px;
            padding: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

        }

        .backarea form {
            margin-top: 20px;
        }

        .backarea label {
            margin-bottom: 10px;
            display: block;
            font-size: 30px;
            font-weight: bold;
        }

        .backarea input {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        .backarea button {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div>
    <div class="backarea">
        <form action="/db/User/dashboard" method="post">
            <label for="login_name">用户名：</label>
            <input type="text" id="login_name" name="login_name" required><br>
            <label for="password">密码：</label>
            <input type="password" id="password" name="password" required><br>
            <button type="submit" class="btn btn-primary">登录</button>
        </form>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
