<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sản phẩm giảm giá nhiều</title>
</head>
<body>
<section class="section-margin calc-60px">
	<div class="container">
		<div class="section-intro pb-60px">
			<h3> Sản phẩm giảm giá nhiều
			</h3>
		</div>
		<div class="owl-carousel owl-theme" id="bestSellerCarousel">
		
		<c:forEach items="${listProducts}" var="l">
			<div class="card text-center card-product">
				<div class="card-product__img">
					<img class="img-fluid"
						src="Image/${l.images}" alt="">
					<ul class="card-product__imgOverlay">
						<li><button>
								<i class="ti-search"></i>
							</button></li>
						<li><button>
								<i class="ti-shopping-cart"></i>
							</button></li>
						<li><button>
								<i class="ti-heart"></i>
							</button></li>
					</ul>
				</div>
				<div class="card-body">
					<h4 class="card-product__title">
						<a href="SingleProductController?id_Product=${l.id}">${l.name }</a>
					</h4>
					<p class="card-product__price">${l.price}</p>
				</div>
			</div>

			</c:forEach>
		</div>
	</div>
	</section> 
	
</body>
</html>