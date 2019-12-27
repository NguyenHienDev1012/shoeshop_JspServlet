<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--IE Compatibility modes-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--Mobile first-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Danh sách bình luận</title>
<meta name="description"
	content="Free Admin Template Based On Twitter Bootstrap 3.x">
<meta name="author" content="">
<meta name="msapplication-TileColor" content="#5bc0de" />
<meta name="msapplication-TileImage"
	content="Template/Admin/assets/img/metis-tile.png" />
<link rel="stylesheet"
	href="Template/Admin/assets/lib/metismenu/metisMenu.css">
<!-- onoffcanvas stylesheet -->
<link rel="stylesheet"
	href="Template/Admin/assets/lib/onoffcanvas/onoffcanvas.css">
<!-- animate.css stylesheet -->
<link rel="stylesheet"
	href="Template/Admin/assets/lib/animate.css/animate.css">


<script>
	less = {
		env : "development",
		relativeUrls : false,
		rootpath : "Template/Admin/assets/"
	};
</script>
<link rel="stylesheet"
	href="Template/Admin/assets/css/style-switcher.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.1/less.js"></script>

</head>
<body>
	<jsp:include page="adheader.jsp"></jsp:include>


	</div>
	<!-- /#left -->
	<div id="content">
		<div class="outer">
			<div class="inner bg-light lter">
				<!--Begin Datatables-->
				<div class="row">
					<div class="col-lg-12">
						<div class="box">
							<header>
								<div class="icons">
									<i class="fa fa-table"></i>
								</div>
						<h3 style="color: #dc3545; margin-left: 20px">Danh sách bình luận</h3>
                        <c:choose>
 				 			 <c:when test="${not empty messageAdminActionComment}"><h4 style="color: red; margin-left: 20px">${messageAdminActionComment}</h4></c:when> 
   							  <c:otherwise></c:otherwise> 
               			</c:choose>

							</header>
							<div id="collapse4" class="body">	
							<a class="btn btn-success"
									href="AdminAddUser"><i
									class="glyphicon glyphicon-plus"></i>&nbsp; Thêm</a>
							<a class="btn btn-success" href="#"><i
									class="glyphicon glyphicon-import"></i>&nbsp; Import </a>
						    <a class="btn btn-success" href="#"><i
									class="glyphicon glyphicon-export"></i>&nbsp; Export </a>
								<table style="margin-top: 12px" id="dataTable"
									class="table table-bordered table-condensed table-hover table-striped">
									<thead>
										<tr>
											<th>Mã người bình luận</th>
											<th>Tên đăng nhập</th>
											<th>Bình luận</th>
											<th>Mã sản phẩm</th>
											<th>Thao tác</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${listComment}" var="comment">
											<tr>
												<td>${comment.id}</td>
												<td>${comment.name}</td>
												<td>${comment.content}</td>
												<td>${comment.id_product}</td>
												<td><a class="btn btn-primary"
													href="AdminEditComment?id_comment=${comment.id}"><i
														class="glyphicon glyphicon-edit"></i>&nbsp; Sửa</a>
												<a class="btn btn-danger"
													href="AdminRemoveComment?id_comment=${comment.id}"><i
														class="glyphicon glyphicon-remove"></i>&nbsp; Xoá</a></td>
											</tr>

										</c:forEach>


									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->
				<!--End Datatables-->
			</div>
			<!-- /.inner -->
		</div>
		<!-- /.outer -->
	</div>
	<!-- /#content -->

	</div>
	<!-- /#wrap -->
	<footer class="Footer bg-dark dker">
		<p>2019 &copy; Quản trị viên: Nguyễn Hiền && Trọng Nghĩa</p>
	</footer>
	<!-- /#footer -->
	<!--jQuery -->
	<script src="assets/lib/jquery/jquery.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/js/dataTables.bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.26.6/js/jquery.tablesorter.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jqueryui-touch-punch/0.2.3/jquery.ui.touch-punch.min.js"></script>

	<!--Bootstrap -->
	<script src="Temlate/Admin/assets/lib/bootstrap/js/bootstrap.js"></script>
	<!-- MetisMenu -->
	<script src="Temlate/Admin/assets/lib/metismenu/metisMenu.js"></script>
	<!-- onoffcanvas -->
	<script src="Temlate/Admin/assets/lib/onoffcanvas/onoffcanvas.js"></script>
	<!-- Screenfull -->
	<script src="Temlate/Admin/assets/lib/screenfull/screenfull.js"></script>


	<!-- Metis core scripts -->
	<script src="Temlate/Admin/assets/js/core.js"></script>
	<!-- Metis demo scripts -->
	<script src="Temlate/Admin/assets/js/app.js"></script>


</body>
</html>