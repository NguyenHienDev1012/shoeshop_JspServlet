<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="cartDaoImpl" class="dao.CartDaoImpl" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Thanh toán</title>
<link rel="icon" href="img/Fevicon.png" type="image/png">
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
<link rel="stylesheet"
	href="Template/Front/vendors/nice-select/nice-select.css">
<link rel="stylesheet"
	href="Template/Front/vendors/nouislider/nouislider.min.css">
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
<style>
body {
	color: #666666;
	background: #ecf0f1;
}

a, a:link, a:visited {
	color: #0082dd;
	text-decoration: none
}

.logo-checkout {
	margin: 10px 0 20px;
}

.fa, .fas {
	color: #717171;
}

.content-checkout {
	background: #fff;
	padding: 10px 0 20px;
	margin-bottom: 50px
}

.content-checkout h2, .content-checkout h3 {
	margin: 10px 0px;
	font-size: 20px;
	padding: 0px;
	font-weight: bold;
	color: #333;
}

.form-checkout {
	border: 1px solid #d2d2d2;
	padding: 15px 0;
}

.form-checkout .form-group {
	width: 100%;
	margin-bottom: 20px;
}

.form-inline label {
	justify-content: left;
	color: #232323;
	font-size: 9px;
}

.form-inline .form-control {
	width: 100%;
	font-size: 14px;
}

.p-r-0 {
	padding-right: 0
}

.form-inline {
	display: -ms-flexbox;
	display: unset;
}

label.radio-inline {
	padding-left: 10px;
	margin-bottom: 10px;
}

label span {
	color: red;
	position: absolute;
	right: 0;
}

label.radio-inline:last-child {
	margin-bottom: 0;
}

input[type=checkbox], input[type=radio] {
	margin-right: 10px;
}

.item_checkout {
	font-size: 14px;
	color: #666666;
	display: inline-block;
	vertical-align: top;
	margin-top: 2px;
	text-transform: lowercase;
}

.table td {
	padding: .75rem;
	vertical-align: middle;
	border-top: none;
	font-size: 14px;
	color: #272727;
}

.table tr {
	border-bottom: 1px solid #ddd;
}

.table tr:last-child {
	border-bottom: none;
}

.table .total {
	background: #d4d4d4;
}

.table {
	margin-bottom: 0
}

.text-bold {
	font-weight: 600
}

.btn-checkout {
	font-size: 18px;
	width: 100%;
	background-color: #EF7741;
	color: #fff;
	padding: 8px 0;
	margin-top: 20px;
	cursor: pointer;
}

.btn-checkout:hover {
	opacity: .8;
}
</style>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
</head>
<body>
	<div id="fb-root"></div>
	<script async defer crossorigin="anonymouss"
		src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v4.0"></script>

	<!--================ Start Header Menu Area =================-->
	<jsp:include page="header.jsp"></jsp:include>
	<!--================ End Header Menu Area =================-->
	 <c:url var="url" value="CheckoutController"></c:url>
	<form action="${url}" method="post">
		<div class="container">
			<div class="row content-checkout">
				<div class="col-sm-6">

					<h2>THÔNG TIN KHÁCH HÀNG</h2>

					<div class="form-checkout">
						<div class="row">
							<div class="col-md-3" style="margin-left: 25px">
								<label for="fullname">Họ và tên :<span>*</span>
								</label>
							</div>
							<div class="col-md-8">
								<input class="form-control" name="fullname" id="fullname"
									type="text" value="${user.name }">
							</div>
						</div>
						<br>
						<div class="form-group">
							<div class="row">
								<div class="col-md-3" style="margin-left: 25px">
									<label for="phone">Điện thoại :<span>*</span>
									</label>
								</div>

								<div class="col-md-8">

									<input name="phonenumber" class="form-control" id="phone"
										type="text" placeholder="Số điện thoại liên lạc khi nhận hàng">
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="row">
								<div class="col-md-3" style="margin-left: 25px">
									<label for="email">Email :</label>
								</div>
								<div class="col-md-8">

									<input class="form-control" id="email" name="email"
										type="email" value="${user.email }">
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="row">
								<div class="col-md-3" style="margin-left: 25px">
									<label for="address">Địa chỉ :<span>*</span>
									</label>
								</div>
								<div class="col-md-8">
									<input required="" class="form-control" name="address"
										id="address" type="text"
										placeholder="Lầu/Tầng, Số nhà, Đường, Phường hoặc Ấp, Thôn, Xóm"
										value="">
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="row">
								<div class="col-md-3" style="margin-left: 25px">
									<label for="note">Ghi chú :</label>
								</div>
								<div class="col-sm-8">
									<textarea class="form-control" name="notes" rows="5" id="note"
										placeholder="Có lưu ý nào cho chúng tôi khi giao hàng, xin hãy ghi ở đây"
										style="margin-top: 0px; margin-bottom: 0px; height: 82px;"></textarea>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="col-sm-6">
					<h2>THANH TOÁN</h2>
					<div class="form-checkout">
						<label class="radio-inline"><input value="1"
							type="radio" name="payment" checked="">Thanh toán khi
							giao hàng (COD)</label> <label class="radio-inline"><input
							value="2" type="radio" name="payment">Chuyển
							khoản ngân hàng</label>


					</div>
					<h2>
						ĐƠN HÀNG <span class="item_checkout">(${cartDaoImpl.numberProductInCart(order) }
							sản phẩm)</span>
					</h2>
					<div class="form-checkout" style="padding: 15px 0 0">

						<div class="table-responsive">


							<table class="table">
								<tbody>
									<c:forEach items="${order}" var="item">

										<tr>
											<td><input
												onchange="return update_qty('a7147fad6a282a0edd8d24e3b4aec2fc')"
												id="a7147fad6a282a0edd8d24e3b4aec2fc" style="width: 43px;"
												type="number" min="1" max="100" value="${item.quantity }">
												x ${item.product.name } </td>
											<td class="text-right"><fmt:formatNumber
													value="${item.product.price}" type="number"
													minFractionDigits="0" /> VNĐ
											<td>
										</tr>
									</c:forEach>
									<tr>
										<td><b>Tạm tính</b></td>
										<td class="text-right text-bold"><fmt:formatNumber
												value="${cartDaoImpl.totalPriceOfCart(order)}" type="number"
												minFractionDigits="0" /> VNĐ</td>
									</tr>
									<tr>

										<td>Phí vận chuyển <br> <span id="shippingtitle"
											style="font-size: 0.8em; color: #6d6d6d;">* Miễn phí
												vận chuyển</span>
										</td>
										<td class="text-right"><span id="shippingfee">
												Miễn phí </span></td>

									</tr>

									<tr>

										<td colspan="2" class="msg-coupon"></td>

									</tr>
									<tr class="total">
										<td><b>TỔNG CỘNG</b></td>
										<td class="text-right text-bold"><span id="total"><fmt:formatNumber
													value="${cartDaoImpl.totalPriceOfCart(order)}"
													type="number" minFractionDigits="0" /> VNĐ</span></td>
									</tr>
								</tbody>
							</table>

						</div>

					</div>


					<button type="submit" id="checkout" class="btn-checkout"
						name="order" value="1">ĐẶT HÀNG</button>

				</div>

			</div>

		</div>
	</form>
	<!-- ================ start banner area ================= -->
	<section id="category"> </section>
	<!-- ================ end banner area ================= -->


	<!--================Checkout Area =================-->
	<section class="checkout_area section-margin--small"> </section>
	<!--================End Checkout Area =================-->



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