<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            min-width: 85%;
        }
        .modal-dialog {
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="header bg-dark text-light">
        <div class="header-content">
            <h1>体育场地预约管理系统</h1>
            <a href="/admin/login" class="btn btn-danger btn-sm">退出</a>
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
        <div class="col-md-10 content">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addFacilityModal">添加场地</button>
            <!-- 添加场地的模态框 -->
            <div class="modal fade" id="addFacilityModal" tabindex="-1" role="dialog" aria-labelledby="addFacilityModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addFacilityModalLabel">添加新场地</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <!-- 添加场地的表单 -->
                            <form id="addFacilityForm" action="/db/facilities/add" method="post">
                                <div class="form-group">
                                    <label for="addFacilityId">场地编号</label>
                                    <input type="text" class="form-control" id="addFacilityId" name="facilityId" required>
                                </div>
                                <div class="form-group">
                                    <label for="addFacilityName">场地名称</label>
                                    <input type="text" class="form-control" id="addFacilityName" name="facilityName" required>
                                </div>
                                <div class="form-group">
                                    <label for="addFacilityPhoto">场地照片</label>
                                    <input type="file" class="form-control-file" id="addFacilityPhoto" name="facilityPhoto" accept="image/*">
                                    <img id="addPreviewImage" style="max-width: 100px; max-height: 100px;">
                                </div>
                                <div class="form-group">
                                    <label for="editFacilityDescription${facility.facilityId}">场地介绍</label>
                                    <textarea class="form-control" id="editFacilityDescription${facility.facilityId}" name="facilityDescription" rows="3" required>${facility.facilityDescription}</textarea>
                                </div>
                                <div class="form-group">
                                    <label for="editUsageStatus${facility.facilityId}">场地状态</label>
                                    <select class="form-control" id="editUsageStatus${facility.facilityId}" name="usageStatus" required>
                                        <option value="Available" ${facility.usageStatus eq 'Available' ? 'selected' : ''}>可以</option>
                                        <option value="Occupied" ${facility.usageStatus eq 'Occupied' ? 'selected' : ''}>不可以</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="editUsageFee${facility.facilityId}">场地费用</label>
                                    <input type="text" class="form-control" id="editUsageFee${facility.facilityId}" name="usageFee" value="${facility.usageFee}" required>
                                </div>

                                <button type="submit" class="btn btn-primary">确认添加</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <h2 style="font-weight: bold">场地列表</h2>
            <table  border="1" class="center-content">
                <thead>
                <tr class="bold-text bg-dark text-light">
                    <th>场地编号</th>
                    <th>场地名称</th>
                    <th>场地照片</th>
                    <th>场地介绍</th>
                    <th>场地状态</th>
                    <th>场地费用</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="facility" items="${facilities}">
                    <tr>
                        <td>${facility.facilityId}</td>
                        <td>${facility.facilityName}</td>
                        <td>${facility.facilityPhoto}</td>
                        <td>${facility.facilityDescription}</td>
                        <td>${facility.usageStatus}</td>
                        <td>${facility.usageFee}/每小时</td>
                        <td>
                            <a class="btn btn-danger btn-sm" href="<c:url value='/facilities/delete/${facility.facilityId}'/>">删除</a>
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#editFacilityModal${facility.facilityId}">
                                编辑
                            </button>
                        </td>
                        <div class="modal fade" id="editFacilityModal${facility.facilityId}" tabindex="-1" role="dialog" aria-labelledby="editFacilityModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editFacilityModalLabel">编辑场地信息</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <!-- 编辑表单，包含场地的详细信息 -->
                                        <form id="editFacilityForm" action="<c:url value='/facilities/edit/${facility.facilityId}'/>" method="post">
                                        <div class="form-group">
                                                <label for="editFacilityName">场地名称</label>
                                                <input type="text" class="form-control" id="editFacilityName" name="facilityName" value="${facility.facilityName}" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="editFacilityPhoto">场地照片</label>
                                                <input type="file" class="form-control-file" id="editFacilityPhoto" name="facilityPhoto" accept="image/*">
                                                <img id="previewImage" style="max-width: 100px; max-height: 100px;">
                                            </div>
                                            <div class="form-group">
                                                <label for="editFacilityDescription${facility.facilityId}">场地介绍</label>
                                                <textarea class="form-control" id="editFacilityDescription${facility.facilityId}" name="facilityDescription" rows="3" required>${facility.facilityDescription}</textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="editUsageStatus${facility.facilityId}">场地状态</label>
                                                <select class="form-control" id="editUsageStatus${facility.facilityId}" name="usageStatus" required>
                                                    <option value="Available" ${facility.usageStatus eq 'Available' ? 'selected' : ''}>可以</option>
                                                    <option value="Occupied" ${facility.usageStatus eq 'Occupied' ? 'selected' : ''}>不可以</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="editUsageFee${facility.facilityId}">场地费用</label>
                                                <input type="text" class="form-control" id="editUsageFee${facility.facilityId}" name="usageFee" value="${facility.usageFee}" required>
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
<script>
    $(document).ready(function () {
        // 监听图片选择事件
        $('#addFacilityPhoto').change(function () {
            readURL(this, '#addPreviewImage');
        });
    });

    // 用于预览图片
    function readURL(input, previewId) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $(previewId).attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</body>
</html>
