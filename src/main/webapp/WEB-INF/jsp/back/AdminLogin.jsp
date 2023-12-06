<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>体育场地预约管理系统</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <style>
        .loginarea{
            background-image: url("../images/back.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .box{
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            width: 50%;
            height: 50%;
        }
        .btn-login {
            display: flex;
            justify-content: center;
        }
        .box1{
            background-color: rgb(255,255,255,0.6);
            border-radius: 20px;
        }
    </style>
</head>
<body class="loginarea">
<div class="container ">
    <div class="row box">
        <div class="col-md-6 offset-md-3 box1">
            <h2 class="text-center">管理员登录</h2>
            <form action="/db/admin/login" method="post" >
                <div class="mb-3">
                    <label for="username" class="form-label">用户名:</label>
                    <input type="text" class="form-control" id="username" name="username">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">密码:</label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>
                <div class="btn-login">
                    <button type="submit" class="btn btn-primary">登录</button>
                </div>
            </form>
            <p>${error}</p> <!-- Display login error message -->
        </div>
    </div>
</div>
<link rel="stylesheet" href="../bootstrap/js/bootstrap.min.js">


</body>
</html>