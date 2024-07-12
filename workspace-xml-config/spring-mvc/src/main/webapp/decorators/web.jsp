
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Nhớ include -->
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><dec:title default="Trang chủ" /></title>

    <!-- css -->
    <link href="<c:url value='/template/web/bootstrap/css/bootstrap.min.css' />" rel="stylesheet" type="text/css" media="all" />
    <link href="<c:url value='/template/web/css/style.css' />" rel="stylesheet" type="text/css" media="all" />

    <!-- jQuery trước các script khác -->
    <script src="<c:url value='/template/web/jquery/jquery.min.js' />"></script>
</head>
<body>
    <!-- header -->
    <%@ include file="/common/web/header.jsp"%>
    <!-- header -->

    <div class="container">
        <dec:body />
    </div>

    <!-- footer -->
    <%@ include file="/common/web/footer.jsp"%>
    <!-- footer -->

    <!-- Các script khác -->
    <script src="<c:url value='/template/web/bootstrap/js/bootstrap.bundle.min.js' />"></script>
</body>
</html>
 