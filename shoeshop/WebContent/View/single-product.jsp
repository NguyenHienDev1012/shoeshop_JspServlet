<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <jsp:useBean id="now" class="java.util.Date" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chi tiết sản phẩm</title>
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
  
  
   <style>
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
    function showDiv() {
	  document.getElementById('hello').style.display = "block";
	}
  </script>
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
				<nav aria-label="breadcrumb" style="margin-top:15px; margin-bottom:0px">
				<ol class="breadcrumb" style="background: #f2f2f2;">
					<li class="breadcrumb-item" aria-current="page"><a href="#">Trang chủ</a></li>
					<li class="breadcrumb-item" aria-current="page"> <a href = "#">Sản phẩm</a></li>
					<li class="breadcrumb-item active">Chi tiết sản phẩm</li>
				</ol>
				</nav>
			</div>
	</section>
	<!-- ================ end banner area ================= -->
  <!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-5">
					<div class="owl-carousel owl-theme s_Product_carousel">
						<div class="single-prd-item" >
							<img src="Image/${product.images}" alt="" style="width:500px;height:300px;  ">
						</div>
					</div>
				</div>
				
				<div class="col-lg-6 offset-lg-1">
					<div class="s_product_text">
					<h3>Thông tin chi tiết</h3>
					<table class="table table-bordered">
						<tr>
							<th>Tên</th>
							<td>${product.name}</td>

						</tr>
						<tr>
							<th>Giá</th>
							<td><fmt:formatNumber value="${product.price}" type = "number" minFractionDigits = "0"/>Vnđ</td>
						</tr>
						<tr>
							<th>Loại giày</th>
							<td>${product.id_Category}</td>
						</tr>
						<tr>
							<th>Tình trạng</th>
							<td>${product.quantity}</td>
						</tr>
							<tr>
							<th>Size</th>
							<td>
							<select>
  									<option value="38">38</option>
 									<option value="39">39</option>
  									<option value="40" selected>40</option>
							</select>
							</td>

						</tr>
				</table>
						<div>
                         <label for="qty"><b>Số lượng:</b></label>
							<input type="number" name="qty"   min="1" max="10" value="1" title="Quantity:"  ><br>
							<button style="background-color:#ffb916;color: white;width: 160px;height: 40px;" onclick="checksessionexiststoaddProductInCart(id_product=${product.id})"><i class="fa fa-arrow-right"></i>&nbsp;Mua ngay</button> 
							 <button style="background-color:#f36e36;color: white;width: 200px;height: 40px;" onclick="checksessionexiststoaddProductInCart(id_product=${product.id})"><i class="fa fa-shopping-cart"></i>&nbsp;Thêm vào giỏ</button> 
							   <!-- Modal add product -->   
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
							   <!-- end modal -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Mô tả</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
					 aria-selected="false">Thông số</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="contact-tab" data-toggle="tab" href="#comment"" role="tab" aria-controls="contact"
					 aria-selected="false">Bình luận</a>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					${product.description}
				</div>
				<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
				</div>
				<div class="tab-pane fade" id="comment" role="tabpanel" aria-labelledby="contact-tab">
				<c:choose>
				  <c:when test="${not empty sessionName}">
				  <div class="row">
						<div class="col-lg-8">
							<div class="comment_list">
							    <div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-1.png" alt="">
										</div>
										<div class="media-body">
											<form method="POST"  action="CommentController?id_Product=${product.id}">
											     <input type="text" name="content" required style="border-radius: 15px; background-color: #f2f3f5; width: 324px;height: 32px">
											    </form>
										</div>
									</div>
								</div>
								
								<c:forEach items="${listComment}" var="comment">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-1.png" alt="">
										</div>
										<div class="media-body">
											<h4 style="color: #385898">${comment.name}</h4>
											<a class="reply_btn"  onclick="showDiv()" >Trả lời</a>
										</div>
									</div>
									<p style="margin-left: 15px"><i>${comment.content}</i></p>
								</div>
							
								<div class="review_item reply">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-2.png" alt="">
										</div>
										<div class="media-body">
												<form style="display:none;" id="hello" method="POST" action="ReplyCommentController?id_cmt=${comment.id}&id_Product=${product.id}">
												<h4 style="color: #385898">${sessionName}</h4>
											     <input  type="text" value="@${comment.name}: " name="content" required style="border-radius: 15px ;background-color: #f2f3f5; width: 324px;height: 32px">
											    </form>
										</div>
									</div>
									<c:forEach items="${comment.listReplyComment}" var="reply">
									<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-1.png" alt="">
										</div>
										<div class="media-body">
											<h4 style="color: #385898">${reply.cmt.name}</h4>
											<a class="reply_btn" onclick="showDiv()" >Trả lời</a>
										</div>
									</div>
									<p style="margin-left: 15px"><i>${reply.cmt.content}</i></p>
								</div>
								</c:forEach>	
									
								</div>
						</c:forEach>
							</div>
						</div>
					</div>
				  
				  </c:when>
				  <c:otherwise>
				     <p> Bạn phải đăng nhập để thực hiện tính năng này. <span>Mời bạn đăng nhập <a href="LoginController#login">tại đây.</a></span></p>
				     
				  </c:otherwise>
				      
				  
				</c:choose>
				</div>
			
			</div>
		</div>
	</section>
	<!--================End Product Description Area =================-->
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