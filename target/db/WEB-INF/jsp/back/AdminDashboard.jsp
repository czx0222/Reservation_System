<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>体育场地预约管理系统</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <style>


        .container-fluid {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }

        .header {
            padding: 10px;
            width: 100%;
            background-color: #f8f9fa;
            margin-right: auto;
            margin-left: auto;
            padding-left: 20px;
        }


        .header-content {
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-family: 微软雅黑;
        }

        .sidebar {
            background-color: #f8f9fa;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-content: center;
            height: calc(100vh - 50px);
        }

        .sidebar li {
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 40px;
            list-style-type: none;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .btn-logout {
            border-radius: 20px;
            background-color: #ff7373;
            width: 70px;
            color: white;
            font-weight: bold;
            display: flex;
            justify-content: center;
            align-items: center;
            text-decoration: none;
        }

        .content {
            flex-grow: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        #greeting {
            font-size: 24px;
            margin-top: 20px;
        }
    </style>


</head>
<body>
<div class="container-fluid">
    <div class="header bg-dark text-light">
        <div class="header-content">
            <h1>体育场地预约管理系统</h1>
            <a href="/db/admin/login" class="btn-logout">退出</a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2 sidebar bg-dark text-light">
            <ul>
                <li>个人中心</li>
                <li><a class="btn-link" href="/db/user/list">用户管理</a></li>
                <li><a class="btn-link" href="/db/facilities/list">场地管理</a></li>
                <li>预约审核</li>
                <li><a class="btn-link" href="/db/announcements/list">公告管理</a></li>
            </ul>
        </div>
        <div class="col-md-10 content" id="dashboardContent">
            <h2 id="greeting"></h2>
        </div>
    </div>
</div>
<script>
    function getCurrentTime() {
        var today = new Date();

        var year = today.getFullYear();
        var month = ('0' + (today.getMonth() + 1)).slice(-2);
        var day = ('0' + today.getDate()).slice(-2);

        var hours = ('0' + today.getHours()).slice(-2);
        var minutes = ('0' + today.getMinutes()).slice(-2);
        var seconds = ('0' + today.getSeconds()).slice(-2);

        return year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
    }
    var adminName = "Admin";

    function updateDashboardContent() {
        var greetingElement = document.getElementById("greeting");
        if (greetingElement) {
            var currentTime = getCurrentTime();
            greetingElement.innerHTML = "欢迎, " + adminName + "!<br>现在是 " + currentTime;
        }
    }

    updateDashboardContent();

    setInterval(updateDashboardContent, 1000);
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>

</body>
</html>