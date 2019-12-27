<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--IE Compatibility modes-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--Mobile first-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Sửa bình luận</title>

<meta name="description"
	content="Free Admin Template Based On Twitter Bootstrap 3.x">
<meta name="author" content="">

<meta name="msapplication-TileColor" content="#5bc0de" />
<meta name="msapplication-TileImage"
	content="Template/Admin/assets/img/metis-tile.png" />

<!-- Bootstrap -->
<link rel="stylesheet"
	href="Template/Admin/assets/lib/bootstrap/css/bootstrap.css">

<!-- Font Awesome -->

<!-- Metis core stylesheet -->
<link rel="stylesheet" href="Template/Admin/assets/css/main.css">

<!-- metisMenu stylesheet -->
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
				<!--BEGIN INPUT TEXT FIELDS-->
				<div class="row">
					<div class="col-lg-12">
						<div class="box dark">
							<header>
								<h3 style="color: #dc3545; margin-left: 20px">Sửa bình luận</h3>
								<!-- .toolbar -->
								<br>
								<div class="toolbar">
									<nav style="padding: 8px;"></nav>
								</div>
								<!-- /.toolbar -->
							</header>
							<div id="div-1" class="body">
								<form class="form-horizontal" method="POST"
									action="AdminEditComment">
									<div class="form-group">
										<label class="control-label col-lg-2">Mã bình luận: </label>

										<div class="col-lg-4">
											<input type="text" value="${comment.id}"
												readonly="readonly" class="form-control" name="id_comment">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-2">Tên tài khoản: </label>

										<div class="col-lg-4">
											<input type="text" value="${comment.name}" readonly="readonly"
												class="form-control" name="name_user">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-2">Mã sản phẩm: </label>

										<div class="col-lg-4">
											<input type="text" value="${comment.id_product}" readonly="readonly"
												class="form-control" name="id_product">
										</div>
									</div>

								    <div class="col-lg-10">
									        <div class="box">
									            <header>
									                <div class="icons"><i class="fa fa-th-large"></i></div>
									                  <h5 style="margin-left: 35px">Bình luận</h5>
									                <!-- .toolbar -->
									            <div class="toolbar">
									              <nav style="padding: 8px;">
									                  <a href="javascript:;" class="btn btn-default btn-xs collapse-box">
									                      <i class="fa fa-minus"></i>
									                  </a>
									                  <a href="javascript:;" class="btn btn-default btn-xs full-box">
									                      <i class="fa fa-expand"></i>
									                  </a>
									                  <a href="javascript:;" class="btn btn-danger btn-xs close-box">
									                      <i class="fa fa-times"></i>
									                  </a>
									              </nav>
									            </div>            <!-- /.toolbar -->
									            </header>
									
									            <div class="body">
									                    <textarea id="ckeditor" class="ckeditor" name="content">${comment.content}</textarea>
									
									            </div>
									        </div>
									    </div>
									<!-- /.col-lg-12 -->
							</div>
							<!-- /.row -->


							<input type="submit" value="Cập nhật"
								style="margin-bottom: 57px; margin-left: 240px"
								class="btn btn-primary"> <br> <br> <br> <br>
							<br> <br>
							</form>
						</div>
					</div>
				</div>

				<!--END TEXT INPUT FIELD-->


			</div>
			<!-- /.inner -->
		</div>
		<!-- /.outer -->
	</div>
	<!-- /#content -->


	</div>
	</div>
	<!-- /#wrap -->
	<footer class="Footer bg-dark dker">
		<p>2019 &copy; Quản trị viên: Nguyễn Hiền && Trọng Nghĩa</p>
	</footer>
	<!-- /#footer -->
	<!--jQuery -->
	<script src="Template/Admin/ssets/lib/jquery/jquery.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.14.1/moment.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-colorpicker/2.0.1/js/bootstrap-colorpicker.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

	<!--Bootstrap -->
	<script src="Template/Admin/assets/lib/bootstrap/js/bootstrap.js"></script>
	<!-- MetisMenu -->
	<script src="Template/Admin/assets/lib/metismenu/metisMenu.js"></script>
	<!-- onoffcanvas -->
	<script src="Template/Admin/assets/lib/onoffcanvas/onoffcanvas.js"></script>
	<!-- Screenfull -->
	<script src="Template/Admin/assets/lib/screenfull/screenfull.js"></script>

	<script
		src="Template/Admin/assets/lib/inputlimiter/jquery.inputlimiter.js"></script>
	<script
		src="Template/Admin/assets/lib/validVal/js/jquery.validVal.min.js"></script>

	<!-- Metis core scripts -->
	<script src="assets/js/core.js"></script>
	<!-- Metis demo scripts -->


	<!-- CKeditor -->
	<script src="assets/lib/jquery/jquery.js"></script>

	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.5.10/ckeditor.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/epiceditor/0.2.2/js/epiceditor.min.js"></script>

	<!--Bootstrap -->
	<script src="assets/lib/bootstrap/js/bootstrap.js"></script>
	<!-- MetisMenu -->
	<script src="assets/lib/metismenu/metisMenu.js"></script>
	<!-- onoffcanvas -->
	<script src="assets/lib/onoffcanvas/onoffcanvas.js"></script>
	<!-- Screenfull -->
	<script src="assets/lib/screenfull/screenfull.js"></script>

	<script
		src="/assets/lib/bootstrap3-wysihtml5-bower/dist/bootstrap3-wysihtml5.all.min.js"></script>
	<script
		src="/assets/lib/pagedown-bootstrap/js/jquery.pagedown-bootstrap.combined.min.js"></script>

	<!-- Metis core scripts -->
	<script src="assets/js/core.js"></script>
	<!-- Metis demo scripts -->
	<script src="assets/js/app.js"></script>

	<!--  -->

</body>

</html>