<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Danh sách bài viết</title>
</head>

<body>
<div class="main-content">
	<!-- Submit vào cái controller adminNews. Vào đó để lấy các phương thức (trường hợp này là get) -->
	<form action="<c:url value='/admin/news/list' />" id="form-submit" method="get">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="widget-box table-filter">
					<div class="table-btn-controls">
						<div class="pull-right tableTools-container">
							<div class="dt-buttons btn-overlap btn-group">
								<%--THêm bài viết--%>
								<c:url var="createNewsURL" value="/admin/news/edit"/>
								<a flag="info"
								   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold btn-custom"
								   data-toggle="tooltip"
									<%--Điều hướng đến trang edit--%>
								   title='Thêm bài viết' href='${createNewsURL}'>
									<i class="fa fa-plus-circle bigger-110 purple"></i>
								</a>
								<%--Xóa bài viết--%>
								<button id="btnDelete" type="button"
										class="dt-button buttons-html5 btn btn-white btn-primary btn-bold btn-custom"
										data-toggle="tooltip"
										title='Xóa bài viết'>
									<i class="fa fa-trash-o bigger-110 pink"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<%--Hiển thị alert--%>
						<c:if test="${not empty messageResponse}">
							<div class="alert alert-${alert}">
									${messageResponse}
							</div>
						</c:if>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead class="thead-dark">
								<tr>
									<th>
										<div class="form-check" style="display: inline-block; margin-bottom: 0px">
											<input class="form-check-input" type="checkbox" value="" id="chooseAll">
										</div>
										Chọn tất cà
									</th>
									<th>Tên bài viết</th>
									<th>Mô tả</th>
									<th>Tác giả</th>
									<th>Thao tác</th>
								</tr>
								</thead>
								<tbody>
								<!-- Lấy ra tất cả các bài viết của news -->
								<c:forEach var="item" items="${ model.listResult }">
									<tr class="${item.createdBy == 'Admin' ? 'success' : ''}">
										<td>
											<div class="form-check">
												<input class="form-check-input" type="checkbox" value="" id="checkbox_">
											</div>
										</td>
										<td>${ item.title }</td>
										<td>${ item.shortDescription }</td>
										<td>${ item.id }</td>

										<td>
										<%--Sử dụng c:url và c:param để truyền tham số cho url--%>
											<c:url var="updateNewURL" value="/admin/news/edit">
												<c:param name="id" value="${item.id}"/>
											</c:url>

											<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
											   title="Cập nhật bài viết" href='${updateNewURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
											</a>
										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<!-- Đây là cục để đưa ra các số trang, tuyệt đối phải có -->
							<ul class="pagination" id="pagination"></ul>

							<!-- 2 giá trị này sẽ truyền xuống cho server khi ng dùng click vào trang
                            thông qua controller. maxPageItem là số item tối đa trên trang
                            còn page là cái page khi ng dùng click -->
							<!-- Khi tiến hành submit thì value sẽ có giá trị -->
							<!-- offset là page chọn, limit là tổng số item trong 1 page. Sẽ được đưa
                            vào server và truy vấn qua sql -->
							<input type="hidden" value="" id="page" name="page">
							<input type="hidden" value="" id="limit" name="limit">
							<%--<input type="hidden" value="" id="sortName" name="sortName">
							<input type="hidden" value="" id="sortBy" name="sortBy">--%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>

<!-- Đoạn script khai báo trang hiển thị -->
<script type="text/javascript">
	var currentPage = ${model.page};
	var totalPage = ${model.totalPage};
	var limit = 2;
	$(function () {
		window.pagObj = $('#pagination').twbsPagination({
			totalPages: totalPage,
			visiblePages: 10,
			startPage: currentPage,
			onPageClick: function (event, page) {
				if(currentPage != page) {
					$('#limit').val(limit);
					$('#page').val(page);
					// $('#sortName').val('title');
					// $('#sortBy').val('desc');

					// Gọi ra form submit để load lại form và vào trang mới: Trỏ tới form ở trên
					$('#form-submit').submit();
				}
			}
		});
	});
</script>
</body>

</html>