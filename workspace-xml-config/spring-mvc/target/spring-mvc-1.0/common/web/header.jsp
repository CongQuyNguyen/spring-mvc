<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ page import="com.laptrinhweb.util.SecurityUtils" %>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">D
		<a class="navbar-brand" href="#">Start Bootstrap</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<%-- Nếu chưa đăng nhập (là vô danh) --%>
				<security:authorize access="isAnonymous()">
					<li class="nav-item active"><a class="nav-link" href='<c:url value="/login" />'>Login</a></li>
					<li class="nav-item"><a class="nav-link" href='<c:url value="/login" />'>Register</a></li>
				</security:authorize>

				<%-- Đã đăng nhập vào thành công--%>
				<security:authorize access="isAuthenticated()">
					<li class="nav-item"><a class="nav-link" href="#">Hello <%=SecurityUtils.getPrincipal().getFullName()%>
						<span class="sr-only">(current)</span></a></li>
					<li class="nav-item active"><a class="nav-link" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Services</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Product</a></li>
					<li class="nav-item"><a class="nav-link" href='<c:url value="/logout" />'>Logout</a></li>
				</security:authorize>

			</ul>
		</div>
	</div>
</nav>