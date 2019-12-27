<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Các loại giày</title>
<link rel="shortcut icon" href="Image/adidas-yeezy-350-v2-true-form-replica.jpg" type="image/x-icon" />
<link rel="stylesheet" href="Template/Front/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="Template/Front/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="Template/Front/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="Template/Front/vendors/linericon/style.css">
<link rel="stylesheet" href="Template/Front/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="Template/Front/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="Template/Front/vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="Template/Front/vendors/nouislider/nouislider.min.css">
<link rel="stylesheet" href="Template/Front/css/style.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.1/css/bootstrap.min.css"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 <script src="Template/Front/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
body {
	background-color: #f4f9f2;
}

</style>
	
	 <script type="text/javascript">
	  <c:url var="url" value="CartController"></c:url>
	   		function checksessionexiststoaddProductInCart(id_product) {
	  		 	var noticeToUser ="Bạn phải đăng nhập để thực hiện chức năng này!";
				var session = '<%=(String)session.getAttribute("sessionName")%>';
		   		  if(session == 'null'){
			  	  $('#myModal').modal('show');
		 		 }
				  else{
					  document.location.href="${url}"+"?id_Product="+id_product;
      			    }		
				}
    </script>
	 
    <script type="text/javascript">
          <c:url var="url" value="UserTymController"></c:url>
	   		function checksessionexistsToDropHeart(id_product) {
	  		 	var noticeToUser ="Bạn phải đăng nhập để thực hiện chức năng này!";
				var session = '<%=(String)session.getAttribute("sessionName")%>';
		   		  if(session == 'null'){
			  	  $('#myModal').modal('show');
		 		 }
				  else{
        	 		 document.location.href="${url}"+"?id_Product="+id_product;
      			    }		
				}
    </script>

<script type="text/javascript">
	function searchByName() {
		var xmlhttp;
		var name_Product = document.myform.name_Product.value;
		if (name_Product != "") {
			var url = "SearchProductByNameController?name_Product="
					+ name_Product;
			if (window.XMLHttpRequest) {
				xmlhttp = new XMLHttpRequest();
			} else {
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange = function() {
				var data = xmlhttp.responseText;
				document.getElementById("myProduct").innerHTML = data;
			}
			xmlhttp.open("POST", url, true);
			xmlhttp.send();
		} else {
			document.getElementById("myProduct").innerHTML = "";

		}
	}
</script>
</head>
<body>
	<div id="fb-root"></div>
	<script async defer crossorigin="anonymous"
		src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v4.0"></script>

	<!--================ Start Header Menu Area =================-->
	<jsp:include page="header.jsp"></jsp:include>
	<!--================ End Header Menu Area =================-->
	
	<!-- Breadcrum -->
	<section>
	<div class="container">
		<nav aria-label="breadcrumb"
			style="margin-top:25px;">
		<ol class="breadcrumb" style="background: #f2f2f2;">
			<li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
			<li class="breadcrumb-item active" aria-current="page">Sản phẩm</li>
		</ol>
		</nav>
	</div>
	</section>
	<!-- End breadcrum -->
	<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="margin-top: 120px">
        <div class="modal-header">
         <h5 class="modal-title" style="margin-left: 180px">Thông báo</h5>
        </div>
        <div class="modal-body">
          <p>Bạn phải đăng nhập để thực hiện chức năng này!</p>
        </div>
        <div class="modal-footer">
         <a class="btn btn-danger"  class="fa fa-remove" class="btn btn-danger"  href="LoginController#login" style="color: #fff;">&nbsp;Đăng nhập</a>
		 <button  class="btn btn-warning"type="button" class="btn btn-default" data-dismiss="modal" style="color: #fff;"><i class="fa fa-remove"></i>&nbsp;Hủy</button>
       </div>
      </div>
    </div>
  </div>
  <!-- Modal -->
	<!-- ================ category section start ================= -->
	<section class="section-margin--small mb-5" id="category"
		style="margin-top:5px">
	<div class="container">

		<div class="row">
			<div class="col-xl-3 col-lg-4 col-md-5">
				<div class="sidebar-categories">
					<div class="head">Loại giày</div>
					<ul class="main-categories">
						<li class="common-filter">
							<ul>
								<li class="filter-list"><a
									href="CategoryController?choosecategory=adidas">Adidas</a></li>
								<li class="filter-list"><a
									href="CategoryController?choosecategory=converse">Converse</a></li>
								<li class="filter-list"><a
									href="CategoryController?choosecategory=vans">Vans</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="sidebar-filter">
					<div class="top-filter-head">Lọc Theo</div>
					<div class="common-filter">
						<div class="head">
							<span style="color: black;"><b>Sắp xếp theo giá</b></span>
						</div>
						<ul>
							<li class="filter-list"><a
								href="CategoryController?arrangeuserchoose=lowtohigh">Từ
									thấp đến cao</a></li>
							<li class="filter-list"><a
								href="CategoryController?arrangeuserchoose=hightolow">Từ
									cao xuống thấp</a></li>

						</ul>
					</div>
					<div class="common-filter">
						<div class="head">
							<span style="color: black"><b>Khoảng giá</b></span>
						</div>
						<ul>
							<li class="filter-list"><a
								href="CategoryController?gia1=200000&gia2=300000">200.000
									- 300.000 Vnđ</a></li>
							<li class="filter-list"><a
								href="CategoryController?gia1=300000&gia2=1000000">300.000
									- 1000.000 Vnđ</a></li>
							<li class="filter-list"><a
								href="CategoryController?gia1=1000000&gia2=3000000">1000.000
									- 3000.000 Vnđ</a></li>
						</ul>
					</div>

				</div>
			</div>
			<div class="col-xl-9 col-lg-8 col-md-7">
				<!-- Start Filter Bar -->
				<form name="myform" onkeyup="searchByName()">
					<div class="filter-bar d-flex flex-wrap align-items-center">

						<div>
							<div class="input-group filter-bar-search">
								<input type="text" placeholder="Mời bạn nhập tên sản phẩm...." name="name_Product"
									style="width: 500px;boder-radius:30px">
								<div class="input-group-append"></div>
							</div>
						</div>
					</div>
				</form>
				<!-- End Filter Bar -->
				<!-- Start Best Seller -->
		<div class="row" id="myProduct">
          	<c:forEach items="${listProducts}" var="product">
			<div class="col-md-6 col-lg-4 contentPage">
				<div class="card text-center card-product">
					<div class="card-product__img">
						<img class="card-img" src="Image/${product.images}" alt="Hình ảnh"
							style="width: 230px; height: 150px">
						<ul class="card-product__imgOverlay">
							<li><button>
									<i class="ti-search"></i>
								</button></li>
							<li><button type="button" onclick="checksessionexiststoaddProductInCart(id_product=${product.id})" >
									<i class="ti-shopping-cart"></i>
								</button></li>

							<li><button onclick="checksessionexistsToDropHeart(id_product=${product.id})">
									<i class="ti-heart"></i>
								</button></li>
						</ul>
					</div>
					<div class="card-body">
						<p style="color: red">${product.sale}% off</p>
						<h4 class="card-product__title">
						<c:url var="url" value="SingleProductController"></c:url>
							<a href="${url}?id_Product=${product.id}">${product.name}</a>
						</h4>
						<p class="card-product__price">
						<fmt:formatNumber value="${product.price}" type = "number" minFractionDigits = "0"/> Vnđ
						</p>
					</div>
				</div>
			</div>
		
			</c:forEach>
		</div>
 <ul class="pagination" id="pagination" style="margin-left: 600px">  </ul>

		<!-- End Best Seller -->
	</div>
	</div>
	</div>
	</section>
	<!-- ================ category section end ================= -->
	<script type="text/javascript">
            $(function () {
                var pageSize = 9; // Hiển thị 9 sản phẩm trên 1 trang
                showPage = function (page) {
                    $(".contentPage").hide();
                    $(".contentPage").each(function (n) {
                        if (n >= pageSize * (page - 1) && n < pageSize * page)
                            $(this).show();
                    });
                }
                showPage(1);
                ///** Cần truyền giá trị vào đây **///
                var totalRows = 40; // Tổng số sản phẩm hiển thị
                var btnPage = 3; // Số nút bấm hiển thị di chuyển trang
                var iTotalPages = Math.ceil(totalRows / pageSize);
				
                var obj = $('#pagination').twbsPagination({
                    totalPages: iTotalPages,
                    visiblePages: btnPage,
                    prev: '«',
                    next: '»',
                    first: null,
                    last: null,
                    onPageClick: function (event, page) {
                        console.info(page);
                        showPage(page);
                    }
                });
                console.info(obj.data());
            });
        </script>

	<!-- ================ Subscribe section start ================= -->
	<jsp:include page="notifyemail.jsp"></jsp:include>
	<!-- ================ Subscribe section end ================= -->


	<!--================ Start footer Area  =================-->
	<jsp:include page="footer.jsp"></jsp:include>
	<!--================ End footer Area  =================-->

	<script src="Template/Front/vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="Template/Front/vendors/skrollr.min.js"></script>
	<script src="Template/Front/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script
		src="Template/Front/vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="Template/Front/vendors/nouislider/nouislider.min.js"></script>
	<script src="Template/Front/vendors/jquery.ajaxchimp.min.js"></script>
	<script src="Template/Front/vendors/mail-script.js"></script>
	<script src="Template/Front/js/main.js"></script>
</body>
</html>