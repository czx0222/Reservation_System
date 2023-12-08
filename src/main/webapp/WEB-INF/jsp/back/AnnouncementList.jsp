
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
      width: 85%;
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
        <li>个人中心</li>
        <li><a href="/db/user/list">用户管理</a></li>
        <li><a class="btn-link" href="/db/facilities/list">场地管理</a></li>
        <li>预约审核</li>
        <li><a class="btn-link" href="/db/announcements/list">公告管理</a></li>
      </ul>
    </div>
    <div class="col-md-10 content ">
      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addAnnouncementModal">
        添加公告
      </button>
      <div class="modal fade" id="addAnnouncementModal" tabindex="-1" role="dialog" aria-labelledby="addAnnouncementModalLabel"
           aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="addAnnouncementModalLabel">添加公告</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form action="/db/announcements/add" method="post">
                <div class="form-group">
                  <label for="announcementContent">公告内容</label>
                  <textarea class="form-control" id="announcementContent" name="content" rows="3" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">确认添加</button>
              </form>
            </div>
          </div>
        </div>
      </div>
      <h2 style="font-weight: bold">公告列表</h2>
      <table border="1" class="center-content">
        <thead>
        <tr class="bold-text bg-dark text-light">
          <th>公告编号</th>
          <th>内容</th>
          <th>发布时间</th>
          <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="announcement" items="${announcements}">
          <tr>
            <td>${announcement.announcement_id}</td>
            <td>${announcement.content}</td>
<%--            <td>${announcement.publish_time}</td>--%>
            <fmt:formatDate value="${announcement.publish_time}" pattern="yyyy-MM-dd" var="formattedDate" />

            <td>${formattedDate}</td>
            <td>
              <a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#editAnnouncementModal${announcement.announcement_id}">
                编辑
              </a>
              <a class="btn btn-danger btn-sm"  href="<c:url value='/announcements/delete/${announcement.announcement_id}'/>">删除</a>
            </td>
            <div class="modal fade" id="editAnnouncementModal${announcement.announcement_id}" tabindex="-1" role="dialog" aria-labelledby="editAnnouncementModalLabel${announcement.announcement_id}" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="editAnnouncementModalLabel${announcement.announcement_id}">编辑公告</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    <form action="/db/announcements/edit/${announcement.announcement_id}" method="post">
                      <div class="form-group">
                        <label for="editAnnouncementContent${announcement.announcement_id}">公告内容</label>
                        <textarea class="form-control" id="editAnnouncementContent${announcement.announcement_id}" name="content" rows="3" required>${announcement.content}</textarea>
                      </div>
                      <button type="submit" class="btn btn-primary">确认修改</button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
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



