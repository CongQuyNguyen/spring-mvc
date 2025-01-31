<%@include file="/common/taglib.jsp"%>

<div class="sidebar" id="sidebar">
	<script type="text/javascript">
		try {
			ace.settings.check('sidebar', 'fixed')
		} catch (e) {}
	</script>

	<div class="sidebar-shortcuts" id="sidebar-shortcuts">
		<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
			<button class="btn btn-success">
				<i class="icon-signal"></i>
			</button>

			<button class="btn btn-info">
				<i class="icon-pencil"></i>
			</button>

			<button class="btn btn-warning">
				<i class="icon-group"></i>
			</button>

			<button class="btn btn-danger">
				<i class="icon-cogs"></i>
			</button>
		</div>

		<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
			<span class="btn btn-success"></span> <span class="btn btn-info"></span>

			<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
		</div>
	</div>
	<!-- #sidebar-shortcuts -->

	<ul class="nav nav-list">
		<li><a href="index.html"> <i class="icon-dashboard"></i> <span class="menu-text"> News manage </span>
			</a></li>
		<li><a href='<c:url value="/admin/news/list?page=1&limit=2"/>'> <i class="icon-text-width"></i> <span class="menu-text"> News list
				</span>
			</a></li>

		<li><a href='<c:url value="#"/>' class="menu-text"> <i class="icon-desktop"></i> <span
					class="menu-text"> User list </span>
			</a>
		</li>

		<li><a href=<c:url value="#"/>> <i class="icon-list"></i>
				<span class="menu-text"> Categories </span>
			</a>
		</li>
	</ul>
	<!-- /.nav-list -->

	<div class="sidebar-collapse" id="sidebar-collapse">
		<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
	</div>

	<script type="text/javascript">
		try {
			ace.settings.check('sidebar', 'collapsed')
		} catch (e) {}
	</script>
</div>