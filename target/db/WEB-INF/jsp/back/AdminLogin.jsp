<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>体育场地预约管理系统</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <style>
        .loginarea {
            background-image: url("../images/back.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .box {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            width: 400px; /* 固定宽度 */
            height: 300px; /* 固定高度 */
        }
        .btn-login {
            display: flex;
            justify-content: center;
            margin-top: 20px; /* 增加一些顶部间距 */
        }
        .box1 {
            background-color: rgb(255, 255, 255, 0.6);
            border-radius: 20px;
            padding: 20px; /* 增加内边距 */
            font-size: 30px;
            font-weight: bold;
        }
    </style>
</head>
<body class="loginarea">
<div class="container ">
    <div class="row box">
        <div class="col-md-12 box1">
            <h2 class="text-center" style="font-size: 50px">管理员登录</h2>
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
<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
