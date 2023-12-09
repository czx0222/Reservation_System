


<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
      background-image: url('../images/box.jpg');
      background-size: cover;
      background-position: center;
      color: black;
      font-size: 30px;
      margin-bottom: 20px;
      width: 300px;
      height: 400px;
    }

    .card-header {
      text-align: center;
      padding: 10px;
    }
    .card-body {
      flex-grow: 1;
      padding: 40px;
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
      <ul>
        <li><a class="btn-link" href="/db/User/userInfo">个人中心</a></li>
        <li><a class="btn-link" href="/db/User/reservation">场地预约</a></li>
        <li><a class="btn-link" href="/db/User/Record">预约记录</a></li>
        <li><a class="btn-link" href="/db/User/announcements">公告查看</a></li>
      </ul>
    </div>
    <div class="col-md-10 content">
      <span style="font-size: 50px;font-weight: bold;">
        最近的六条公告：
      </span>
      <ul>
        <c:forEach var="announcement" items="${announcements}" varStatus="loop">
          <c:if test="${loop.index % 3 == 0}">
            <div class="row">
          </c:if>

          <div class="col-md-4">
            <div class="card">
              <div class="card-header">
                <fmt:formatDate value="${announcement.publish_time}" pattern="yyyy-MM-dd" var="formattedDate" />
                <h5>${formattedDate}</h5>
              </div>
              <div class="card-body">
                <p class="card-text">${announcement.content}</p>
              </div>
            </div>
          </div>

          <c:if test="${loop.index % 3 == 2 or loop.last}">
            </div>
          </c:if>
        </c:forEach>
      </ul>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
