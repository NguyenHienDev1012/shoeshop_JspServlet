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
<title>Thêm tài khoản người dùng</title>

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



<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<!--For Development Only. Not required -->
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
					<div class="col-lg-6">
						<div class="box dark">
							<header>
	             <h3 style="color: #dc3545;margin-left: 20px">Thêm tài khoản khách hàng</h3>
								<!-- .toolbar -->
								<div class="toolbar">
									<nav style="padding: 8px;"></nav>
								</div>
								<!-- /.toolbar -->
							</header>
							<div id="div-1" class="body">
								<form class="form-horizontal" method="POST" action="AdminAddUser">
							
									<div class="form-group">
										<label for="text1" class="control-label col-lg-4">Tên đăng nhập</label>

										<div class="col-lg-8">
											<input type="text" id="username"
												class="form-control" name="username">
										</div>
									</div>
										<div class="form-group">
										<label for="pass1" class="control-label col-lg-4">Email:</label>

										<div class="col-lg-8">
											<input class="form-control"  type="email" id="email" name="email"/>
										</div>
									</div>
									<div class="form-group">
										<label for="text1" class="control-label col-lg-4">Mật khẩu:</label>

										<div class="col-lg-8">
											<input type="text" 
												class="form-control" name="password">
										</div>
									</div>
									<!-- /.form-group -->


									<div class="form-group">
										<label class="control-label col-lg-4">Quyền truy cập:</label>

										<div class="col-lg-8">
											<input type="text"
												class="form-control" name="role">
										</div>
									</div>
								
								<div class="form-group">
										<label class="control-label col-lg-4">Chú ý:</label>

										<div class="col-lg-8">
											<label class="control-label col-lg-6" > <span style="color: red">* 1:</span> Khách hàng</label>
											<label class="control-label col-lg-6"> <span style="color: red">* 2:</span> Quản trị viên</label>
										</div>
									</div>
								
									<input type="submit" value="Thêm"
										style="margin-bottom: 57px; margin-left: 240px" class="btn btn-success">
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
  <p>2019 &copy; Quản trị viên: Nguyễn Hiền && Trọng Nghĩa </p>	</footer>
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


</body>

</html>