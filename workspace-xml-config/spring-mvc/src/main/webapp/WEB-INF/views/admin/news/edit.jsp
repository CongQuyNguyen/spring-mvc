<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 6/28/2024
  Time: 11:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<c:url var="newsURL" value="/admin/news/list"/>
<c:url value="/api/news" var="apiURL"/>
<c:url var="newsEdit" value="/admin/news/edit"/>

<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa bài viết</title>
</head>
<body>
<div class="main-content">

    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">Chỉnh sửa bài viết</li>
            </ul><!-- /.breadcrumb -->
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <%--Hiển thị alert--%>
                    <c:if test="${not empty message}">
                        <div class="alert alert-${alert}">
                                ${message}
                        </div>
                    </c:if>
                    <%--Để trong form với mục đích call API để sửa đổi hoặc thêm mới hoặc xoóa--%>
                    <form:form id="formSubmit" modelAttribute="model">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="categoryCode">Thể loại</label>
                            <div class="col-sm-9">
                                <form:select path="categoryCode" id="categoryCode">
                                    <form:option value="" label="-- Chọn thể loại --"/>
                                    <form:options items="${categories}"/>
                                </form:select>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Tiêu đề</label>
                            <div class="col-sm-9">
                                <form:input path="title" cssClass="form-control"/>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Hình đại diện</label>
                            <div class="col-sm-9">
                                <form:input path="thumbnail" cssClass="form-control"/>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Mô tả ngắn</label>
                            <div class="col-sm-9">
                                <form:input path="shortDescription" cssClass="form-control"/>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Nội dung</label>
                            <div class="col-sm-9">
                                <form:textarea path="content" cssStyle="width: 727px;height: 175px"/>
                            </div>
                        </div>

                        <br/>
                        <br/>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <c:if test="${not empty model.id}">
                                    <input type="button" class="btn btn-info" value="Cập nhật bài viết" id="btnAddOrUpdateNew"/>
                                </c:if>
                                <c:if test="${empty model.id}">
                                    <input type="button" class="btn btn-primary" value="Thêm bài viết" id="btnAddOrUpdateNew"/>
                                </c:if>
                            </div>
                        </div>
                        <%--Để trả về cho server--%>
                        <form:hidden path="id" id="newsId"/>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    // Đây là hàm sẽ chạy đầu tiên khi bắt đầu start một page
    var editor = '';
    $(document).ready(function () {
        editor = CKEDITOR.replace('content');
    });

    // Submit về các API (api-admin-news)
    $('#btnAddOrUpdateNew').click(function (e) {
        e.preventDefault();
        // Lấy dữ liệu từ CKEditor
        var editorData = CKEDITOR.instances['content'].getData();
        $('#content').val(editorData); // Gán lại giá trị vào textarea

        var formData = $('#formSubmit').serializeArray();
        var data = {};

        $.each(formData, function (i, v) {
            data[v.name] = v.value;
        });

        var id = $('#newsId').val();
        if (id === "") {
            addNews(data);
        } else {
            updateNews(data);
        }
    });

    function addNews(data) {
        $.ajax({
            url: '${apiURL}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${newsEdit}?id="+result.id+"&message=insert_success";
            },
            error: function (error) {
                window.location.href = "${newsURL}?page=1&limit=2&message=error_system";
            }
        });
    }

    function updateNews(data) {
        $.ajax({
            url: '${apiURL}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${newsEdit}?id="+result.id+"&message=update_success";
            },
            error: function (error) {
                window.location.href = "${newsEdit}?id=null&message=error_system";
            }
        });
    }


</script>
</body>
</html>
