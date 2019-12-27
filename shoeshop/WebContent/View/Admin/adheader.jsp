<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<!--IE Compatibility modes-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--Mobile first-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Home</title>

<meta name="description"
	content="Free Admin Template Based On Twitter Bootstrap 3.x">
<meta name="author" content="">

<meta name="msapplication-TileColor" content="#5bc0de" />
<meta name="msapplication-TileImage" content="assets/img/metis-tile.png" />

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
<title>Header Admin</title>
</head>
<body>
<body class="  ">
	<div class="bg-dark dk" id="wrap">
		<div id="top">
			<!-- .navbar -->
			<nav class="navbar navbar-inverse navbar-static-top">
				<div class="container-fluid">


					<!-- Brand and toggle get grouped for better mobile display -->
					<header class="navbar-header">

						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-ex1-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>

					</header>



					<div class="topnav">
						<div class="btn-group">
							<a href="LogoutController" data-toggle="tooltip"
								data-placement="bottom" class="btn btn-metis-1 btn-sm"> <i
								class="glyphicon glyphicon-log-out"></i>&nbsp; Đăng xuất
							</a>
						</div>
					</div>




					<div class="collapse navbar-collapse navbar-ex1-collapse">

						<!-- .nav -->
						<ul class="nav navbar-nav">
							<li><a href="AdminHomeForward"><img alt="logo"
									src="Image/slip-on-check.png" style="width: 50px; height: 30px"></a></li>
							<li><a href="AdminStatisticController">Thống kê</a></li>
							<li><a href="AdminManageListBill">Danh sách đơn hàng</a></li>
							<li><a href="AdminManageListUserController">Danh sách
									tài khoản khách hàng</a></li>
							<li class='dropdown '>
							<li><a href="AdminManageListProduct">Danh sách thông tin
									sản phẩm</a></li>
							<li><a href="AdminManageListCategory">Danh sách thông
									tin loại sản phẩm</a></li>
							<li><a href="AdminManageListComment">Danh sách bình luận</a>
							</li>

							</li>

						</ul>
						<!-- /.nav -->
					</div>
				</div>
				<!-- /.container-fluid -->
			</nav>
			<!-- /.navbar -->
			<header class="head">
				<div class="search-bar">
					<form class="main-search" action="">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Tìm kiếm ..."> <span
								class="input-group-btn">
								<button class="btn btn-primary btn-sm text-muted" type="button">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div>
					</form>
					<!-- /.main-search -->
				</div>
				<!-- /.search-bar -->

				<!-- /.main-bar -->
			</header>
			<!-- /.head -->
		</div>
		<!-- /#top -->
		<div id="left">
			<div class="media user-media bg-dark dker">
				<div class="user-media-toggleHover">
					<span class="fa fa-user"></span>
				</div>
				<div class="user-wrapper bg-dark">
					<a class="user-link" href=""> <span
						class="label label-danger user-label">16</span>
					</a>

					<div class="media-body">
						 <c:choose>
		 				    <c:when test="${not empty sessionAdmin}"><h5 style="color: white; text-align: center">Chào quản trị viên: <span style="color: red">${sessionAdmin}</span></h5></c:when> 
		   				    <c:otherwise></c:otherwise> 
                          </c:choose>
						<ul class="list-unstyled user-info">
						</ul>
					</div>
				</div>
			</div>
			<!-- #menu -->
			<ul id="menu" class="bg-blue dker">

				<li class="nav-header">Danh mục quản lý</li>

				<li class="nav-divider"></li>
				<li class=""><a href="AdminStatisticController"> <span
						class="link-title">Thống kê</span>
				</a></li>
				
				<li class=""><a href="javascript:;"> <span
						class="link-title"> Danh mục</span>

				
				</a>
					<ul class="collapse in">
						<li><a href="AdminManageListBill">Danh sách đơn hàng</a></li>
						<li><a href="AdminManageListUserController"> <span
								class="link-title"> Danh sách tài khoản khách hàng</span>
						</a> <!-- 						<li><a href="AdminEditInforUser"> Cập nhật tài khoản -->
							<!-- 								khách hàng </a></li> -->
						<li><a href="AdminManageListProduct"> Danh sách thông tin
								sản phẩm </a></li>
						<li><a href="AdminManageListCategory">Danh sách thông tin
								loại sản phẩm</a></li>
						<li><a href="AdminManageListComment">Danh sách bình luận</a>
						</li>
					</ul></li>


				<li><a href="View/Admin/table.jsp"> <span
						class="link-title"> Danh sách các loại giày</span>

				</a>
				<li><a href="View/Admin/chart.jsp"> <span
						class="link-title"> Thêm </span>
				</a></li>

			</ul>
			<!-- /#menu -->
</body>
</html>