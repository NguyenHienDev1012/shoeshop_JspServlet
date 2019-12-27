<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>
	<link rel="icon" href="Template/Front/img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="Template/Front/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="Template/Front/vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="Template/Front/vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="Template/Front/vendors/linericon/style.css">
  <link rel="stylesheet" href="Template/Front/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="Template/Front/vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="Template/Front/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="Template/Front/vendors/nouislider/nouislider.min.css">

  <link rel="stylesheet" href="Template/Front/css/style.css">
</head>
<script type="text/javascript">
    function validate() {
    	var name=document.myform.username.value;
    	var password=document.myform.password.value;
        
        if (name=="" || email=="" || password =="" || confirmPassword=="" ) {
            alert('Hãy nhập đầy đủ thông tin!');
            return false;
        }
    }
</script>

<body>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v4.0"></script>

	<!--================ Start Header Menu Area =================-->
	<jsp:include page="header.jsp"></jsp:include>
  
	<!--================ End Header Menu Area =================-->
  
  
  
  <!--================Login Box Area =================-->
	<section class="login_box_area section-margin" id="login">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<div class="hover">
							<h4>Bạn là khách hàng mới?</h4>
							<p>Cửa hàng chúng tôi rất hân hạnh được phục vụ quý khách!</p>
							<a class="button button-account" href="RegisterController#register">Tạo tài khoản</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>Mời bạn nhập</h3>
						 <c:choose>
		 				    <c:when test="${not empty messagelogin}"><h5 style="color: red; text-align: center">${messagelogin}</h5></c:when> 
		   				    <c:otherwise></c:otherwise> 
                          </c:choose>
                          <c:choose>
		 				    <c:when test="${not empty nopermission}"><h5 style="color: red; text-align: center">${nopermission}</h5></c:when> 
		   				    <c:otherwise></c:otherwise> 
                          </c:choose>
                  
						<form class="row login_form" action="LoginController" id="contactForm"  method="post" name="myform" onsubmit="return validate()">
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="name" name="username" placeholder="Tên đăng nhập" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Tên đăng nhập'">
							</div>
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="name" name="password" placeholder="Mật khẩu" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Mật khẩu'">
							</div>
							<div class="col-md-12 form-group">
								<div class="creat_account">
									<input type="checkbox" id="f-option2" name="selector">
									<label for="f-option2">Keep me logged in</label>
								</div>
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="button button-login w-100">Đăng nhập</button>
								<a href="ForgotPassword">Quên mật khẩu?</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->



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