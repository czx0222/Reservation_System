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
    <style>
        .backarea{
            background-image:url("images/back2.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            min-height: calc(100vh - 70px);
            margin-top: 90px;
            margin-bottom: 56px;
        }
        .nav-item{
            margin-left: 20px;
            font-size: 24px;
        }
        .nav-link {
            color: white;
            font-weight: bold;
        }
        .custom-navbar {
            height: 90px;
        }
    </style>
</head>
<body >

<nav class="navbar navbar-expand-lg bg-dark text-white fixed-top custom-navbar">
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
            <a href="/db/User/login" class="btn btn-primary">登录</a>
        </li>
        <li class="nav-item">
            <a class="btn btn-primary" href="front/register.jsp">注册</a>
        </li>
    </ul>
</nav>

<div class="backarea">
    <section class="container py-5">
        <h2 class="text-center mb-4" style="font-weight: bold;font-size: 70px;">欢迎来到体育馆</h2>
        <div class="box" style="margin-top: 130px">
            <div id="carouselExample" class="carousel slide" data-ride="2000">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images/zuqiu.jpg" class="d-block w-100" alt="Slide 1" style="width: 500px; height: 700px;">
                    </div>
                    <div class="carousel-item">
                        <img src="images/lanqiu.jpg" class="d-block w-100" alt="Slide 2" style="width: 500px; height: 700px;">
                    </div>
                    <div class="carousel-item">
                        <img src="images/wangqiu.jpg" class="d-block w-100" alt="Slide 3" style="width: 500px; height: 700px;">
                    </div>
                    <div class="carousel-item">
                        <img src="images/pingpang.jpg" class="d-block w-100" alt="Slide 4" style="width: 500px; height: 700px;">
                    </div>
                    <div class="carousel-item">
                        <img src="images/yumaoqiu.jpg" class="d-block w-100" alt="Slide 5" style="width: 500px; height: 700px;">
                    </div>

                </div>
                <a class="carousel-control-prev" href="#carouselExample" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExample" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
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