<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang chủ</title>
<link rel="shortcut icon" href="Image/adidas-yeezy-350-v2-true-form-replica.jpg" type="image/x-icon" />

<link rel="stylesheet"
	href="Template/Front/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="Template/Front/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="Template/Front/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="Template/Front/vendors/linericon/style.css">
<link rel="stylesheet"
	href="Template/Front/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="Template/Front/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="Template/Front/css/style.css">
<!--  drop down-->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
  <!--  Drop down hello  -->
  
  <!-- End Drop down hello-->
  <style>
  body {
  background-color: #f4f9f2;
  }
  /* Make the image fully responsive */
  .carousel-inner img {
      width: 100%;
      height: 100%;
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
	   		function checksessionexistsToDropHeart(id_product) {
	  		 	var noticeToUser ="Bạn phải đăng nhập để thực hiện chức năng này!";
				var session = '<%=(String)session.getAttribute("sessionName")%>';
		   		  if(session == 'null'){
			  	  $('#myModal').modal('show');
		 		 }
				  else{
        	 		 document.location.href="UserTymController"+"?id_Product="+id_product;
      			    }		
				}
    </script>
</head>
<body>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v4.0"></script>

	<!--================ Start Header Menu Area =================-->
	<jsp:include page="header.jsp"></jsp:include>

	<!--================ End Header Menu Area =================-->

<div class="container">

<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="Image/Banner_Adidas_Yeezy.jpg" alt="yeezy" style="width: 1200px;height: 500px">
    </div>
    <div class="carousel-item">
      <img src="Image/banner.jpg" alt="Chicago" style="width: 1200px;height: 500px">
    </div>
    <div class="carousel-item">
      <img src="Image/converse_evergreen_amazon_brandbanner_1216x512.jpeg" alt="New York" style="width: 1200px;height: 500px" >
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
</div>

	
	<section class="section-margin calc-60px">
	<div class="container">
		<div class="section-intro pb-60px">
			<h4 style="color:blue">
				Sản phẩm thịnh hành
			</h4>
		</div>
		<div class="row">
			<c:forEach items="${listProducts}" var="product">
				<div class="col-md-6 col-lg-4 col-xl-3">
					<div class="card text-center card-product">
						<div class="card-product__img">
							<img class="card-img" src="Image/${product.images}" alt="">
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
							<p style="color: red">${product.sale}% OFF</p>
							<h4 class="card-product__title">
								<a href="SingleProductController?id_Product=${product.id}">${product.name }</a>
							</h4>
							<p class="card-product__price">
							<fmt:formatNumber value="${product.price}" type = "number" minFractionDigits = "0"/> Vnđ</p>
						</div>
					</div>
				</div>
			</c:forEach>
</div>
</section><!-- Pagination -->
<div class="container">
	<ul class="pagination" style="margin-left: 900px">
    <li class="page-item"><a class="page-link" href="HomeForward?pageid=${pageidnumber-1}">&laquo;</a></li>
    <li class="page-item"><a class="page-link" href="HomeForward?pageid=1">1</a></li>
    <li class="page-item"><a class="page-link" href="HomeForward?pageid=2">2</a></li>
    <li class="page-item"><a class="page-link" href="HomeForward?pageid=3">3</a></li>
    <li class="page-item"><a class="page-link" href="HomeForward?pageid=${pageidnumber+1}">&raquo;</a></li>
  </ul>
  </div>
 <section>
  <!-- ================ trending product section end ================= -->
 </section>
	<!-- ================ Best Selling item  carousel ================= -->
	<!--<jsp:include page="topProduct.jsp"></jsp:include>-->
    <!-- ================ End Best Selling item  carousel ================= -->

	<!-- ================ Subscribe section start ================= --> 
	<jsp:include page="notifyemail.jsp"></jsp:include>
	 <!-- ================ Subscribe section end ================= --> 

	<!--================ Start footer Area  =================-->
	<jsp:include page="footer.jsp"></jsp:include>
	<!--================ End footer Area  =================-->

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

	<script src="Template/Front/vendors/jquery/jquery-3.2.1.min.js"></script>
	<script src="Template/Front/vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="Template/Front/vendors/skrollr.min.js"></script>
	<script src="Template/Front/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script
		src="Template/Front/vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="Template/Front/vendors/jquery.ajaxchimp.min.js"></script>
	<script src="Template/Front/vendors/mail-script.js"></script>
	<script src="Template/Front/js/main.js"></script>
</body>
</html>