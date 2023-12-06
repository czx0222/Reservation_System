<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>体育预约管理系统</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="webcss/body.css">
    <script >
        var footerHeight = document.querySelector('footer').offsetHeight;
        document.getElementById('footer-placeholder').style.height = footerHeight + 'px';
    </script>
</head>
<body >

<nav class="navbar navbar-expand-lg bg-dark text-white fixed-top">
    <ul class="navbar-nav mx-auto " >
        <li class="nav-item active">
            <a class="nav-link" href="#">首页</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">关于我们</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">产品/服务</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">新闻</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">联系我们</a>
        </li>
        <li class="nav-item">
            <a href="login" class="btn btn-primary">登录</a>
        </li>
        <li class="nav-item">
            <a class="btn btn-primary" href="register">注册</a>
        </li>
    </ul>
</nav>

<div class="backarea" >
    <section class="container py-5 ">
        <h2 class="text-center mb-4">欢迎来到网站首页</h2>
        <p>这里是网站的主要内容区域，你可以在这里展示网站的特色信息、产品、服务等。</p>
    </section>
</div>

<div id="footer-placeholder"></div>
<footer class="bg-dark text-white text-center py-1 fixed-bottom">
    <p>版权信息 © 2023 网站名称</p>
</footer>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
