<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ page import="com.laptrinhweb.util.SecurityUtils" %>
<div class="navbar navbar-default" id="navbar">
	<script type="text/javascript">
		try {
			ace.settings.check('navbar', 'fixed')
		} catch (e) {}
	</script>

	<div class="navbar-container" id="navbar-container">
		<div class="navbar-header pull-left">
			<a href="#" class="navbar-brand"> <small> <i class="icon-leaf"></i>  Wellcome <%=SecurityUtils.getPrincipal().getFullName()%>
				</small>
			</a>
			<!-- /.brand -->
		</div>
		<!-- /.navbar-header -->

		<div class="navbar-header pull-right" role="navigation">
			<ul class="nav ace-nav">
				<li class="grey"><a data-toggle="dropdown" class="dropdown-toggle" href="#"> <i class="icon-tasks"></i>
						<span class="badge badge-grey">4</span>
					</a>

					<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
						<li class="dropdown-header"><i class="icon-ok"></i> 4 Tasks
							to complete</li>

						<li><a href="#">
								<div class="clearfix">
									<span class="pull-left">Software Update</span> <span class="pull-right">65%</span>
								</div>

								<div class="progress progress-mini ">
									<div style="width: 65%" class="progress-bar "></div>
								</div>
							</a></li>

						<li><a href="#">
								<div class="clearfix">
									<span class="pull-left">Hardware Upgrade</span> <span class="pull-right">35%</span>
								</div>

								<div class="progress progress-mini ">
									<div style="width: 35%" class="progress-bar progress-bar-danger"></div>
								</div>
							</a></li>

						<li><a href="#">
								<div class="clearfix">
									<span class="pull-left">Unit Testing</span> <span class="pull-right">15%</span>
								</div>

								<div class="progress progress-mini ">
									<div style="width: 15%" class="progress-bar progress-bar-warning"></div>
								</div>
							</a></li>

						<li><a href="#">
								<div class="clearfix">
									<span class="pull-left">Bug Fixes</span> <span class="pull-right">90%</span>
								</div>

								<div class="progress progress-mini progress-striped active">
									<div style="width: 90%" class="progress-bar progress-bar-success"></div>
								</div>
							</a></li>

						<li><a href="#"> See tasks with details <i class="icon-arrow-right"></i>
							</a></li>
					</ul>
				</li>

				<li class="purple"><a data-toggle="dropdown" class="dropdown-toggle" href="#"> <i
							class="icon-bell-alt icon-animated-bell"></i> <span class="badge badge-important">8</span>
					</a>

					<ul class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
						<li class="dropdown-header"><i class="icon-warning-sign"></i>
							8 Notifications</li>

						<li><a href="#">
								<div class="clearfix">
									<span class="pull-left"> <i class="btn btn-xs no-hover btn-pink icon-comment"></i>
										New
										Comments
									</span> <span class="pull-right badge badge-info">+12</span>
								</div>
							</a></li>

						<li><a href="#"> <i class="btn btn-xs btn-primary icon-user"></i> Bob just signed up
								as an editor ...
							</a></li>

						<li><a href="#">
								<div class="clearfix">
									<span class="pull-left"> <i
											class="btn btn-xs no-hover btn-success icon-shopping-cart"></i>
										New Orders
									</span> <span class="pull-right badge badge-success">+8</span>
								</div>
							</a></li>

						<li><a href="#">
								<div class="clearfix">
									<span class="pull-left"> <i class="btn btn-xs no-hover btn-info icon-twitter"></i>
										Followers
									</span> <span class="pull-right badge badge-info">+11</span>
								</div>
							</a></li>

						<li><a href="#"> See all notifications <i class="icon-arrow-right"></i>
							</a></li>
					</ul>
				</li>

				<li class="green"><a data-toggle="dropdown" class="dropdown-toggle" href="#"> <i
							class="icon-envelope icon-animated-vertical"></i> <span class="badge badge-success">5</span>
					</a>

					<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
						<li class="dropdown-header"><i class="icon-envelope-alt"></i>
							5 Messages</li>

						<li><a href="inbox.html"> See all messages <i class="icon-arrow-right"></i>
							</a></li>
					</ul>
				</li>

				<li class="nav-item"><a class="nav-link" href='<c:url value="/login" />'>Logout</a></li>
			</ul>
			<!-- /.ace-nav -->
		</div>
		<!-- /.navbar-header -->
	</div>
	<!-- /.container -->
</div>