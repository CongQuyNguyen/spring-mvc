<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>
        <dec:title default="Dashboard - Ace Admin" />
    </title>

    <!-- Bootstrap và Font-Awesome CSS -->
    <link href="<c:url value='/template/admin/css/bootstrap.min.css' />" rel="stylesheet" />
    <link rel="stylesheet" href="<c:url value='/template/admin/css/font-awesome.min.css' />" />
    <link rel="stylesheet" href="<c:url value='/template/admin/css/ace-fonts.css' />" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- ace styles -->
    <link rel="stylesheet" href="<c:url value='/template/admin/css/ace.min.css' />" />
    <link rel="stylesheet" href="<c:url value='/template/admin/css/ace-rtl.min.css' />" />
    <link rel="stylesheet" href="<c:url value='/template/admin/css/ace-skins.min.css' />" />

    <!-- jQuery trước -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- ace extra -->
    <script src="<c:url value='/template/admin/js/ace-extra.min.js'/>"></script>

    <!-- Plugin phân trang -->
    <script src="<c:url value='/template/paging/jquery.twbsPagination.min.js'/>"></script>

    <%--CKEditor--%>
    <script src="<c:url value='/ckeditor5/ckeditor5.js'/>"></script>
    <link rel="stylesheet" href="<c:url value='/ckeditor5/ckeditor5.css' />" />

    <%--CSS cho giao diện edit news--%>
    <link rel="stylesheet" href="<c:url value='/template/admin/news/css/edit-news.css' />" />

</head>

<body>
    <!-- header -->
    <%@ include file="/common/admin/header.jsp"%>
    <!-- header -->

    <div class="main-container" id="main-container">
        <!-- nav -->
        <%@ include file="/common/admin/nav.jsp"%>
        <!-- nav -->

        <dec:body />

        <!-- footer -->
        <%@ include file="/common/admin/footer.jsp"%>
        <!-- footer -->

        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse display"> 
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div>

    <!-- Các thư viện JavaScript khác -->
    <script src="<c:url value='/template/admin/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/typeahead-bs2.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/jquery-ui-1.10.3.custom.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/jquery.ui.touch-punch.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/jquery.slimscroll.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/jquery.easy-pie-chart.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/jquery.sparkline.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/flot/jquery.flot.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/flot/jquery.flot.pie.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/flot/jquery.flot.resize.min.js'/>"></script>
    <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>

    <!-- ace scripts -->
    <script src="<c:url value='/template/admin/js/ace-elements.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/ace.min.js'/>"></script>

</body>

</html>
