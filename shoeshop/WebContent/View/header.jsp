<%@page import="java.io.PrintWriter"%>
<%@page import="bean.Item"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CartDaoImpl"%>
<%@page import="java.text.NumberFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="cartDaoImpl" class="dao.CartDaoImpl" scope="request"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Header</title>

<!--  Drop down hello  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> Xund dot phan trang -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- End Drop down hello-->
<script>
  function checkorder(){
		  $('#myModal1').modal('show');
	  
  }
</script>
</head>
<body>
	<!--================ Start Header Menu Area =================-->
	<c:choose>
	   <c:when test="${empty sessionName }">
                    
	<header class="header_area">
	<div class="main_menu">
		<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container">
			<a class="navbar-brand logo_h" href="index.html"><img src="#"
				alt=""></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<div class="collapse navbar-collapse offset"
				id="navbarSupportedContent">
				<ul class="nav navbar-nav menu_nav  mr-auto">
				<li class="nav-item"> <c:url var="url" value="HomeForward?pageid=1"></c:url><a class="nav-link" href="${url}"> Trang chủ</a></li>
                <li class="nav-item"><c:url var="url" value="IntroduceController"></c:url><a class="nav-link" href="${url}">Giới thiệu</a></li>
				<li class="nav-item "><c:url var="url" value="CategoryController?pageid=1"></c:url><a class="nav-link" 	href="${url}">Sản phẩm</a></li>
				<li class="nav-item"><c:url var="url" value="ContactController#contact"></c:url><a class="nav-link" href="${url}">Liên hệ</a></li>
				</ul>

				<ul class="nav-shop">
						<c:choose>
					        <c:when test="${ not empty order}">
                         <li class="nav-item"><button onclick="checkorder()">
							<i class="ti-shopping-cart"></i><span class="nav-shop__circle" style="color: white;"> ${cartDaoImpl. numberProductInCart(order)}</span>
						</button></li>
						 </c:when>
                       <c:otherwise>

						<li class="nav-item"><button onclick="checkorder()">
						<i class="ti-shopping-cart"></i><span class="nav-shop__circle" style="color: white">0</span>
						</button></li>
						
						</c:otherwise>
						</c:choose>
					<li class="nav-item"><a class="button button-header"
						href="RegisterController#register">Đăng	ký </a></li>
					<li class="nav-item"><a class="button button-header"
						href="LoginController#login"><span>Đăng nhập</span></a></li>

				</ul>
			</div>
		</div>
		</nav>
	</div>
	</header>
	</c:when>
	
	<c:otherwise>
	<header class="header_area">
	<div class="main_menu">
		<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container">
			<a class="navbar-brand logo_h" href="index.html"><img
				src="img/logo.png" alt=""></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<div class="collapse navbar-collapse offset"
				id="navbarSupportedContent">
				<ul class="nav navbar-nav menu_nav ml-auto mr-auto">
				<li class="nav-item"> <c:url var="url" value="HomeForward?pageid=1"></c:url><a class="nav-link" href="${url}"> Trang chủ</a></li>
                <li class="nav-item"><c:url var="url" value="IntroduceController"></c:url><a class="nav-link" href="${url}">Giới thiệu</a></li>
				<li class="nav-item "><c:url var="url" value="CategoryController?pageid=1"></c:url><a class="nav-link" 	href="${url}">Sản phẩm</a></li>
				<li class="nav-item"><c:url var="url" value="ContactController#contact"></c:url><a class="nav-link" href="${url}">Liên hệ</a></li>
					<li class="nav-item"><a class="nav-link"
						href="ContactController#contact" style="visibility: hidden;">Liên
							hệ</a></li>
				</ul>


				<ul class="nav-shop">
					<li class="nav-item"><a class="button button-header"
						href="RegisterController#register"
						style="border-color: black; background-color: #92eaf9; visibility: hidden;">Đăng
							ký</a></li>
					<c:choose>
					 <c:when test="${ not empty order}">
                      <li class="nav-item"><button onclick="checkorder()">
							<i class="ti-shopping-cart"></i><span class="nav-shop__circle" style="color: white;"> ${cartDaoImpl. numberProductInCart(order)}</span>
						</button></li>
						</c:when>
						   <c:otherwise>

						<li class="nav-item"><button onclick="checkorder()">
						<i class="ti-shopping-cart"></i><span class="nav-shop__circle" style="color: white">0</span>
						</button></li>
						
						</c:otherwise>
						</c:choose>
						
					<li>
						<div class="dropdown">
							<a
								style="border-radius: 90px; width: auto; height: 42px; background-color: white"
								class="btn btn-primary dropdown-toggle" data-toggle="dropdown"><span style="color: red">Chào
								bạn:&nbsp; ${sessionName}</span>
							</a>
							<div class="dropdown-menu">
							<c:url var="url" value="UpdateInforUser"></c:url><a class="dropdown-item" href="${url}">Cập nhật thông tin</a> 
							<c:url var="url" value="UserTymForward"></c:url> <a class="dropdown-item" href="${url}">Sản phẩm yêu thích</a> 
							<c:url var="url" value="LogoutController"></c:url><a class="dropdown-item" href="${url}">Đăng xuất</a>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
		</nav>
	</div>
	</header>

	</c:otherwise>
	</c:choose>
	<!--================ End Header Menu Area =================-->
    <div class="modal fade" id="myModal1"  style="margin-top: 120px" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" >
          <h5 class="modal-title" style="margin-left: 150px" >Giỏ hàng của bạn</h5>
        </div>
        <div class="modal-body">
        <c:choose>
        <c:when test="${ not empty order}">
        	<c:forEach items="${order }" var="item">
              <p>${item.product.name}&nbsp;&nbsp;<img src="Image/${item.product.images}" alt="Hình sản phẩm" style="width: 60px">&nbsp;
             ${item.quantity} &nbsp;x ${item.product.price} VNĐ</p>
                </c:forEach>
                   </c:when>
                <c:otherwise>
          <p>Chưa có sản phẩm nào trong giỏ hàng.</p>
          </c:otherwise>
             </c:choose>
        </div>
        <div class="modal-footer">
        <c:url var="url" value="CartForward"></c:url>
         <a class="btn btn-success"  style="color: #fff; background-color: #5cb85c; border-color: #4cae4c;"  href="${url}"><i class="fa fa-shopping-cart"></i>&nbsp;Xem giỏ hàng</a>
         <a  class="btn btn-danger"  class="fa fa-remove" data-dismiss="modal"  style="color: #fff;"><i class="fa fa-remove"></i>&nbsp;Thoát</a>
         
        </div>
      </div>
      
    </div>
  </div>

</body>
</html>