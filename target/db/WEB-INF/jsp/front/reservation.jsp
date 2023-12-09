<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        .card {
            background-image: url('${facility.facilityPhoto}');
            background-size: cover;
            background-position: center;
            color: black;
            font-size: 30px;
            margin-bottom: 20px;
            width: 600px;
            height: 500px;
            display: inline-block;
            margin-right: 20px;
            margin-bottom: 20px;
        }

        .card-header {
            text-align: center;
            padding: 10px;
        }
        .card-body {
            flex-grow: 1;
            padding: 20px;
            padding-bottom: 0;
            overflow: auto;
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
            <ul >
                <li><a class="btn-link" href="/db/User/userInfo">个人中心</a></li>
                <li><a class="btn-link" href="/db/User/reservation">场地预约</a></li>
                <li><a class="btn-link" href="/db/User/Record">预约记录</a></li>
                <li><a class="btn-link" href="/db/User/announcements">公告查看</a></li>
            </ul>
        </div>
        <div class="col-md-10 content">
            <span style="font-size: 50px;font-weight: bold;">可用的场地列表</span>

            <%@ page import="java.lang.Math" %>
            <%@ page import="java.text.DecimalFormat" %>
            <%@ page import="java.util.Iterator" %>
            <%@ page import="java.util.List" %>
            <%@ page import="java.util.Map" %>
            <%@ page import="java.util.Set" %>
            <%@ page import="java.util.Map.Entry" %>
            <c:set var="itemsPerPage" value="4" />
            <c:set var="totalItems" value="${fn:length(availableFacilities)}" />
            <c:set var="totalPages" value="${(totalItems / itemsPerPage) + ((totalItems % itemsPerPage) > 0 ? 1 : 0)}" />
            <c:set var="currentPage" value="${empty param.page ? 1 : param.page}" />
            <c:set var="startIndex" value="${(currentPage - 1) * itemsPerPage}" />
            <c:set var="endIndex" value="${Math.min(startIndex + itemsPerPage - 1, totalItems - 1)}" />
            <c:set var="currentPageData" value="${availableFacilities.subList(startIndex, endIndex + 1)}" />

            <c:forEach var="facility" items="${currentPageData}" varStatus="loop">
                <c:if test="${loop.index % 2 == 0}">
                    <div class="row">
                </c:if>

                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            [${facility.facilityId}]${facility.facilityName}
                        </div>
                        <div class="card-body">
                            <ul style="text-align: left;">
                                <li>场地照片：<img src="../images/lanqiu.jpg" style="width: 200px;height: 200px"></img></li>
                                <li>场地费用：${facility.usageFee}/每小时</li>
                                <li>场地介绍：${facility.facilityDescription}</li>
                            </ul>
                            <button class="btn btn-primary" data-toggle="modal" data-target="#reservationModal${facility.facilityId}">
                                预约
                            </button>
                        </div>
                    </div>
                </div>
                <c:set var="modalId" value="reservationModal${facility.facilityId}" />

                <div class="modal fade" id="${modalId}" tabindex="-1" role="dialog" aria-labelledby="reservationModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="reservationModalLabel">预约场地-[${facility.facilityName}]</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <input type="hidden" id="usageFee" name="usageFee" value="${facility.usageFee}">
                            <div class="modal-body">
                                <form action="/db/User/submit" method="post">
                                    <div class="form-group">
                                        <label for="facilityId">场地ID:</label>
                                        <input type="text" class="form-control" id="facilityId" name="facilityId" value="${facility.facilityId}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label for="startTime">开始时间：</label>
                                        <input type="datetime-local" class="form-control" id="startTime" name="startTime" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="endTime">结束时间：</label>
                                        <input type="datetime-local" class="form-control" id="endTime" name="endTime" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="facilityUserFee">预计费用：</label>
                                        <input type="text" class="form-control" id="facilityUserFee" name="facilityFee" required>
                                    </div>
                                    <button type="button" class="btn btn-primary" onclick="calculateFee()" >计算费用</button>
                                    <button type="submit" class="btn btn-primary" >确认预约</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <c:if test="${loop.index % 2 == 1 or loop.last}">
                    </div>
                </c:if>
            </c:forEach>

            <ul class="pagination">
                <c:forEach var="page" begin="1" end="${totalPages}">
                    <li class="page-item <c:if test="${page == currentPage}">active</c:if>">
                        <a class="page-link" href="?page=${page}">${page}</a>
                    </li>
                </c:forEach>
            </ul>

        </div>
    </div>
</div>

<script>
    function calculateFee() {
        var startTimeStr = document.getElementById("startTime").value;
        var endTimeStr = document.getElementById("endTime").value;
        startTimeStr = startTimeStr.replace("T", " ");
        endTimeStr = endTimeStr.replace("T", " ");
        var startTime = new Date(startTimeStr);
        var endTime = new Date(endTimeStr);
        var usageFee = parseFloat(document.getElementById("usageFee").value);
        console.log(startTimeStr + endTimeStr + usageFee)
        var timeDiff = (endTime - startTime) / (1000 * 60 * 60);
        var facilityFee = timeDiff * usageFee;
        document.getElementById("facilityUserFee").value = facilityFee.toFixed(2);
    }

</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>

</body>
</html>