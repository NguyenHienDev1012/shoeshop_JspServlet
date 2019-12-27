<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Footer</title>
<style>
.show_phone_mobile {
    position: fixed;
    bottom: 10px;
    left: 20px;
    height: 35px;
    width: 150px;
    background:red;
    color: #fff;
    text-align: center;
    padding: 8px ;
    border-radius: 20px;
}

#myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: red;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
}

#myBtn:hover {
  background-color: #555;
}
</style>
</head>
<body>


<!--================ Start footer Area  =================-->	
	<footer class="footer">
		<div class="footer-area" style="height: 515px">
			<div class="container">
				<div class="row section_gap" >
					<div class="col-lg-3 col-md-6 col-sm-6" style=" margin-top: 150px">
						<div>
						<!-- Plugin chat with facebook -->
						<h4 class="footer_title">Fanpage</h4>
							<div class="fb-page" data-href="https://www.facebook.com/Shoeshop-109401420487949/?modal=admin_todo_tour" 
data-tabs="timeline" data-width="750px" data-height="100px" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
<blockquote cite="https://www.facebook.com/Shoeshop-109401420487949/?modal=admin_todo_tour" 
class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/Shoeshop-109401420487949/?modal=admin_todo_tour">Shoeshop</a></blockquote></div>
							
						</div>
				<div class="show_phone_mobile"><a href="tel:0907780999" title="Gọi ngay"><i class="fa  fa-phone"></i>&nbsp;  037.xxx.xxxx</a></div>
						
					</div>
					<div class="offset-lg-1 col-lg-2 col-md-6 col-sm-6" style=" margin-top: 150px">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Liên kết</h4>
							<ul class="list">
								<li><a href="HomeForward?pageid=1">Trang chủ</a></li>
								<li><a href="IntroduceController">Giới thiệu</a></li>
								<li><a href="HomeForward?pageid=1">Sản phẩm</a></li>
								<li><a href="ContactController#contact">Liên hệ</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-6 col-sm-6" style=" margin-top: 150px">
						<div class="single-footer-widget instafeed">
							<h4 class="footer_title">Hình ảnh</h4>
							<ul class="list instafeed d-flex flex-wrap">
								<li><img src="Image/adidas-yeezy-350-v2-static-replica.jpeg" alt="" style="width: 50px;height: 50px"></li>
								<li><img src="Image/canvas-old-skool-black.png" alt="" style="width: 50px;height: 50px"></li>
								<li><img src="Image/check-old-skool-white.png" alt="" style="width: 50px;height: 50px"></li>
								<li><img src="Image/Converse-navy-hi-00.jpg" alt="" style="width: 50px;height: 50px"></li>
								<li><img src="Image/Converse-red-hi-00.jpg" alt="" style="width: 50px;height: 50px"></li>
								<li><img src="Image/Converse-white-hi-00.jpg" alt="" style="width: 50px;height: 50px"></li>
							</ul>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-3 col-md-6 col-sm-6" style=" margin-top: 150px">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Liên hệ</h4>
							<div class="ml-40">
								<p class="sm-head">
									<span class="fa fa-location-arrow"></span>
									Văn phòng
								</p>
								<p>Trường Đại Học NL TP.HCM</p>
	
								<p class="sm-head">
									<span class="fa fa-phone"></span>
									Số điện thoại
								</p>
								<p>
									Hiền: +0343288735 <br>
                                    Nghĩa: +0338017738
								</p>
	
								<p class="sm-head">
									<span class="fa fa-envelope"></span>
									Email
								</p>
								<p>
									shoeshop.nlu@gmail.com<br>
									<!-- www.shoeshop.com -->
									<!-- Pass:shoeshop77 -->
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<div> 
<button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fa fa-angle-double-up"></i></button>

<script>
//Get the button
var mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
</script></div>
		<div class="footer-bottom">
			<div class="container">
				<div class="row d-flex">
					<p class="col-lg-12 footer-text text-center">
						
         Được thực hiện bởi: &copy;Nguyễn Hiền && Trọng Nghĩa  

				</div>
			</div>
		</div>
	</footer>
	</body>
	<!--================ End footer Area  =================-->