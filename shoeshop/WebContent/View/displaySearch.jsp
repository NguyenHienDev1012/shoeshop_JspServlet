<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Loại</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 <script src="Template/Front/js/jquery.twbsPagination.js" type="text/javascript"></script>

</head>
<body>

				<!-- Start Best Seller -->
				

					<c:forEach items="${listproductSearchByName}" var="product">
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
			<h5 style="color: red;margin-left: 180px;margin-top: 30px"><%=request.getAttribute("result")!=null?request.getAttribute("result") :" " %></h5>
	<!-- ================ category section end ================= -->
</body>
</html>