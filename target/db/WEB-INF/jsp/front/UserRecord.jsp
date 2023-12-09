<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        .content table {
            width: 80%;
        }
        .table-bordered {
            border: 2px solid #1b1e21;
        }

        .table-bordered th,
        .table-bordered td {
            border: 2px solid #1b1e21;
            font-size: 24px;
            text-align: center;
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
                <li><a class="btn-link" href="/db/User/reservation">场地预约</a></li>
                <li><a class="btn-link" href="/db/User/Record">预约记录</a></li>
                <li><a class="btn-link" href="/db/User/announcements">公告查看</a></li>
            </ul>
        </div>
        <div class="col-md-10 content" >
            <h2>我的预约记录</h2>

            <c:if test="${not empty userReservationRecords}">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>场地编号</th>
                        <th>开始时间</th>
                        <th>结束时间</th>
                        <th>场地费用</th>
                        <th>审核状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="record" items="${userReservationRecords}">
                        <tr>
                            <td>${record.facilityId}</td>
                            <td><fmt:formatDate value="${record.startTime}" pattern="yyyy-MM-dd" /></td>
                            <td><fmt:formatDate value="${record.endTime}" pattern="yyyy-MM-dd" /></td>
                            <td>${record.facilityFee}</td>
                            <td>${record.auditStatus}</td>
                            <td>
                                <a class="btn btn-danger btn-sm" href="<c:url value='/User/delete/${record.reservationid}'/>">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>

            <c:if test="${empty userReservationRecords}">
                <p>暂无预约记录</p>
            </c:if>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>

</body>
</html>