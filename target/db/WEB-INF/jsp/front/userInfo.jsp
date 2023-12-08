


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
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            width: 100%;
            background-color: #f8f9fa;
            margin-right: auto;
            margin-left: auto;
            padding-left: 20px;
        }
        .sidebar {
            background-color: #f8f9fa;
            padding: 20px;
            height: calc(100vh - 50px);
        }
        .sidebar ul {
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .sidebar li {
            width: 70%;
            border: 2px solid #ccc;
            border-radius: 5px;
            margin-bottom: 90px;
            list-style-type: none;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px;
        }
        .sidebar a {
            text-decoration: none;
            font-weight: bold;
            font-size: 30px;
            color: white;
        }
        .btn-logout {
            border-radius: 20px;
            background-color: #ff7373;
            width: 90px;
            height: 50px;
            color: white;
            font-weight: bold;
            display: flex;
            justify-content: center;
            align-items: center;
            text-decoration: none;
            margin-left: auto;
        }

        .content {
            flex-grow: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }
        .content li{
            list-style-type: none;
        }
        .content table {
            width: 70%;
            margin-top: 20px;
            font-size: 24px;
        }
        .content table th, .content table td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
        }
        .content table th {
            background-color: #f2f2f2;
        }
        .content button {
            font-size: 24px;
            margin-top: 10px;
        }
    </style>

</head>
<body>
<div class="container-fluid">
    <div class="header bg-dark text-light">
        <a href="/db/User/logout" class="btn-logout">退出</a>
    </div>
    <div class="row">
        <div class="col-md-2 sidebar bg-dark text-light">
            <ul>
                <li><a class="btn-link" href="/db/User/userInfo">个人中心</a></li>
                <li><a class="btn-link" href="#">场地预约</a></li>
                <li><a class="btn-link" href="#">预约记录</a></li>
                <li><a class="btn-link" href="#">公告查看</a></li>
            </ul>
        </div>
        <div class="col-md-10 content">
            <h1 style="font-weight: bold">用户信息</h1>
            <table class="table table-bordered">
                <tr>
                    <th>属性</th>
                    <th>值</th>
                </tr>
                <tr>
                    <td>用户ID</td>
                    <td>${userInfo.user_id}</td>
                </tr>
                <tr>
                    <td>用户名</td>
                    <td>${userInfo.login_name}</td>
                </tr>
                <tr>
                    <td>姓名</td>
                    <td>${userInfo.full_name}</td>
                </tr>
                <tr>
                    <td>生日</td>
                    <td>${userInfo.birthday}</td>
                </tr>
                <tr>
                    <td>电话</td>
                    <td>${userInfo.phone}</td>
                </tr>
                <tr>
                    <td>邮箱</td>
                    <td>${userInfo.email}</td>
                </tr>
            </table>
            <button class="btn btn-primary" data-toggle="modal" data-target="#editUserInfoModal">修改信息</button>
            <button class="btn btn-secondary" data-toggle="modal" data-target="#editPasswordModal">修改密码</button>
        </div>
    </div>
</div>
<div class="modal fade" id="editUserInfoModal" tabindex="-1" role="dialog" aria-labelledby="editUserInfoModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editUserInfoModalLabel">修改用户信息</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/db/User/updateUserInfo/${userInfo.user_id}" method="post">
                    <div class="form-group">
                        <label for="newFullName">姓名：</label>
                        <input type="text" id="newFullName" name="full_name" value="${userInfo.full_name}" required>
                    </div>
                    <div class="form-group">
                        <label for="newBirthday">生日：</label>
                        <input type="date" id="newBirthday" name="birthday" value="${userInfo.birthday}" required>
                    </div>
                    <div class="form-group">
                        <label for="newPhone">电话：</label>
                        <input type="text" id="newPhone" name="phone" value="${userInfo.phone}" required>
                    </div>
                    <div class="form-group">
                        <label for="newEmail">邮箱：</label>
                        <input type="email" id="newEmail" name="email" value="${userInfo.email}" required>
                    </div>
                    <button type="submit" class="btn btn-primary">保存</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%--修改密码--%>
<div class="modal fade" id="editPasswordModal" tabindex="-1" role="dialog" aria-labelledby="editPasswordModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editPasswordModalLabel">修改密码</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/db/User/updatePassword/${userInfo.user_id}" method="post">
                    <div class="form-group">
                        <label for="currentPassword">当前密码：</label>
                        <input type="password" id="currentPassword" name="currentPassword" required class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="newPassword">新密码：</label>
                        <input type="password" id="newPassword" name="newPassword" required class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="confirmNewPassword">确认新密码：</label>
                        <input type="password" id="confirmNewPassword" name="confirmNewPassword" required class="form-control">
                    </div>
                    <button type="submit" class="btn btn-primary">保存</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
