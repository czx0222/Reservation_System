<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>体育场地预约管理系统</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <style>
        a{
            list-style-type: none;
        }

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
        .content {
            flex-grow: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }


        .center-content {
            vertical-align:middle;
            text-align: center;
            font-size: 20px;

        }

        .bold-text {
            font-size: 24px;
        }
        table {
            border: 2px solid black;
            min-width: 85%;
            line-height: 3;
        }
    </style>


</head>
<body>
<div class="container-fluid">
    <div class="header bg-dark text-light">
        <div class="header-content">
            <h1>体育场地预约管理系统</h1>
            <a href="/db/admin/login" class="btn btn-danger btn-sm">退出</a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2 sidebar bg-dark text-light">
            <ul>
                <li><a class="btn-link" href="/db/user/list">用户管理</a></li>
                <li><a class="btn-link" href="/db/facilities/list">场地管理</a></li>
                <li><a class="btn-link" href="/db/User/recordlist">预约审核</a></li>
                <li><a class="btn-link" href="/db/announcements/list">公告管理</a></li>
            </ul>
        </div>
        <div class="col-md-10 content ">
            <table border="1" class="center-content">
                <thead>
                <tr class="bold-text  bg-dark text-light">

                    <th>用户编号</th>
                    <th>场地编号</th>
                    <th>开始时间</th>
                    <th>结束时间</th>
                    <th>场地费用</th>
                    <th>审核状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="records" items="${adminRecords}">
                    <tr>

                        <td>${records.userId}</td>
                        <td>${records.facilityId}</td>
                        <td><fmt:formatDate value="${records.startTime}" pattern="yyyy-MM-dd" /></td>
                        <td><fmt:formatDate value="${records.endTime}" pattern="yyyy-MM-dd" /></td>
                        <td>${records.facilityFee}</td>
                        <td>${records.auditStatus}</td>
                        <td>
                            <form action="/db/User/performAudit" method="post">
                                <input type="hidden" name="reservationId" value="${records.reservationid}">
                                <button type="submit" name="action" value="approve" class="btn btn-success">同意</button>
                                <button type="submit" name="action" value="reject" class="btn btn-danger">拒绝</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>

</body>
</html>



