<%@page import="db.DBConnection"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="cartDaoImpl" class="dao.CartDaoImpl" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Giỏ hàng</title>
<link rel="icon" href="Template/Front/img/Fevicon.png" type="image/png">
<link rel="stylesheet"
	href="Template/Front/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="Template/Front/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="Template/Front/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="Template/Front/vendors/linericon/style.css">
<link rel="stylesheet"
	href="Template/Front/vendors/nice-select/nice-select.css">
<link rel="stylesheet"
	href="Template/Front/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="Template/Front/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="Template/Front/css/style.css">
<!--  drop down-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script>
        <c:url var="url" value="UpdateCartController"></c:url>
		function myChangeQuantity(value) {
	             document.location.href="${url}?quantity="+value+"&id_product="+idproduct;
	    }
	</script>
	
	   <script type="text/javascript">
	   <c:url var="url" value="CheckoutController"></c:url>
	   		function checksessionexistsToCheckout() {
	  		 	var noticeToUser ="Bạn phải đăng nhập để thực hiện chức năng này!";
				var session = '<%=(String)session.getAttribute("sessionName")%>';
		   		  if(session == 'null'){
			  	  $('#myModal').modal('show');
		 		 }
				  else{
        	 		 document.location.href="${url}";
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
	<!-- ================ start banner area ================= -->
	<section>
	<div class="container">
		<nav aria-label="breadcrumb" style="margin-top:25px;">
		<ol class="breadcrumb" style="background: #f2f2f2;">
			<li class="breadcrumb-item"><a href="#">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Liên hệ</li>
		</ol>
		</nav>
	</div>
	</section>
	<!-- ================ end banner area ================= -->
	<!--================Cart Area =================-->
	<section class="cart_area" style="padding-top:5px;">
	<div class="container">
		<div class="table-responsive">

			<c:choose>
				<c:when test="${not empty messageBuyProduct}">
					<h4 style="color: red; text-align: center">${messageBuyProduct}</h4>
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>

           <c:url var="url" value="CategoryController?pageid=1#category"></c:url> 
			<a style="margin-right: 20px" class="btn btn-success"
				href="${url}"><i
				class="fa fa-arrow-left"></i>&nbsp; Tiếp tục mua hàng</a>
			<table style="margin-top: 12px" id="dataTable"
				class="table table-bordered table-condensed table-hover table-striped">
				<thead>
					<tr>
						<th title="Số thứ tự">STT</th>
						<th>Mã</th>
						<th>Tên</th>
						<th>Hình ảnh</th>
						<th>Giá</th>
						<th>Số lượng</th>
						<th>Tổng giá</th>
						<th>Thao tác</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${ not empty order}">
							<c:forEach items="${order }" var="item">
								<tr>
									<td></td>
									<td>${item.product.id}</td>
									<td>${item.product.name}</td>
									<td><img src="Image/${item.product.images}" alt=""
										style="width: 120px"></td>
									<td><fmt:formatNumber value="${item.product.price}"
											type="number" minFractionDigits="0" /> Vnđ</td>
									<td><input type="number" id="quantity"
										onchange="myChangeQuantity(this.value,idproduct=${item.product.id})"
										name="Số lượng" min="1" max="10" value="${item.quantity}"
										title="Quantity:"></td>
									<td><fmt:formatNumber
											value="${cartDaoImpl.totalPrice(item)}" type="number"
											minFractionDigits="0" /> Vnđ</td>

									<td><a class="btn btn-danger" data-toggle="modal"
										data-target="#myModal${item.product.id}1" style="color: white"><i
											class="fa fa-remove"></i>&nbsp; Xoá</a></td>
								</tr>
								<!-- Modal -->
								<div class="modal fade" id="myModal${item.product.id}1" role="dialog">
									<div class="modal-dialog">
										<!-- Modal content-->
										<div class="modal-content" style="margin-top: 120px">
											<div class="modal-header">
												<h5 class="modal-title" style="margin-left: 180px">Thông
													báo</h5>
											</div>
											<div class="modal-body">
												<p>Bạn có chắc muốn xóa :</p>
												<p>
													<b>${item.product.name}</b> <img
														src="Image/${item.product.images}" alt="Hình sản phẩm"
														style="width: 90px"> khỏi giỏ hàng?
												</p>
											</div>
											<div class="modal-footer">
											 <c:url var="url" value="RemoveProductController"></c:url>
												<a class="btn btn-danger"
													href="${url}?id_product=${item.product.id}"
													style="color: #fff;">&nbsp;Có</a>
												<button class="btn btn-warning" type="button"
													class="btn btn-default" data-dismiss="modal"
													style="color: #fff;">
													<i class="fa fa-remove">&nbsp;</i>Hủy
												</button>
											</div>
										</div>
									</div>
								</div>
								<!-- End modal -->

							</c:forEach>
						</c:when>
						<c:otherwise>
							<h4 style="margin-left: 400px">Bạn chưa có sản phẩm nào
								trong giỏ hàng</h4>
							<br>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<br>
			<br>

			<c:choose>
				<c:when test="${not empty order}">
					<h5 style="margin-left: 850px">
						Tổng cộng: &nbsp; &nbsp;
						<fmt:formatNumber value="${cartDaoImpl.totalPriceOfCart(order)}"
							type="number" minFractionDigits="0" />
						Vnđ


					</h5>
				</c:when>
				<c:otherwise>
					<h5 style="margin-left: 850px">Tổng cộng: &nbsp; &nbsp;0 Vnđ</h5>
				</c:otherwise>
			</c:choose>

			<a class="btn btn-danger" href="RemoveAllProductInCart"
				style="margin-left: 380px"> <i class="fa fa-remove"></i>&nbsp;Xóa
				tất cả
			</a> <button class="btn btn-warning"
				style="color: white" onclick="checksessionexistsToCheckout()"><i class="fa fa-check-square-o"></i>&nbsp;Thanh
				toán</button>
				<!-- Modal checkout -->
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
				<!-- End modal checkout -->
		</div>
	</div>
	</section>
	<!--================End Cart Area =================-->
	<!--================ Start footer Area  =================-->
	<jsp:include page="footer.jsp"></jsp:include>
	<!--================ End footer Area  =================-->
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