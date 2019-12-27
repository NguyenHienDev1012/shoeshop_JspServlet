<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sản phẩm yêu thích</title>
<link rel="icon" href="Template/Front/img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="Template/Front/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="Template/Front/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="Template/Front/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="Template/Front/vendors/linericon/style.css">
<link rel="stylesheet" href="Template/Front/vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="Template/Front/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="Template/Front/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="Template/Front/css/style.css">
<!--  drop down-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
</head>
<body>
<div id="fb-root"></div>
	<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v4.0"></script>
	<!--================ Start Header Menu Area =================-->
	<jsp:include page="header.jsp"></jsp:include>
	<!--================ End Header Menu Area =================-->
	<!-- ================ start banner area ================= -->
	<section>
	<div class="container">
		<nav aria-label="breadcrumb" style="margin-top:25px;">
		<ol class="breadcrumb" style="background: #f2f2f2;">
			<li class="breadcrumb-item"><a href="#">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Sản phẩm yêu thích</li>
		</ol>
		</nav>
	</div>
	</section>
	<!-- ================ end banner area ================= -->
	<!--================Cart Area =================-->
	<section class="cart_area" style="padding-top:5px;">
	<div class="container">
		<div class="table-responsive">
			
		
			<table style="margin-top: 12px" id="dataTable"
				class="table table-bordered table-condensed table-hover table-striped">
							<thead>
								<tr>
									<th>Mã</th>
									<th>Tên</th>
									<th>Hình ảnh</th>
									<th>Giá</th>
									<th>Thao tác</th>
								</tr>
							</thead>
				         <tbody>
				     	<c:choose>
							<c:when test="${ not empty list_product_user_tym}">
							  	<c:forEach items="${list_product_user_tym }" var="product_tym">
									  <tr>
										<td>${product_tym.id}</td>
										<td>${product_tym.name}</td>
										<td><img src="Image/${product_tym.images}" alt="" style="width: 120px"></td>
										<td><fmt:formatNumber value="${product_tym.price}" type = "number" minFractionDigits = "0"/> VNĐ</td>
										
										<td> <c:url var="url" value="CartController"></c:url>  <a class="btn btn-warning" style="color: white" href="${url}?id_Product=${product_tym.id}"><i class="fa fa-cart-plus" ></i>&nbsp; Thêm</a> &nbsp;
										<a class="btn btn-danger" data-toggle="modal" data-target="#myModal${product_tym.id}${product_tym.id}" style="color: white"><i class="fa fa-remove" ></i>&nbsp;Xoá</a></td>
									</tr>
									<!-- Modal -->
										  <div class="modal fade" id="myModal${product_tym.id}${product_tym.id}" role="dialog">
											 <div class="modal-dialog">
												  <!-- Modal content-->
													  <div class="modal-content" style="margin-top: 120px">
													        <div class="modal-header">
													        	 <h5  class="modal-title" style="margin-left: 180px">Thông báo</h5>
													        	</div>
													        <div class="modal-body">
													          	<p>Bạn có chắc muốn xóa :</p>
													         	 <p><b>${product_tym.name}</b> <img src="Image/${product_tym.images}" alt="Hình sản phẩm" style="width: 90px">  khỏi sản phẩm yêu thích ?</p>
													        </div>
													        <div class="modal-footer">
													          	<a class="btn btn-danger" href="RemoveProductDropHeart?id_product_tym=${product_tym.id}" style="color: #fff;">&nbsp;Có</a>
													            <button  class="btn btn-warning" type="button" class="btn btn-default" data-dismiss="modal" style="color: #fff;"><i class="fa fa-remove">&nbsp;</i>Hủy</button>
													        </div>
													   </div>
												 </div>
										    </div>
				                   <!-- End modal -->
									  
								  </c:forEach>
							   </c:when>
												  <c:otherwise>
							                        <h4 style="margin-left: 400px" ><span style="color: red">Bạn chưa có sản phẩm yêu thích nào.</span></h4><br> 
												  </c:otherwise>
                   </c:choose>
                   </tbody>
                   </table>
                   <br><br>   
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
	<script src="Template/Front/vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="Template/Front/vendors/jquery.ajaxchimp.min.js"></script>
	<script src="Template/Front/vendors/mail-script.js"></script>
	<script src="Template/Front/js/main.js"></script>
</body>
</html>