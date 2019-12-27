<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cập nhật thông tin khách hàng</title>
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
  <!--  drop down-->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
</head>
<body>
  
  <script type="text/javascript">
    function validate() {
    	var name=document.myform.name.value;
    	var email=document.myform.email.value;
    	var password=document.myform.password.value;
    	var confirmPassword=document.myform.confirmPassword.value;
        var email = document.getElementById('email');
        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        
        if (name=="" || email=="" || password =="" || confirmPassword=="" ) {
            alert('Hãy nhập đầy đủ thông tin!');
            return false;
        }
        else{
        	if(password.length<6){
        		document.getElementById("erropass").innerHTML="Độ dài mật khẩu phải >= 6";
        		 return false;
        	}
        	
        }
        if (!filter.test(email.value)) {
            alert('Hãy nhập địa chỉ email hợp lệ.\nexample@gmail.com');
            return false;
        }
        if(password !=confirmPassword){
        	 alert('Xác nhận password sai rồi!');
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
	<section class="login_box_area section-margin" id="register">
		<div class="container" style="text-align: center">
			<div class="row" >
				
				<div class="col-lg-12">
					<div class="login_form_inner register_form_inner">
						<h3>Cập nhật thông tin</h3>
						<h3 style="color: red"><%=request.getAttribute("messageupdateInfo")!=null?request.getAttribute("messageupdateInfo") :" " %></h3>
						<form class="row login_form" action="UpdateInforUser" id="register_form" method="post"  name="myform" onsubmit="return validate();">
							
							<div class="col-md-12 form-group">
							
							<input type="text" class="form-control" id="name" name="name" value="${infoToUserUpdate.name}" onfocus="this.placeholder = ''" readonly>
							</div>
							
							<div class="col-md-12 form-group">
							 <div class="col-md-3">
                               <label>Email: </label>
                            </div>
                          <div class="col-md-12">
						  <input class="form-control" id="email" name="email" value="${infoToUserUpdate.email}" placeholder="Email:   ${infoToUserUpdate.email}" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email:   ${infoToUserUpdate.email}'" >
                          </div>
              </div>
              
              <div class="col-md-12 form-group">
              
                             <div class="col-md-5">
                               <label>Mật khẩu mới:</label>
                            </div>
                             <div class="col-md-12">
							<input type="password" class="form-control" id="password" name="password" placeholder="Mật khẩu mới:" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Mật khẩu mới:'" >
								<p id="erropass" style="color: red"></p>
						    </div>
              </div>
              <div class="col-md-12 form-group">
                            <div class="col-md-6">
                               <label>Xác nhận mật khẩu:</label>
                            </div>
                           <div class="col-md-12">
						   <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Xác nhận mật khẩu:" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Xác nhận mật khẩu:'" >
							</div>
							</div>
							<div class="col-md-12 form-group">
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="button button-register w-100" >Cập nhật</button>
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